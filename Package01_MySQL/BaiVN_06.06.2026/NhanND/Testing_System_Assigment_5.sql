USE testing_system_assignment_1;

-- Q1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đóalter
DELIMITER $$
CREATE PROCEDURE get_department_for_account(IN p_departmentName varchar(40))
BEGIN
	SELECT a.*
    FROM Account a
    JOIN Department d
    ON a.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName = p_departmentName;
END $$
DELIMITER ;

CALL get_department_for_account('Sale');

DROP PROCEDURE IF EXISTS get_department_for_account;

-- Q2: Tạo store để in ra số lượng account trong mỗi group
DELIMITER $$
CREATE PROCEDURE get_count_account_in_group()
BEGIN
	SELECT g.GroupID, g.GroupName, COUNT(ga.AccountID) AS SoLuong
    FROM `Group` g
    LEFT JOIN GroupAccount ga
    ON g.GroupID = ga.GroupID
    GROUP BY g.GroupID, g.GroupName;
END $$
DELIMITER ;

CALL get_count_account_in_group();

DROP PROCEDURE IF EXISTS get_count_account_in_group;
-- Q3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DELIMITER $$
CREATE PROCEDURE get_question_in_typequestion()
BEGIN
	SELECT tq.TypeID, tq.TypeName, COUNT(q.QuestionID) AS SoCauHoi
    FROM Question q
    RIGHT JOIN TypeQuestion tq
    ON q.TypeID = tq.TypeID
    WHERE MONTH(q.CreateDate) = 4
    GROUP BY tq.TypeID, tq.TypeName;
END $$
DELIMITER ;

CALL get_question_in_typequestion();

DROP PROCEDURE IF EXISTS get_question_in_typequestion;

-- Q4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DELIMITER $$

CREATE PROCEDURE get_type_max_question()
BEGIN
    SELECT TypeID
    FROM Question
    GROUP BY TypeID
    ORDER BY COUNT(*) DESC
    LIMIT 1;
END $$

DELIMITER ;

CALL get_type_max_question();

DROP PROCEDURE IF EXISTS get_type_max_question;
 
-- Q5: Sử dụng store ở question 4 để tìm ra tên của type question
DELIMITER $$

CREATE PROCEDURE get_type_name_max_question()
BEGIN
    SELECT tq.TypeName
    FROM TypeQuestion tq
    JOIN (
        SELECT TypeID
        FROM Question
        GROUP BY TypeID
        ORDER BY COUNT(*) DESC
        LIMIT 1
    ) t
    ON tq.TypeID = t.TypeID;
END $$

DELIMITER ;

CALL get_type_name_max_question();

DROP PROCEDURE IF EXISTS get_typename_max_question;

-- Q6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
DELIMITER $$

CREATE PROCEDURE search_group_or_user(
    IN p_keyword VARCHAR(50)
)
BEGIN

    SELECT *
    FROM `Group`
    WHERE GroupName LIKE CONCAT('%', p_keyword, '%');

    SELECT *
    FROM Account
    WHERE UserName LIKE CONCAT('%', p_keyword, '%');

END $$

DELIMITER ;

CALL search_group_or_user('Sale');

DROP PROCEDURE IF EXISTS search_group_or_user;

-- Q7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ
--     tự động gán:
-- 	   username sẽ giống email nhưng bỏ phần @..mail đi
--     positionID: sẽ có default là developer
--     departmentID: sẽ được cho vào 1 phòng chờ

-- Q8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê
--     câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- Q9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Q10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
--      Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
-- Q11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên
--      phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là
--      phòng ban chờ việc
-- Q12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
-- Q13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
--      (Nếu tháng nào không có thì sẽ in ra là &quot;không có câu hỏi nào trong tháng&quot;)

