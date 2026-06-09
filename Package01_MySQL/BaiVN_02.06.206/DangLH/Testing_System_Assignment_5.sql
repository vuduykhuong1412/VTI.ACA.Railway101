-- Question 1
DELIMITER //
CREATE PROCEDURE GetAccountsByDepartmentName(IN p_DepartmentName VARCHAR(50))
BEGIN
    SELECT a.* FROM `Account` a
    JOIN Department d ON a.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName = p_DepartmentName;
END //
DELIMITER ;
-- Question 2
DELIMITER //
CREATE PROCEDURE CountAccountInEachGroup()
BEGIN
    SELECT g.GroupID, g.GroupName, COUNT(ga.AccountID) AS TotalAccount
    FROM `Group` g
    LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
    GROUP BY g.GroupID, g.GroupName;
END //
DELIMITER ;
-- Question 3
DELIMITER //
CREATE PROCEDURE CountQuestionInCurrentMonth()
BEGIN
    SELECT tq.TypeID, tq.TypeName, COUNT(q.QuestionID) AS TotalQuestion
    FROM TypeQuestion tq
    LEFT JOIN Question q ON tq.TypeID = q.TypeID 
        AND MONTH(q.CreateDate) = MONTH(NOW()) 
        AND YEAR(q.CreateDate) = YEAR(NOW())
    GROUP BY tq.TypeID, tq.TypeName;
END //
DELIMITER ;
-- Question 4
DELIMITER //
CREATE PROCEDURE GetTypeIdWithMostQuestions(OUT p_TypeID INT)
BEGIN
    SELECT TypeID INTO p_TypeID
    FROM Question
    GROUP BY TypeID
    ORDER BY COUNT(QuestionID) DESC
    LIMIT 1;
END //
DELIMITER ;
-- Question 5
DELIMITER //
CREATE PROCEDURE GetTypeNameWithMostQuestions()
BEGIN
    DECLARE v_MaxTypeID INT;
    
    -- Gọi Store từ Question 4 để lấy ID câu hỏi nhiều nhất
    CALL GetTypeIdWithMostQuestions(v_MaxTypeID);
    
    -- Truy vấn lấy ra tên của Type tương ứng
    SELECT TypeName 
    FROM TypeQuestion 
    WHERE TypeID = v_MaxTypeID;
END //
DELIMITER ;
-- Question 6
DELIMITER //
CREATE PROCEDURE SearchGroupOrUser(IN p_SearchString VARCHAR(50))
BEGIN
    -- Tìm trong bảng Group
    SELECT GroupName AS ResultName, 'Group' AS Type 
    FROM `Group` 
    WHERE GroupName LIKE CONCAT('%', p_SearchString, '%')
    
    UNION ALL
    
    -- Tìm trong bảng Account
    SELECT Username AS ResultName, 'User' AS Type 
    FROM `Account` 
    WHERE Username LIKE CONCAT('%', p_SearchString, '%');
END //
DELIMITER ;
-- Question 7
DELIMITER //
CREATE PROCEDURE InsertAccountWithDefault(
    IN p_FullName VARCHAR(100),
    IN p_Email VARCHAR(50)
)
BEGIN
    DECLARE v_Username VARCHAR(50);
    DECLARE v_PositionID INT;
    DECLARE v_DepartmentID INT;
    
    -- Cắt chuỗi lấy phần trước ký tự '@' làm Username
    SET v_Username = SUBSTRING_INDEX(p_Email, '@', 1);
    
    -- Tìm ID của chức vụ 'Developer'
    SELECT PositionID INTO v_PositionID FROM `Position` WHERE PositionName = 'Developer' LIMIT 1;
    
    -- Tìm ID của phòng 'Phòng chờ'
    SELECT DepartmentID INTO v_DepartmentID FROM Department WHERE DepartmentName = 'Phòng chờ' LIMIT 1;
    
    -- Thực hiện chèn dữ liệu
    INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
    VALUES (p_Email, v_Username, p_FullName, v_DepartmentID, v_PositionID, NOW());
    
    -- In ra kết quả tạo thành công
    SELECT * FROM `Account` WHERE Email = p_Email;
END //
DELIMITER ;
-- Question 8
DELIMITER //
CREATE PROCEDURE GetLongestContentQuestion(IN p_TypeName VARCHAR(50))
BEGIN
    SELECT q.* FROM Question q
    JOIN TypeQuestion tq ON q.TypeID = tq.TypeID
    WHERE tq.TypeName = p_TypeName
      AND LENGTH(q.Content) = (
          SELECT MAX(LENGTH(Content)) 
          FROM Question q2
          WHERE q2.TypeID = tq.TypeID
      );
END //
DELIMITER ;
-- Question 9
DELIMITER //
CREATE PROCEDURE DeleteExamByID(IN p_ExamID INT)
BEGIN
    -- Xóa dữ liệu ở bảng trung gian liên kết trước để tránh lỗi Khóa ngoại (Foreign Key)
    DELETE FROM ExamQuestion WHERE ExamID = p_ExamID;
    
    -- Xóa tại bảng chính
    DELETE FROM Exam WHERE ExamID = p_ExamID;
END //
DELIMITER ;
-- Question 10
DELIMITER //
CREATE PROCEDURE DeleteOldExamsAndCount()
BEGIN
    DECLARE v_ExamID INT;
    DECLARE v_Done INT DEFAULT FALSE;
    DECLARE v_CountExamQuestion INT DEFAULT 0;
    DECLARE v_CountExam INT DEFAULT 0;
    
    -- Đếm số lượng bản ghi bị ảnh hưởng trước khi xóa
    SELECT COUNT(*) INTO v_CountExamQuestion 
    FROM ExamQuestion eq
    JOIN Exam e ON eq.ExamID = e.ExamID
    WHERE e.CreateDate <= DATE_SUB(NOW(), INTERVAL 3 YEAR);
    
    SELECT COUNT(*) INTO v_CountExam 
    FROM Exam 
    WHERE CreateDate <= DATE_SUB(NOW(), INTERVAL 3 YEAR);
    
    -- Sử dụng Cursor để duyệt qua danh sách các ExamID cần xóa
    BEGIN
        DECLARE cur CURSOR FOR 
            SELECT ExamID FROM Exam WHERE CreateDate <= DATE_SUB(NOW(), INTERVAL 3 YEAR);
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_Done = TRUE;
        
        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO v_ExamID;
            IF v_Done THEN
                LEAVE read_loop;
            END IF;
            
            -- Gọi Store câu 9 để tiến hành xóa từng Exam
            CALL DeleteExamByID(v_ExamID);
        END LOOP;
        CLOSE cur;
    END;
    
    -- In ra kết quả thống kê số record đã xóa
    SELECT 
        v_CountExamQuestion AS Deleted_ExamQuestion_Records,
        v_CountExam AS Deleted_Exam_Records,
        (v_CountExamQuestion + v_CountExam) AS Total_Deleted_Records;
END //
DELIMITER ;
-- Question 11
DELIMITER //
CREATE PROCEDURE DeleteDepartmentAndMoveAccounts(IN p_DepartmentName VARCHAR(50))
BEGIN
    DECLARE v_DelDeptID INT;
    DECLARE v_DefaultDeptID INT;
    
    -- Lấy ID phòng ban cần xóa
    SELECT DepartmentID INTO v_DelDeptID FROM Department WHERE DepartmentName = p_DepartmentName;
    
    -- Lấy ID phòng ban chờ việc (nếu chưa có thì tự tạo hoặc lấy mặc định)
    SELECT DepartmentID INTO v_DefaultDeptID FROM Department WHERE DepartmentName = 'Phòng ban chờ việc';
    
    -- 1. Cập nhật các Account thuộc phòng ban cũ sang phòng ban chờ việc
    UPDATE `Account` 
    SET DepartmentID = v_DefaultDeptID 
    WHERE DepartmentID = v_DelDeptID;
    
    -- 2. Tiến hành xóa phòng ban
    DELETE FROM Department WHERE DepartmentID = v_DelDeptID;
END //
DELIMITER ;
-- Question 12
DELIMITER //
CREATE PROCEDURE CountQuestionsPerMonthThisYear()
BEGIN
    SELECT m.Month, COUNT(q.QuestionID) AS TotalQuestion
    FROM (
        SELECT 1 AS Month UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
        UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 
        UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
    ) m
    LEFT JOIN Question q ON m.Month = MONTH(q.CreateDate) AND YEAR(q.CreateDate) = YEAR(NOW())
    GROUP BY m.Month
    ORDER BY m.Month;
END //
DELIMITER ;
-- Question 13
DELIMITER //
CREATE PROCEDURE CountQuestionsLast6Months()
BEGIN
    SELECT 
        DATE_FORMAT(m.MonthDate, '%Y-%m') AS `Month`,
        CASE 
            WHEN COUNT(q.QuestionID) = 0 THEN 'Không có câu hỏi nào trong tháng'
            ELSE CAST(COUNT(q.QuestionID) AS CHAR)
        END AS TotalQuestion
    FROM (
        SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 0 MONTH) AS MonthDate UNION
        SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) UNION
        SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 2 MONTH) UNION
        SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH) UNION
        SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 4 MONTH) UNION
        SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 5 MONTH)
    ) m
    LEFT JOIN Question q ON MONTH(m.MonthDate) = MONTH(q.CreateDate) AND YEAR(m.MonthDate) = YEAR(q.CreateDate)
    GROUP BY m.MonthDate
    ORDER BY m.MonthDate ASC;
END //
DELIMITER ;