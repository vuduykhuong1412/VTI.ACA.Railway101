-- 1 Không cho phép user nhập vào Group có ngày tạo trước 1 năm.
DELIMITER $$

CREATE TRIGGER trg_Check_Group_CreateDate
BEFORE INSERT
ON `group`
FOR EACH ROW
BEGIN

    IF NEW.creator_date < DATE_SUB(NOW(), INTERVAL 1 YEAR) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot create group older than 1 year';
    END IF;

END $$

DELIMITER ;

-- 2 Không cho thêm Account vào phòng Sale
DELIMITER $$

CREATE TRIGGER trg_Department_Sale
BEFORE INSERT
ON `account`
FOR EACH ROW
BEGIN

    DECLARE v_department_name VARCHAR(100);

    SELECT department_name
    INTO v_department_name
    FROM department
    WHERE department_id = NEW.department_id;

    IF v_department_name = 'Sale' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department Sale cannot add more user';
    END IF;

END $$

DELIMITER ;

-- 3 Mỗi Group chỉ chứa tối đa 5 User
DELIMITER $$

CREATE TRIGGER trg_max_5_user_in_group
BEFORE INSERT
ON groupaccount
FOR EACH ROW
BEGIN

    DECLARE v_count INT;

    SELECT COUNT(*)
    INTO v_count
    FROM groupaccount
    WHERE group_id = NEW.group_id;

    IF v_count >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Group is full';
    END IF;

END $$

DELIMITER ;

-- 4 Mỗi Exam chỉ chứa tối đa 10 Question
DELIMITER $$

CREATE TRIGGER trg_max_10_question_in_exam
BEFORE INSERT
ON examquestion
FOR EACH ROW
BEGIN

    DECLARE v_count INT;

    SELECT COUNT(*)
    INTO v_count
    FROM examquestion
    WHERE exam_id = NEW.exam_id;

    IF v_count >= 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exam contains maximum 10 questions';
    END IF;

END $$

DELIMITER ;

-- 5 Không cho phép xóa tài khoản có email admin@gmail.com
DELIMITER $$

CREATE TRIGGER trg_prevent_delete_admin
BEFORE DELETE
ON Account
FOR EACH ROW
BEGIN

    IF OLD.Email = 'admin@gmail.com' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete admin account';
    END IF;

END $$

DELIMITER ;

-- 6 Nếu DepartmentID NULL thì tự động chuyển vào Waiting Department
DELIMITER $$

CREATE TRIGGER trg_default_waiting_department
BEFORE INSERT
ON `account`
FOR EACH ROW
BEGIN

    DECLARE v_waiting_department_id INT;

    IF NEW.department_id IS NULL THEN

        SELECT department_id
        INTO v_waiting_department_id
        FROM department
        WHERE department_name = 'Waiting Department';

        SET NEW.department_id = v_waiting_department_id;

    END IF;

END $$

DELIMITER ;

-- 7 Mỗi Question chỉ có tối đa 4 đáp án và 2 đáp án đúng
DELIMITER $$

CREATE TRIGGER trg_check_answer
BEFORE INSERT
ON answer
FOR EACH ROW
BEGIN

    DECLARE v_answer_count INT;
    DECLARE v_correct_count INT;

    SELECT COUNT(*)
    INTO v_answer_count
    FROM answer
    WHERE question_id = NEW.question_id;

    IF v_answer_count >= 4 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A question can have at most 4 answers';
    END IF;

    IF NEW.is_correct = 1 THEN

        SELECT COUNT(*)
        INTO v_correct_count
        FROM answer
        WHERE question_id = NEW.question_id
          AND is_correct = 1;

        IF v_correct_count >= 2 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A question can have at most 2 correct answers';
        END IF;

    END IF;

END $$

DELIMITER ;

-- 8 nếu người dùng nhập vào gender của account là nam , nữ, chưa xác định thì sẽ đổi lại thành M,F,U cho giống với cấu hình database
DELIMITER $$

CREATE TRIGGER trg_convert_gender_insert
BEFORE INSERT
ON `account`
FOR EACH ROW
BEGIN

    IF NEW.gender = 'Nam' THEN
        SET NEW.gender = 'M';

    ELSEIF NEW.gender = 'Nữ' THEN
        SET NEW.gender = 'F';

    ELSEIF NEW.gender = 'Chưa xác định' THEN
        SET NEW.gender = 'U';

    END IF;

END $$

DELIMITER ;

-- 9 Không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DELIMITER $$

CREATE TRIGGER trg_prevent_delete_exam
BEFORE DELETE
ON exam
FOR EACH ROW
BEGIN

    IF OLD.create_date >= DATE_SUB(NOW(), INTERVAL 2 DAY) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete exam created within 2 days';
    END IF;

END $$

DELIMITER ;

-- 10 chỉ cho phép người dùng chỉ được update , delete các question khi question đó chưa nằm trong exam nào cả
-- UPDATE
DELIMITER $$

CREATE TRIGGER trg_prevent_update_question
BEFORE UPDATE
ON question
FOR EACH ROW
BEGIN

    DECLARE v_count INT;

    SELECT COUNT(*)
    INTO v_count
    FROM examquestion
    WHERE question_id = OLD.question_id;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update question that is already used in an exam';
    END IF;

END $$

DELIMITER ;

-- DELETE

DELIMITER $$

CREATE TRIGGER trg_prevent_delete_question
BEFORE DELETE
ON question
FOR EACH ROW
BEGIN

    DECLARE v_count INT;

    SELECT COUNT(*)
    INTO v_count
    FROM examquestion
    WHERE question_id = OLD.question_id;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete question that is already used in an exam';
    END IF;

END $$

DELIMITER ;


