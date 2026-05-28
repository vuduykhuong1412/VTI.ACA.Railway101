CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

CREATE TABLE Department (
    DepartmentID    TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DepartmentName  VARCHAR(50) NOT NULL UNIQUE 
);

CREATE TABLE `Position` (
    PositionID      TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PositionName    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE `Account` (
    AccountID       INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Email           VARCHAR(100) NOT NULL UNIQUE,
    Username        VARCHAR(50) NOT NULL UNIQUE,
    FullName        VARCHAR(100) NOT NULL,	
    DepartmentID    TINYINT UNSIGNED NOT NULL, 
    PositionID      TINYINT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID) ON DELETE CASCADE
);

CREATE TABLE Trainee (
    TraineeID        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_Name         VARCHAR(100) NOT NULL,
    Birth_Date        DATE NOT NULL,
    Gender            ENUM('male', 'female', 'unknown') NOT NULL,
    ET_IQ             TINYINT UNSIGNED NOT NULL CHECK (ET_IQ BETWEEN 0 AND 20),
    ET_Gmath          TINYINT UNSIGNED NOT NULL CHECK (ET_Gmath BETWEEN 0 AND 20),
    ET_English        TINYINT UNSIGNED NOT NULL CHECK (ET_English BETWEEN 0 AND 50),
    Training_Class    VARCHAR(20) NOT NULL,
    Evaluation_Notes  TEXT,
    VTI_Account       VARCHAR(50) NOT NULL UNIQUE 
);

CREATE TABLE `Group` (
    GroupID         TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName       VARCHAR(100) NOT NULL UNIQUE,
    CreatorID       INT UNSIGNED NOT NULL,
    CreateDate      DATE NOT NULL
);

CREATE TABLE Answer (
    AnswerID        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content         TEXT NOT NULL,
    QuestionID      INT UNSIGNED NOT NULL,
    isCorrect       BIT DEFAULT 1
);

CREATE TABLE Exam (
    ExamID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`          VARCHAR(20) NOT NULL UNIQUE,
    Title           VARCHAR(100) NOT NULL,
    CategoryID      TINYINT UNSIGNED NOT NULL,
    Duration        TINYINT UNSIGNED NOT NULL,
    CreatorID       INT UNSIGNED NOT NULL,
    CreateDate      DATE NOT NULL
);

INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate) 
VALUES 
('VTI001', 'De thi Java',   1, 60, 1, '2019-10-10'),
('VTI002', 'De thi NET',    2, 90, 2, '2019-11-15'),
('VTI003', 'De thi SQL',    3, 45, 1, '2019-12-01'),
('VTI004', 'De thi Web',    4, 30, 4, '2020-01-15'),
('VTI005', 'De thi Ruby',   5, 120, 3, '2020-02-20');

INSERT INTO Answer (Content, QuestionID, isCorrect) 
VALUES 
('Dap an A', 1, 1),
('Dap an B', 1, 0),
('Dap an C', 1, 0),
('Dap an D', 1, 0),
('Dap an A', 2, 1),
('Dap an B', 2, 0);

INSERT INTO `Group` (GroupName, CreatorID, CreateDate) 
VALUES 
('Group A', 1, '2019-10-10'),
('Group B', 2, '2019-11-15'),
('Group C', 3, '2020-01-20'),
('Group D', 4, '2020-05-05'),
('Group E', 5, '2019-12-01');

INSERT INTO Department (DepartmentName) 
VALUES 
(N'Marketing'),
(N'Sale'),
(N'Bao ve'),
(N'Nhan su'),
(N'Ky thuat');

INSERT INTO `Position` (PositionName) 
VALUES 
('Dev'),
('Test'),
('Scrum Master'),
('PM'),
('BA');

INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID) 
VALUES 
('tranminhhoang@gmail.com', 'hoang.tranminh', 'Tran Minh Hoang', 1, 4),
('nguyenthanhha@gmail.com', 'ha.nguyenthanh', 'Nguyen Thanh Ha', 2, 1),
('lequangvinh@gmail.com',   'vinh.lequang',   'Le Quang Vinh',   3, 2),
('phamthilan@gmail.com',    'lan.phamthi',    'Pham Thi Lan',    4, 3),
('vuhoanglong@gmail.com',   'long.vuhoang',   'Vu Hoang Long',   5, 1);

INSERT INTO Trainee (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES
('Bui Quoc Anh',     '2002-04-12', 'male',   16, 17, 38, 'VTI001', 'Kha',  'anh.buiquoc'),
('Dang Thuy Linh',   '2003-09-18', 'female', 14, 15, 42, 'VTI001', 'On',   'linh.dangthuy'),
('Do Xuan Bach',     '2001-01-25', 'male',   19, 20, 45, 'VTI002', 'Tot',  'bach.doxuan'),
('Hoang Minh Thu',   '2002-07-30', 'female', 11, 12, 28, 'VTI002', 'Yeu',  'thu.hoangminh'),
('Ngo Tien Dat',     '2003-03-05', 'unknown',15, 14, 39, 'VTI001', 'Kha',  'dat.ngotien');