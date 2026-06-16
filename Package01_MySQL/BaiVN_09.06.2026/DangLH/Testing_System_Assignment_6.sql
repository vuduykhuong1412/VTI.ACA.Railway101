USE Testing_System_Assignment_2;
-- =====================================================================================
-- QUESTION 1: Chặn tạo Group trước 1 năm
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_PreventOldGroup
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
    IF (NEW.CreateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR)) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot create group older than 1 year';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 2: Không cho phép người dùng thêm bất kỳ user nào vào department "Sale"
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_PreventSaleUser
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    DECLARE v_SaleDeptID INT UNSIGNED;
    
    SELECT DepartmentID INTO v_SaleDeptID 
    FROM Department 
    WHERE DepartmentName = 'Sale' 
    LIMIT 1;
    
    IF (NEW.DepartmentID = v_SaleDeptID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 3: Cấu hình 1 group có nhiều nhất là 5 user
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_LimitUserInGroup
BEFORE INSERT ON GroupAccount
FOR EACH ROW
BEGIN
    DECLARE v_UserCount INT;
    
    SELECT COUNT(*) INTO v_UserCount 
    FROM GroupAccount 
    WHERE GroupID = NEW.GroupID;
    
    IF v_UserCount >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Group is full (max 5 users)';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_LimitQuestionInExam
BEFORE INSERT ON ExamQuestion
FOR EACH ROW
BEGIN
    DECLARE v_QuestionCount INT;
    
    SELECT COUNT(*) INTO v_QuestionCount 
    FROM ExamQuestion 
    WHERE ExamID = NEW.ExamID;
    
    IF v_QuestionCount >= 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exam is full (max 10 questions)';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 5: Cấm xóa tài khoản đặc quyền (Cập nhật theo dữ liệu thực tế: dang.le@vti.com.vn)
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_PreventDeleteAdmin
BEFORE DELETE ON Account
FOR EACH ROW
BEGIN
    IF (OLD.Email = 'dang.le@vti.com.vn') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete this vital creator account';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 6: Không điền departmentID thì tự động vào phòng ban chờ việc
-- (Thêm phòng ban mặc định trước để trigger không bị rỗng dữ liệu)
-- =====================================================================================
INSERT IGNORE INTO Department (DepartmentName) VALUES (N'Phòng ban chờ việc');

DELIMITER //
CREATE TRIGGER trg_SetDefaultDept
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    DECLARE v_DefaultDeptID INT UNSIGNED;

    IF (NEW.DepartmentID IS NULL) THEN
        SELECT DepartmentID INTO v_DefaultDeptID 
        FROM Department 
        WHERE DepartmentName = N'Phòng ban chờ việc'
        LIMIT 1;
        
        SET NEW.DepartmentID = v_DefaultDeptID;
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 7: Tối đa 4 answers cho mỗi question, tối đa 2 đáp án đúng (Kiểu BIT)
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_LimitAnswers
BEFORE INSERT ON Answer
FOR EACH ROW
BEGIN
    DECLARE v_CountAns INT;
    DECLARE v_CountCorrect INT;
    
    SELECT COUNT(*) INTO v_CountAns FROM Answer WHERE QuestionID = NEW.QuestionID;
    -- Kiểm tra bit b'1' tương ứng với true trong cột BIT
    SELECT COUNT(*) INTO v_CountCorrect FROM Answer WHERE QuestionID = NEW.QuestionID AND isCorrect = b'1';
    
    IF v_CountAns >= 4 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Max 4 answers per question';
    ELSEIF (NEW.isCorrect = b'1' AND v_CountCorrect >= 2) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Max 2 correct answers per question';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 8: Chuẩn hóa dữ liệu Gender (Cần ALTER TABLE trước vì ASM 2 chưa có cột này)
-- =====================================================================================
ALTER TABLE Account ADD COLUMN Gender VARCHAR(20);

DELIMITER //
CREATE TRIGGER trg_StandardizeGender
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    IF (NEW.Gender = N'nam' OR NEW.Gender = N'Nam') THEN 
        SET NEW.Gender = 'M';
    ELSEIF (NEW.Gender = N'nữ' OR NEW.Gender = N'Nữ') THEN 
        SET NEW.Gender = 'F';
    ELSE 
        SET NEW.Gender = 'U';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 9: Không cho phép xóa bài thi mới tạo được 2 ngày
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_PreventDeleteNewExam
BEFORE DELETE ON Exam
FOR EACH ROW
BEGIN
    IF (OLD.CreateDate > DATE_SUB(NOW(), INTERVAL 2 DAY)) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot delete exam created within 2 days';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 10: Chỉ cho phép update, delete câu hỏi chưa nằm trong exam nào
-- =====================================================================================
DELIMITER //
CREATE TRIGGER trg_RestrictQuestionUpdate
BEFORE UPDATE ON Question
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM ExamQuestion WHERE QuestionID = OLD.QuestionID) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot update question belonging to an exam';
    END IF;
END //

CREATE TRIGGER trg_RestrictQuestionDelete
BEFORE DELETE ON Question
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM ExamQuestion WHERE QuestionID = OLD.QuestionID) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot delete question belonging to an exam';
    END IF;
END //
DELIMITER ;
-- =====================================================================================
-- QUESTION 12: Phân loại thời gian Exam (CASE WHEN)
-- =====================================================================================
SELECT 
    ExamID, `Code`, Title, Duration,
    CASE 
        WHEN Duration <= 30 THEN 'Short time'
        WHEN Duration <= 60 THEN 'Medium time'
        ELSE 'Long time'
    END AS Duration_Type
FROM Exam;
-- =====================================================================================
-- QUESTION 13: Thống kê số account trong group kèm phân loại quy mô
-- =====================================================================================
SELECT 
    g.GroupID, 
    g.GroupName, 
    COUNT(ga.AccountID) AS Total_User,
    CASE 
        WHEN COUNT(ga.AccountID) <= 5 THEN 'few'
        WHEN COUNT(ga.AccountID) <= 20 THEN 'normal'
        ELSE 'higher'
    END AS the_number_user_amount
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY g.GroupID, g.GroupName;
-- =====================================================================================
-- QUESTION 14: Thống kê mỗi phòng ban có bao nhiêu user
-- =====================================================================================
SELECT 
    d.DepartmentName, 
    CASE 
        WHEN COUNT(a.AccountID) = 0 THEN 'Không có User'
        ELSE CAST(COUNT(a.AccountID) AS CHAR)
    END AS UserCount
FROM Department d
LEFT JOIN Account a ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;