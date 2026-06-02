DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

-- =============================
-- Table 1: Department
-- =============================
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- =============================
-- Table 2: Position
-- =============================
CREATE TABLE `Position` (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE
);

-- =============================
-- Table 3: Account
-- =============================
CREATE TABLE `Account` (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Username VARCHAR(100) NOT NULL UNIQUE,
    FullName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    PositionID INT NOT NULL,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

-- =============================
-- Table 4: Group
-- =============================
CREATE TABLE `Group` (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100) NOT NULL UNIQUE,
    CreatorID INT NOT NULL,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- =============================
-- Table 5: GroupAccount
-- =============================
CREATE TABLE GroupAccount (
    GroupID INT NOT NULL,
    AccountID INT NOT NULL,
    JoinDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (GroupID, AccountID),

    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

-- =============================
-- Table 6: TypeQuestion
-- =============================
CREATE TABLE TypeQuestion (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay', 'Multiple-Choice') NOT NULL UNIQUE
);

-- =============================
-- Table 7: CategoryQuestion
-- =============================
CREATE TABLE CategoryQuestion (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- =============================
-- Table 8: Question
-- =============================
CREATE TABLE Question (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255) NOT NULL,
    CategoryID INT NOT NULL,
    TypeID INT NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- =============================
-- Table 9: Answer
-- =============================
CREATE TABLE Answer (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255) NOT NULL,
    QuestionID INT NOT NULL,
    isCorrect BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- =============================
-- Table 10: Exam
-- =============================
CREATE TABLE Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    `Code` CHAR(10) NOT NULL UNIQUE,
    Title VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    Duration INT NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- =============================
-- Table 11: ExamQuestion
-- =============================
CREATE TABLE ExamQuestion (
    ExamID INT NOT NULL,
    QuestionID INT NOT NULL,

    PRIMARY KEY (ExamID, QuestionID),

    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- =========================================================
-- INSERT DATA
-- =========================================================

-- Department
INSERT INTO Department (DepartmentName)
VALUES
('Marketing'),
('Sale'),
('Bao ve'),
('Nhan su'),
('Ky thuat'),
('Tai chinh'),
('Pho giam doc'),
('Giam doc'),
('Thu ki'),
('No person'),
('Ban hang');

-- Position
INSERT INTO `Position` (PositionName)
VALUES
('Dev'),
('Test'),
('Scrum Master'),
('PM');

-- Account
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
('Email1@gmail.com',  'Username1',  'Fullname1',  5,  1, '2020-03-05'),
('Email2@gmail.com',  'Username2',  'Fullname2',  1,  2, '2020-03-05'),
('Email3@gmail.com',  'Username3',  'Fullname3',  2,  2, '2020-03-07'),
('Email4@gmail.com',  'Username4',  'Fullname4',  3,  4, '2020-03-08'),
('Email5@gmail.com',  'Username5',  'Fullname5',  4,  4, '2020-03-10'),
('Email6@gmail.com',  'Username6',  'Fullname6',  6,  3, '2020-04-05'),
('Email7@gmail.com',  'Username7',  'Fullname7',  2,  2, NULL),
('Email8@gmail.com',  'Username8',  'Fullname8',  8,  1, '2020-04-07'),
('Email9@gmail.com',  'Username9',  'Fullname9',  2,  2, '2020-04-07'),
('Email10@gmail.com', 'Username10', 'Fullname10', 10, 1, '2020-04-09'),
('Email11@gmail.com', 'Username11', 'Fullname11', 10, 1, DEFAULT),
('Email12@gmail.com', 'Username12', 'Fullname12', 10, 1, DEFAULT);

-- Group
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
VALUES
('Testing System',   5,  '2019-03-05'),
('Development',      1,  '2020-03-07'),
('VTI Sale 01',      2,  '2020-03-09'),
('VTI Sale 02',      3,  '2020-03-10'),
('VTI Sale 03',      4,  '2020-03-28'),
('VTI Creator',      6,  '2020-04-06'),
('VTI Marketing 01', 7,  '2020-04-07'),
('Management',       8,  '2020-04-08'),
('Chat with love',   9,  '2020-04-09'),
('Vi Ti Ai',         10, '2020-04-10');

-- GroupAccount
-- GroupAccount
INSERT INTO GroupAccount
(GroupID, AccountID, JoinDate)
VALUES
(1, 1,  '2019-03-05'),
(1, 2,  '2020-03-07'),
(3, 3,  '2020-03-09'),
(3, 4,  '2020-03-10'),
(5, 5,  '2020-03-28'),
(1, 3,  '2020-04-06'),
(1, 7,  '2020-04-07'),
(8, 3,  '2020-04-08'),
(1, 9,  '2020-04-09'),
(10,10, '2020-04-10');

-- TypeQuestion
INSERT INTO TypeQuestion (TypeName)
VALUES
('Essay'),
('Multiple-Choice');

-- CategoryQuestion
INSERT INTO CategoryQuestion (CategoryName)
VALUES
('Java'),
('ASP.NET'),
('ADO.NET'),
('SQL'),
('Postman'),
('Ruby'),
('Python'),
('C++'),
('C Sharp'),
('PHP');

-- Question
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES
('Cau hoi ve Java',     1,  1,  2,  '2020-04-05'),
('Cau hoi ve PHP',      10, 2,  2,  '2020-04-05'),
('Hoi ve C#',           9,  2,  3,  '2020-04-06'),
('Hoi ve Ruby',         6,  1,  4,  '2020-04-06'),
('Hoi ve Postman',      5,  1,  5,  '2020-04-06'),
('Hoi ve ADO.NET',      3,  2,  6,  '2020-04-06'),
('Hoi ve ASP.NET',      2,  1,  7,  '2020-04-06'),
('Hoi ve C++',          8,  1,  8,  '2020-04-07'),
('Hoi ve SQL',          4,  2,  9,  '2020-04-07'),
('Hoi ve Python',       7,  1,  10, '2020-04-07');

-- Answer
INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES
('Tra loi 01', 1, FALSE),
('Tra loi 02', 1, TRUE),
('Tra loi 03', 1, FALSE),
('Tra loi 04', 1, TRUE),
('Tra loi 05', 2, TRUE),
('Tra loi 06', 3, TRUE),
('Tra loi 07', 4, FALSE),
('Tra loi 08', 8, FALSE),
('Tra loi 09', 9, TRUE),
('Tra loi 10', 10, TRUE);

-- Exam
INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES
('VTIQ001', 'De thi C#',      1,  60,  5,  '2019-04-05'),
('VTIQ002', 'De thi PHP',     10, 60,  2,  '2019-04-05'),
('VTIQ003', 'De thi C++',     9,  120, 2,  '2019-04-07'),
('VTIQ004', 'De thi Java',    6,  60,  3,  '2020-04-08'),
('VTIQ005', 'De thi Ruby',    5,  120, 4,  '2020-04-10'),
('VTIQ006', 'De thi Postman', 3,  60,  6,  '2020-04-05'),
('VTIQ007', 'De thi SQL',     2,  60,  7,  '2020-04-05'),
('VTIQ008', 'De thi Python',  8,  60,  8,  '2020-04-07'),
('VTIQ009', 'De thi ADO.NET', 4,  90,  9,  '2020-04-07'),
('VTIQ010', 'De thi ASP.NET', 7,  90,  10, '2020-04-08');

-- ExamQuestion
INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES
(1, 5),
(2, 10),
(3, 4),
(4, 3),
(5, 7),
(6, 10),
(7, 2),
(8, 10),
(9, 9),
(10, 8);

-- =========================================================
-- Check data
-- =========================================================
SELECT * FROM Department;
SELECT * FROM `Position`;
SELECT * FROM `Account`;
SELECT * FROM `Group`;
SELECT * FROM GroupAccount;
SELECT * FROM TypeQuestion;
SELECT * FROM CategoryQuestion;
SELECT * FROM Question;
SELECT * FROM Answer;
SELECT * FROM Exam;
SELECT * FROM ExamQuestion;
