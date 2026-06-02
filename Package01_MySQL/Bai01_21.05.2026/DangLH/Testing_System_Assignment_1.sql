CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department (
    DepartmentID    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName  VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Position (
    PositionID      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName    ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE
);

CREATE TABLE Account (
    AccountID       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email           VARCHAR(100) NOT NULL UNIQUE,
    Username        VARCHAR(50) NOT NULL UNIQUE,
    FullName        VARCHAR(100) NOT NULL,
    DepartmentID    INT UNSIGNED NOT NULL,
    PositionID      INT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY (PositionID)   REFERENCES Position (PositionID) ON DELETE CASCADE
);

CREATE TABLE `Group` (
    GroupID         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName       VARCHAR(100) NOT NULL UNIQUE,
    CreatorID       INT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID) ON DELETE CASCADE
);

CREATE TABLE GroupAccount (
    GroupID         INT UNSIGNED NOT NULL,
    AccountID       INT UNSIGNED NOT NULL,
    JoinDate        DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY (GroupID)   REFERENCES `Group`(GroupID) ON DELETE CASCADE,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID) ON DELETE CASCADE
);

CREATE TABLE TypeQuestion (
    TypeID          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName        ENUM('Essay', 'Multiple-Choice') NOT NULL UNIQUE
);

CREATE TABLE CategoryQuestion (
    CategoryID      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Question (
    QuestionID      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content         TEXT NOT NULL,
    CategoryID      INT UNSIGNED NOT NULL,
    TypeID          INT UNSIGNED NOT NULL,
    CreatorID       INT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
    FOREIGN KEY (TypeID)     REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
    FOREIGN KEY (CreatorID)  REFERENCES Account(AccountID) ON DELETE CASCADE
);

CREATE TABLE Answer (
    AnswerID        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content         TEXT NOT NULL,
    QuestionID      INT UNSIGNED NOT NULL,
    isCorrect       BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);

CREATE TABLE Exam (
    ExamID          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`          VARCHAR(20) NOT NULL UNIQUE,
    Title           VARCHAR(200) NOT NULL,
    CategoryID      INT UNSIGNED NOT NULL,
    Duration        TINYINT UNSIGNED NOT NULL,
    CreatorID       INT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
    FOREIGN KEY (CreatorID)  REFERENCES Account(AccountID) ON DELETE CASCADE
);

CREATE TABLE ExamQuestion (
    ExamID          INT UNSIGNED NOT NULL,
    QuestionID      INT UNSIGNED NOT NULL,
    PRIMARY KEY (ExamID, QuestionID),
    FOREIGN KEY (ExamID)     REFERENCES Exam(ExamID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);