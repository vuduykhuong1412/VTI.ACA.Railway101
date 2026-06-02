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

-- question1 
SELECT 
    a.account_id, a.full_name, d.department_name
FROM
    `account` a
        INNER JOIN
    department d ON a.department_id = d.department_id;

-- question 2
SELECT 
    *
FROM
    account
WHERE
    create_date > '2010-12-20';

-- question 3
SELECT 
    a.*
FROM
    `account` a
        INNER JOIN
    position p ON a.position_id = p.position_id
WHERE
    p.position_name = 'Developer';

-- question 4
SELECT 
    d.department_name, COUNT(a.account_id) AS total_employee
FROM
    department d
        INNER JOIN
    `account` a ON d.department_id = a.department_id
GROUP BY d.department_id , d.department_name
HAVING COUNT(a.account_id) > 3;

-- question 5
SELECT 
    question_id, COUNT(exam_id) AS total_exam
FROM
    examQuestion
GROUP BY question_id
HAVING COUNT(exam_id) = (SELECT 
        MAX(total)
    FROM
        (SELECT 
            COUNT(exam_id) AS total
        FROM
            examQuestion
        GROUP BY question_id) t);

-- question 6
SELECT 
    c.category_name, COUNT(q.question_id) AS total_question
FROM
    categoryQuestion c
        LEFT JOIN
    question q ON c.category_id = q.category_id
GROUP BY c.category_id , c.category_name;

-- question 7
SELECT 
    q.question_id, q.content, COUNT(eq.exam_id) AS total_exam
FROM
    question q
        LEFT JOIN
    examQuestion eq ON q.question_id = eq.question_id
GROUP BY q.question_id , q.content;

-- question 8
SELECT 
    question_id, COUNT(answer_id) AS total_answer
FROM
    answer
GROUP BY question_id
HAVING COUNT(answer_id) = (SELECT 
        MAX(total)
    FROM
        (SELECT 
            COUNT(answer_id) total
        FROM
            answer
        GROUP BY question_id) t);

-- question 9
SELECT 
    g.group_name, COUNT(ga.account_id) AS total_account
FROM
    `group` g
        LEFT JOIN
    groupAccount ga ON g.group_id = ga.group_id
GROUP BY g.group_id , g.group_name;

-- question 10
SELECT 
    p.position_name, COUNT(a.account_id) AS total_employee
FROM
    position p
        LEFT JOIN
    `account` a ON p.position_id = a.position_id
GROUP BY p.position_id , p.position_name
HAVING COUNT(a.account_id) = (SELECT 
        MIN(total)
    FROM
        (SELECT 
            COUNT(account_id) total
        FROM
            `account`
        GROUP BY position_id) t);

-- question 11
SELECT 
    d.department_name,
    p.position_name,
    COUNT(a.account_id) AS total_employee
FROM
    `account` a
        INNER JOIN
    department d ON a.department_id = d.department_id
        INNER JOIN
    position p ON a.position_id = p.position_id
GROUP BY d.department_name , p.position_name;

-- question 12
SELECT 
    q.question_id,
    q.content AS question_content,
    a.content AS answer_content,
    ac.full_name AS creator_name
FROM
    question q
        LEFT JOIN
    answer a ON q.question_id = a.question_id
        LEFT JOIN
    account ac ON q.creator_id = ac.account_id;

-- questionn 13
SELECT 
    tq.type_name, COUNT(q.question_id) AS total_question
FROM
    typeQuestion tq
        LEFT JOIN
    question q ON tq.type_id = q.type_id
GROUP BY tq.type_id , tq.type_name;

-- question 14
SELECT 
    g.*
FROM
    `group` g
        LEFT JOIN
    groupAccount ga ON g.group_id = ga.group_id
WHERE
    ga.account_id IS NULL;
-- question 15 voi 14 giong nhau
-- question 16
SELECT 
    q.*
FROM
    question q
        LEFT JOIN
    answer a ON q.question_id = a.question_id
WHERE
    a.answer_id IS NULL;

-- Union
-- question 17
SELECT 
    account_id
FROM
    groupAccount
WHERE
    group_id = 1 
UNION SELECT 
    account_id
FROM
    groupAccount
WHERE
    group_id = 2;
 
-- question 18
SELECT 
    g.group_id,
    g.group_name,
    COUNT(ga.account_id) AS total_member
FROM
    `group` g
        INNER JOIN
    groupAccount ga ON g.group_id = ga.group_id
GROUP BY g.group_id , g.group_name
HAVING COUNT(ga.account_id) > 5 
UNION SELECT 
    g.group_id,
    g.group_name,
    COUNT(ga.account_id) AS total_member
FROM
    `group` g
        INNER JOIN
    groupAccount ga ON g.group_id = ga.group_id
GROUP BY g.group_id , g.group_name
HAVING COUNT(ga.account_id) < 7;

