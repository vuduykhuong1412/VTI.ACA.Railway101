-- QUESTION 1:
-- Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả account thuộc phòng ban đó
-- ( Cứ gọi tên phòng ban nào thì sẽ xuất hiện các account thuộc tên phòng ban đó)

DROP PROCEDURE IF EXISTS get_account_by_department_name;
DELIMITER $$
CREATE PROCEDURE  get_account_by_department_name(IN p_departmentName varchar(255))
BEGIN 
	SELECT a.*, d.departmentName
    FROM `account` a
    JOIN department d ON a.departmentID = d.departmentID
    WHERE d.departmentName = p_departmentName;
END $$
DELIMITER ;

CALL get_account_by_department_name(); -- chạy tên phòng ban cần tìm

-- QUESSTION 2:
-- Tạo store để in số lượng account mỗi group
-- (Tìm count account trong mỗi group)
-- Bảng Group gồm các tên cột thông tin group (groupid, groupname,creatorid,createdate)
-- Bảng groupaccount gồm các tên cột thuộc group (groupid.accountid,joindate)

DROP PROCEDURE IF EXISTS get_count_account_by_group;
DELIMITER $$
CREATE PROCEDURE get_count_account_by_group()
BEGIN
	SELECT g.groupid, g.groupname,
    COUNT(ga.accountid) AS total -- ( đếm số account trong mỗi group )
    FROM `group` g
    LEFT JOIN groupaccount ga -- ( dùng left join vì nếu có group chưa có account thì group vẫn hiện ra )
    ON g.groupid = ga.groupid
    GROUP BY g.groupid, g.groupname; -- (Gom dữ liệu theo từng group )
END $$
DELIMITER ;

CALL get_count_account_by_group();

-- Quesstion 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại.
-- Chưa làm được

-- Question 4: Procedure trả ra ID của type question có nhiều câu hỏi nhất
-- TypeQuestion(TypeID, TypeName)

DROP PROCEDURE IF EXISTS get_type_question_id_question;
DELIMITER $$
CREATE PROCEDURE get_type_question_id_question(OUT p_typeid INT)
BEGIN
	SELECT typeid -- Lấy typeid
    INTO p_typeid -- Gán vào biến đầu ra p_typeid
    FROM question
    GROUP BY typeid -- Gom các câu hỏi theo từng loại question
    ORDER BY COUNT(questionid) DESC -- Sắp sếp số lượng câu hỏi giảm dần
    LIMIT 1;
END $$
DELIMITER ;

CALL get_type_question_id_question(@type_id);
SELECT @type_id AS TypeID_Has_Most_Question;

SELECT DATABASE();

SHOW TABLES;



