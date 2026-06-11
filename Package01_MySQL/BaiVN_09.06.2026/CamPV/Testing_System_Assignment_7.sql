-- câu 1
DELIMITER $$

CREATE TRIGGER Q1_CheckCreateDate
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
    IF NEW.CreateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Khong duoc tao Group truoc 1 nam';
    END IF;
END $$

DELIMITER ;

-- câu 2
DELIMITER $$

CREATE TRIGGER Q2_CheckSale
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    IF NEW.DepartmentID = (
        SELECT DepartmentID
        FROM Department
        WHERE DepartmentName = 'Sale'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
    END IF;
END $$

DELIMITER ;

-- câu 3
DELIMITER $$

CREATE TRIGGER Q3_Max5User
BEFORE INSERT ON GroupAccount
FOR EACH ROW
BEGIN
    IF (
        SELECT COUNT(*)
        FROM GroupAccount
        WHERE GroupID = NEW.GroupID
    ) >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Group chi duoc toi da 5 user';
    END IF;
END $$

DELIMITER ;

-- câu 4
DELIMITER $$

CREATE TRIGGER Q4_Max10Question
BEFORE INSERT ON ExamQuestion
FOR EACH ROW
BEGIN
    IF (
        SELECT COUNT(*)
        FROM ExamQuestion
        WHERE ExamID = NEW.ExamID
    ) >= 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exam chi duoc toi da 10 question';
    END IF;
END $$

DELIMITER ;