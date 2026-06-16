-- question 1
DELIMITER //

CREATE PROCEDURE GetAccountByDepartment(
    IN p_department_name VARCHAR(50)
)
BEGIN
    SELECT a.*
    FROM Account a
    JOIN Department d ON a.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName = p_department_name;
END //

DELIMITER ;

-- question 2
DELIMITER //

CREATE PROCEDURE CountAccountInGroup()
BEGIN
    SELECT
        GroupID,
        COUNT(AccountID) AS TotalAccount
    FROM GroupAccount
    GROUP BY GroupID;
END //

DELIMITER ;

-- question 3
DELIMITER //

CREATE PROCEDURE CountQuestionByTypeCurrentMonth()
BEGIN
    SELECT
        tq.TypeName,
        COUNT(q.QuestionID) AS TotalQuestion
    FROM TypeQuestion tq
    LEFT JOIN Question q
        ON tq.TypeID = q.TypeID
    WHERE MONTH(q.CreateDate) = MONTH(CURDATE())
      AND YEAR(q.CreateDate) = YEAR(CURDATE())
    GROUP BY tq.TypeID, tq.TypeName;
END //

DELIMITER ;

-- question 4
DELIMITER //

CREATE PROCEDURE GetTypeQuestionMax()
BEGIN
    SELECT type_id
    FROM question
    GROUP BY type_id
    ORDER BY COUNT(*) DESC
    LIMIT 1;
END //

DELIMITER ;

-- question 5
DELIMITER $$

CREATE PROCEDURE sp_get_type_name_max_question()
BEGIN
    DECLARE v_type_id INT;

    CALL sp_get_type_id_max_question(v_type_id);

    SELECT type_name
    FROM typequestion
    WHERE type_id = v_type_id;

END $$

DELIMITER ;

-- question 6
DELIMITER //

CREATE PROCEDURE SearchGroupOrUser(
    IN p_keyword VARCHAR(100)
)
BEGIN

    SELECT *
    FROM `group`
    WHERE group_name LIKE CONCAT('%',p_keyword,'%');

    SELECT *
    FROM `account`
    WHERE user_name LIKE CONCAT('%',p_keyword,'%');

END //

DELIMITER ;

-- question 7
DELIMITER //

CREATE PROCEDURE InsertAccountAuto(
    IN p_fullname VARCHAR(100),
    IN p_email VARCHAR(100)
)
BEGIN

    DECLARE v_username VARCHAR(100);
    DECLARE v_position_id INT;
    DECLARE v_department_id INT;

    SET v_username =
        SUBSTRING_INDEX(p_email,'@',1);

    SELECT position_id
    INTO v_position_id
    FROM position
    WHERE position_name = 'Developer';

    SELECT department_id
    INTO v_department_id
    FROM department
    WHERE department_name = 'Waiting Room';

    INSERT INTO `account`(
        email,
        user_name,
        full_name,
        position_id,
        department_id,
        create_date
    )
    VALUES(
        p_email,
        v_username,
        p_fullname,
        v_position_id,
        v_department_id,
        NOW()
    );

    SELECT 'Insert Success' AS Message;

END //

DELIMITER ;

-- cau 8
DELIMITER $$

CREATE PROCEDURE sp_get_exam_by_type(
    IN p_type ENUM('Essay','Multiple-Choice')
)
BEGIN

    SELECT *
    FROM exam
    WHERE type_id =
    (
        SELECT type_id
        FROM typequestion
        WHERE type_name = p_type
    );

END $$

DELIMITER ;

-- cau 9

DELIMITER $$

CREATE PROCEDURE sp_delete_exam(
    IN p_exam_id INT
)
BEGIN

    DELETE FROM exam
    WHERE exam_id = p_exam_id;

END $$

DELIMITER ;

-- cau 10
DELIMITER $$

CREATE PROCEDURE sp_delete_old_exam()
BEGIN

    DELETE FROM exam
    WHERE create_date <= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

END $$

DELIMITER ;

-- cau 11
DELIMITER $$

CREATE PROCEDURE sp_delete_department_by_name(
    IN p_department_name VARCHAR(100)
)
BEGIN
    DECLARE v_delete_department_id INT;
    DECLARE v_default_department_id INT;

    -- Lấy id phòng ban cần xóa
    SELECT department_id
    INTO v_delete_department_id
    FROM department
    WHERE department_name = p_department_name;

    -- Lấy id phòng ban mặc định
    SELECT department_id
    INTO v_default_department_id
    FROM department
    WHERE department_name = 'Phòng chờ duyệt';

    -- Chuyển nhân viên sang phòng ban mặc định
    UPDATE Account
    SET department_id = v_default_department_id
    WHERE department_id = v_delete_department_id;

    -- Xóa phòng ban
    DELETE FROM department
    WHERE department_id = v_delete_department_id;

END $$

DELIMITER ;

-- cau 12
DELIMITER $$

CREATE PROCEDURE sp_count_question_by_month()
BEGIN

    SELECT 
        MONTH(create_date) AS month_created,
        COUNT(*) AS total_question
    FROM Question
    WHERE YEAR(create_date) = YEAR(CURDATE())
    GROUP BY MONTH(create_date)
    ORDER BY MONTH(create_date);

END $$

DELIMITER ;
CALL sp_count_question_by_month();
