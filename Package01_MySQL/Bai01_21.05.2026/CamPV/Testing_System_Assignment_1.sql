-- câu lệnh xóa db
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
-- câu lệnh tạo db
CREATE DATABASE Testing_System_Assignment_1;
-- chọn CSDL
USE Testing_System_Assignment_1;
-- tạo table Department
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL
);
-- tạo bảng Position
CREATE TABLE Position (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(255) NOT NULL
);
-- tạo bảng Account
CREATE TABLE Account (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Username VARCHAR(255) NOT NULL UNIQUE,
    FullName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    PositionID INT,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_Account_Department
        FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID),

    CONSTRAINT FK_Account_Position
        FOREIGN KEY (PositionID)
        REFERENCES `Position`(PositionID)
);


-- tạo bảng Group
CREATE TABLE `Group` (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(255) NOT NULL UNIQUE,
    CreatorID INT,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_Group_Account
        FOREIGN KEY (CreatorID)
        REFERENCES Account(AccountID)
);
-- tạo bảng GroupAccount
CREATE TABLE GroupAccount (
    GroupID INT,
    AccountID INT,
    JoinDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (GroupID, AccountID),
    CONSTRAINT FK_GroupAccount_Group
        FOREIGN KEY (GroupID)
        REFERENCES `Group`(GroupID),

    CONSTRAINT FK_GroupAccount_Account
        FOREIGN KEY (AccountID)
        REFERENCES Account(AccountID)
);
-- tạo bảng TypeQuestion
CREATE TABLE TypeQuestion (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(255) NOT NULL
);
-- tạo bảng CategoryQuestion
CREATE TABLE CategoryQuestion (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);
-- tạo bảng Question
CREATE TABLE Question (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_Question_Category
        FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion(CategoryID),

    CONSTRAINT FK_Question_Type
        FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion(TypeID),

    CONSTRAINT FK_Question_Account
        FOREIGN KEY (CreatorID)
        REFERENCES Account(AccountID)
);
-- tạo bảng Answer
CREATE TABLE Answer (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    QuestionID INT,
    isCorrect BOOLEAN NOT NULL,

    CONSTRAINT FK_Answer_Question
        FOREIGN KEY (QuestionID)
        REFERENCES Question(QuestionID)
);
-- tạo bảng Exam
CREATE TABLE Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    `Code` VARCHAR(20) NOT NULL UNIQUE,
    Title VARCHAR(100) NOT NULL,
    CategoryID INT,
    Duration INT NOT NULL,
    CreatorID INT,
    CreateDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_Exam_Category
        FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion(CategoryID),

    CONSTRAINT FK_Exam_Account
        FOREIGN KEY (CreatorID)
        REFERENCES Account(AccountID)
);
-- tạo bảng ExamQuestion
CREATE TABLE ExamQuestion (
    ExamID INT,
    QuestionID INT,

    PRIMARY KEY (ExamID, QuestionID),

    CONSTRAINT FK_ExamQuestion_Exam
        FOREIGN KEY (ExamID)
        REFERENCES Exam(ExamID),

    CONSTRAINT FK_ExamQuestion_Question
        FOREIGN KEY (QuestionID)
        REFERENCES Question(QuestionID)
);

-- insert dữ liệu
-- Department
INSERT INTO Department (DepartmentName)
VALUES
('Marketing'),
('Sale'),
('Bảo vệ'),
('Nhân sự'),
('Kỹ thuật'),
('Tài chính'),
('Phó giám đốc'),
('Giám đốc'),
('Thư kí'),
('No person'),
('Bán hàng');

-- Position
INSERT INTO `Position` (PositionName)
VALUES
('Dev'),
('Test'),
('Scrum Master'),
('PM');

-- Account
INSERT INTO `Account`
(Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
('Email1@gmail.com',  'Username1',  'Fullname1',  5, 1, '2020-03-05'),
('Email2@gmail.com',  'Username2',  'Fullname2',  1, 2, '2020-03-05'),
('Email3@gmail.com',  'Username3',  'Fullname3',  2, 2, '2020-03-07'),
('Email4@gmail.com',  'Username4',  'Fullname4',  3, 4, '2020-03-08'),
('Email5@gmail.com',  'Username5',  'Fullname5',  4, 4, '2020-03-10'),
('Email6@gmail.com',  'Username6',  'Fullname6',  6, 3, '2020-04-05'),
('Email7@gmail.com',  'Username7',  'Fullname7',  2, 2, NULL),
('Email8@gmail.com',  'Username8',  'Fullname8',  8, 1, '2020-04-07'),
('Email9@gmail.com',  'Username9',  'Fullname9',  2, 2, '2020-04-07'),
('Email10@gmail.com', 'Username10', 'Fullname10', 10, 1, '2020-04-09'),
('Email11@gmail.com', 'Username11', 'Fullname11', 10, 1, DEFAULT),
('Email12@gmail.com', 'Username12', 'Fullname12', 10, 1, DEFAULT);

-- Group
INSERT INTO `Group`
(GroupName, CreatorID, CreateDate)
VALUES
('Testing System', 5,  '2019-03-05'),
('Development',    1,  '2020-03-07'),
('VTI Sale 01',    2,  '2020-03-09'),
('VTI Sale 02',    3,  '2020-03-10'),
('VTI Sale 03',    4,  '2020-03-28'),
('VTI Creator',    6,  '2020-04-06'),
('VTI Marketing 01',7, '2020-04-07'),
('Management',     8,  '2020-04-08'),
('Chat with love', 9,  '2020-04-09'),
('Vi Ti Ai',       10, '2020-04-10');

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
INSERT INTO Question
(Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES
('Câu hỏi về Java',    1, 1,  2, '2020-04-05'),
('Câu hỏi về PHP',     10,2,  2, '2020-04-05'),
('Hỏi về C#',          9, 2,  3, '2020-04-06'),
('Hỏi về Ruby',        6, 1,  4, '2020-04-06'),
('Hỏi về Postman',     5, 1,  5, '2020-04-06'),
('Hỏi về ADO.NET',     3, 2,  6, '2020-04-06'),
('Hỏi về ASP.NET',     2, 1,  7, '2020-04-06'),
('Hỏi về C++',         8, 1,  8, '2020-04-07'),
('Hỏi về SQL',         4, 2,  9, '2020-04-07'),
('Hỏi về Python',      7, 1, 10, '2020-04-07');

-- Answer
INSERT INTO Answer
(Content, QuestionID, isCorrect)
VALUES
('Trả lời 01', 1, 0),
('Trả lời 02', 1, 1),
('Trả lời 03', 1, 0),
('Trả lời 04', 1, 1),
('Trả lời 05', 2, 1),
('Trả lời 06', 3, 1),
('Trả lời 07', 4, 0),
('Trả lời 08', 8, 0),
('Trả lời 09', 9, 1),
('Trả lời 10', 10,1);

-- Exam
INSERT INTO Exam
(`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES
('VTIQ001', 'Đề thi C#',       1,  60, 5,  '2019-04-05'),
('VTIQ002', 'Đề thi PHP',      10, 60, 2,  '2019-04-05'),
('VTIQ003', 'Đề thi C++',      9, 120, 2,  '2019-04-07'),
('VTIQ004', 'Đề thi Java',     6,  60, 3,  '2020-04-08'),
('VTIQ005', 'Đề thi Ruby',     5, 120, 4,  '2020-04-10'),
('VTIQ006', 'Đề thi Postman',  3,  60, 6,  '2020-04-05'),
('VTIQ007', 'Đề thi SQL',      2,  60, 7,  '2020-04-05'),
('VTIQ008', 'Đề thi Python',   8,  60, 8,  '2020-04-07'),
('VTIQ009', 'Đề thi ADO.NET',  4,  90, 9,  '2020-04-07'),
('VTIQ010', 'Đề thi ASP.NET',  7,  90, 10, '2020-04-08');

-- ExamQuestion
INSERT INTO ExamQuestion
(ExamID, QuestionID)
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
(10,8);