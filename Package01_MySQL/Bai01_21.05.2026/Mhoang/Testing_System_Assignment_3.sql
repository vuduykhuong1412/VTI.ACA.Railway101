CREATE DATABASE student_management;
USE student_management;
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE `position` (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(255) NOT NULL
);

CREATE TABLE `account` (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    create_date DATE NOT NULL,
    department_id INT NOT NULL,
    position_id INT NOT NULL,
    FOREIGN KEY (department_id)
        REFERENCES department (department_id),
    FOREIGN KEY (position_id)
        REFERENCES `position` (position_id)
);

CREATE TABLE `group` (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL,
    creator_id INT NOT NULL,
    creator_date DATE
);

CREATE TABLE groupAccount (
    group_id INT,
    account_id INT,
    join_date DATE,
    FOREIGN KEY (group_id)
        REFERENCES `group` (group_id),
    FOREIGN KEY (account_id)
        REFERENCES `account` (account_id)
);

CREATE TABLE typeQuestion (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL
);

CREATE TABLE categoryQuestion (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE question (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255),
    category_id INT,
    type_id INT,
    creator_id INT,
    create_date DATETIME,
    FOREIGN KEY (category_id)
        REFERENCES categoryQuestion (category_id),
    FOREIGN KEY (type_id)
        REFERENCES typeQuestion (type_id)
);

CREATE TABLE answer (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255),
    question_id INT,
    is_correct BOOLEAN,
    FOREIGN KEY (question_id)
        REFERENCES question (question_id)
);
 
CREATE TABLE exam (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    `code` INT,
    title VARCHAR(255) NOT NULL,
    category_id INT,
    duration INT,
    creator_id INT,
    create_date DATETIME,
    FOREIGN KEY (category_id)
        REFERENCES categoryQuestion (category_id)
);
CREATE TABLE examQuestion (
    exam_id INT,
    question_id INT,
    FOREIGN KEY (exam_id)
        REFERENCES exam (exam_id),
    FOREIGN KEY (question_id)
        REFERENCES question (question_id)
);

INSERT INTO department(department_name)
VALUES
('IT'),
('HR'),
('Marketing'),
('Finance'),
('Sales'),
('Security'),
('QA'),
('Support'),
('Management'),
('Training');

-- =========================
-- Position
-- =========================
INSERT INTO `position`(position_name)
VALUES
('Developer'),
('Tester'),
('Manager'),
('Leader'),
('HR'),
('Accountant'),
('Security'),
('Supporter'),
('Intern'),
('Director');

-- =========================
-- Account
-- =========================
INSERT INTO `account`
(email, user_name, full_name, create_date, department_id, position_id)
VALUES
('an@gmail.com', 'an01', 'Nguyen Van An', '2025-01-01', 1, 1),
('binh@gmail.com', 'binh02', 'Tran Van Binh', '2025-01-02', 2, 5),
('cuong@gmail.com', 'cuong03', 'Le Van Cuong', '2025-01-03', 3, 3),
('dung@gmail.com', 'dung04', 'Pham Van Dung', '2025-01-04', 4, 6),
('ha@gmail.com', 'ha05', 'Nguyen Thi Ha', '2025-01-05', 5, 4),
('khanh@gmail.com', 'khanh06', 'Tran Khanh', '2025-01-06', 6, 7),
('linh@gmail.com', 'linh07', 'Do Thi Linh', '2025-01-07', 7, 2),
('minh@gmail.com', 'minh08', 'Pham Minh', '2025-01-08', 8, 8),
('nam@gmail.com', 'nam09', 'Hoang Nam', '2025-01-09', 9, 10),
('phuc@gmail.com', 'phuc10', 'Nguyen Phuc', '2025-01-10', 10, 9);

-- =========================
-- Group
-- =========================
INSERT INTO `group`
(group_name, creator_id, creator_date)
VALUES
('Java Team', 1, '2025-02-01'),
('React Team', 2, '2025-02-02'),
('Testing Team', 3, '2025-02-03'),
('HR Team', 4, '2025-02-04'),
('Marketing Team', 5, '2025-02-05'),
('Finance Team', 6, '2025-02-06'),
('Security Team', 7, '2025-02-07'),
('Support Team', 8, '2025-02-08'),
('Management Team', 9, '2025-02-09'),
('Training Team', 10, '2025-02-10');

-- =========================
-- GroupAccount
-- =========================
INSERT INTO groupAccount
(group_id, account_id, join_date)
VALUES
(1,1,'2025-03-01'),
(2,2,'2025-03-02'),
(3,3,'2025-03-03'),
(4,4,'2025-03-04'),
(5,5,'2025-03-05'),
(6,6,'2025-03-06'),
(7,7,'2025-03-07'),
(8,8,'2025-03-08'),
(9,9,'2025-03-09'),
(10,10,'2025-03-10');

-- =========================
-- TypeQuestion
-- =========================
INSERT INTO typeQuestion(type_name)
VALUES
('Essay'),
('Multiple Choice'),
('True False'),
('Java'),
('SQL'),
('HTML'),
('CSS'),
('JavaScript'),
('React'),
('Spring Boot');

-- =========================
-- CategoryQuestion
-- =========================
INSERT INTO categoryQuestion(category_name)
VALUES
('Java Core'),
('Database'),
('Frontend'),
('Backend'),
('DevOps'),
('Testing'),
('Security'),
('English'),
('Japanese'),
('Soft Skill');

-- =========================
-- Question
-- =========================
INSERT INTO question
(content, category_id, type_id, creator_id, create_date)
VALUES
('What is Java?',1,1,1,NOW()),
('What is SQL?',2,2,2,NOW()),
('Explain React Hook',3,1,3,NOW()),
('What is Spring Boot?',4,2,4,NOW()),
('Define DevOps',5,1,5,NOW()),
('What is Unit Test?',6,2,6,NOW()),
('What is JWT?',7,1,7,NOW()),
('Translate hello',8,2,8,NOW()),
('What is Hiragana?',9,1,9,NOW()),
('Define teamwork',10,2,10,NOW());

-- =========================
-- Answer
-- =========================
INSERT INTO answer
(content, question_id, is_correct)
VALUES
('Java is a programming language',1,TRUE),
('SQL manages database',2,TRUE),
('useState is a React Hook',3,TRUE),
('Spring Boot is a framework',4,TRUE),
('DevOps combines dev and ops',5,TRUE),
('Unit Test tests small units',6,TRUE),
('JWT is token authentication',7,TRUE),
('Hello = Xin chao',8,TRUE),
('Hiragana is Japanese alphabet',9,TRUE),
('Teamwork means working together',10,TRUE);

-- =========================
-- Exam
-- =========================
INSERT INTO exam
(`code`, title, category_id, duration, creator_id, create_date)
VALUES
(1001,'Java Basic Test',1,60,1,NOW()),
(1002,'SQL Test',2,45,2,NOW()),
(1003,'Frontend Test',3,50,3,NOW()),
(1004,'Backend Test',4,60,4,NOW()),
(1005,'DevOps Test',5,40,5,NOW()),
(1006,'Testing Test',6,30,6,NOW()),
(1007,'Security Test',7,45,7,NOW()),
(1008,'English Test',8,60,8,NOW()),
(1009,'Japanese Test',9,60,9,NOW()),
(1010,'Soft Skill Test',10,30,10,NOW());

-- =========================
-- ExamQuestion
-- =========================
INSERT INTO examQuestion
(exam_id, question_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
-- question 2
SELECT 
    *
FROM
    department;

-- question 3
SELECT 
    department_id
FROM
    department
WHERE
    department_name = 'Sales';

-- question 4
SELECT 
    *
FROM
    `account`
WHERE
    LENGTH(full_name) = (SELECT 
            MAX(LENGTH(full_name))
        FROM
            `account`);

-- question 5
SELECT 
    *
FROM
    `account`
WHERE
    LENGTH(full_name) = (SELECT 
            MAX(LENGTH(full_name))
        FROM
            `account`
        WHERE
            department_id = 3);
-- question 6
SELECT 
    group_name
FROM
    `group`
WHERE
    group_id IN (SELECT 
            group_id
        FROM
            groupAccount
        WHERE
            join_date < '2019-12-20');
 -- question 7
SELECT 
    question_id
FROM
    answer
GROUP BY question_id
HAVING COUNT(answer_id) >= 4;

-- question 8
SELECT 
    exam_id
FROM
    exam
WHERE
    duration >= 60
        AND create_date < '2019-12-20';

-- question 9
SELECT 
    *
FROM
    `group`
ORDER BY creator_date DESC
LIMIT 5;

-- question 10
SELECT 
    COUNT(account_id) AS total_employee
FROM
    account
WHERE
    department_id = 2;

-- question 11
SELECT 
    *
FROM
    `account`
WHERE
    full_name = 'd%o';
 


