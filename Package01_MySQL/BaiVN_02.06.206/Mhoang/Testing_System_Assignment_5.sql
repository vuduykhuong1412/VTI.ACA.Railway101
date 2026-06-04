CREATE DATABASE company_management;
USE company_management;

CREATE TABLE department (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE account (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES department(id)
);

CREATE TABLE user_group (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE group_member (
    group_id INT,
    account_id INT,
    join_date DATE,

    PRIMARY KEY (group_id, account_id),

    FOREIGN KEY (group_id)
        REFERENCES user_group(id),

    FOREIGN KEY (account_id)
        REFERENCES account(id)
);

CREATE TABLE question (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    creator_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (creator_id)
        REFERENCES account(id)
);

INSERT INTO department(name)
VALUES
('Sales'),
('Marketing'),
('IT'),
('HR'),
('Finance');

INSERT INTO account
(full_name, email, department_id)
VALUES
('Nguyen Van A', 'a@gmail.com', 1),
('Tran Thi B', 'b@gmail.com', 1),
('Le Van C', 'c@gmail.com', 1),
('Pham Thi D', 'd@gmail.com', 2),
('Nguyen Hoang E', 'e@gmail.com', 3),
('Nguyen Van H', 'h@gmail.com', 3),
('Nguyen Van K', 'k@gmail.com', 3),
('Tran Van L', 'l@gmail.com', 4),
('Do Thi M', 'm@gmail.com', 5),
('Le Van N', 'n@gmail.com', 5);

INSERT INTO user_group(name)
VALUES
('Java Team'),
('React Team'),
('NodeJS Team'),
('Testing Team'),
('SQL Team');

INSERT INTO group_member
(group_id, account_id, join_date)
VALUES
(1,1,'2025-01-01'),
(2,1,'2025-01-02'),
(3,1,'2025-01-03'),
(4,1,'2025-01-04'),
(5,1,'2025-01-05'),

(1,2,'2025-01-01'),
(2,2,'2025-01-02'),

(1,3,'2025-01-01'),
(3,3,'2025-01-02'),

(2,4,'2025-01-01'),
(4,5,'2025-01-01'),

(5,6,'2025-01-01'),
(5,7,'2025-01-01');

INSERT INTO question
(content, creator_id)
VALUES
('Java Core Basics', 1),

('SQL Join Practice', 2),

('Spring Boot Interview Questions', 3),

(REPEAT('A', 350), 1),

(REPEAT('B', 400), 2),

('What is Dependency Injection?', 5),

('Explain REST API', 6),

('What is JWT Authentication?', 7),

('Difference between JPA and Hibernate', 1),

('Explain Microservice Architecture', 2);

-- question 1
CREATE VIEW v_sales_employee AS
SELECT *
FROM account
WHERE department_id = (
    SELECT id
    FROM department
    WHERE name = 'Sales'
);
SELECT * FROM v_sales_employee;

-- question 2
CREATE VIEW v_account_join_most_groups AS
WITH account_group_count AS (
    SELECT
        account_id,
        COUNT(*) AS total_group
    FROM group_member
    GROUP BY account_id
)
SELECT *
FROM account
WHERE id = (
    SELECT account_id
    FROM account_group_count
    ORDER BY total_group DESC
    LIMIT 1
);
SELECT * FROM v_account_join_most_groups;

-- question 3
CREATE VIEW v_long_question AS
SELECT *
FROM question
WHERE id IN (
    SELECT id
    FROM (
        SELECT id
        FROM question
        WHERE LENGTH(content) > 300
    ) q
);
SELECT * FROM v_long_question;

-- question 4
CREATE VIEW v_department_most_employee AS
WITH department_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employee
    FROM account
    GROUP BY department_id
)
SELECT *
FROM department
WHERE id = (
    SELECT department_id
    FROM department_count
    ORDER BY total_employee DESC
    LIMIT 1
);
SELECT * FROM v_department_most_employee;
-- question 5 
CREATE VIEW v_question_by_nguyen AS
SELECT *
FROM question
WHERE creator_id IN (
    SELECT id
    FROM account
    WHERE full_name LIKE 'Nguyen%'
);
SELECT * FROM v_question_by_nguyen;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';