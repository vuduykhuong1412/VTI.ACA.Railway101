DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem

USE TestingSystem;

-- Table 1: Department
CREATE TABLE Department (
    DepartmentID    INT             NOT NULL AUTO_INCREMENT,
    DepartmentName  VARCHAR(100)    NOT NULL,
    PRIMARY KEY (DepartmentID)
);

-- Table 2: Position
CREATE TABLE Position (
    PositionID      INT             NOT NULL AUTO_INCREMENT,
    PositionName    VARCHAR(50)     NOT NULL,
    -- Chỉ cho phép các giá trị hợp lệ
    CONSTRAINT chk_position_name CHECK (PositionName IN ('Dev', 'Test', 'Scrum Master', 'PM')),
    PRIMARY KEY (PositionID)
);

-- Table 3: Account
CREATE TABLE Account (
    AccountID       INT             NOT NULL AUTO_INCREMENT,
    Email           VARCHAR(255)    NOT NULL UNIQUE,
    Username        VARCHAR(100)    NOT NULL UNIQUE,
    FullName        NVARCHAR(150)   NOT NULL,
    DepartmentID    INT,
    PositionID      INT,
    CreateDate      DATE            NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (AccountID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (PositionID)   REFERENCES Position(PositionID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Table 4: `Group`
-- Dùng backtick vì GROUP là từ khóa reserved trong MySQL
CREATE TABLE `Group` (
    GroupID         INT             NOT NULL AUTO_INCREMENT,
    GroupName       VARCHAR(100)    NOT NULL,
    CreatorID       INT,
    CreateDate      DATE            NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (GroupID),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Table 5: GroupAccount
CREATE TABLE GroupAccount (
    GroupID         INT             NOT NULL,
    AccountID       INT             NOT NULL,
    JoinDate        DATE            NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY (GroupID)   REFERENCES `Group`(GroupID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table 6: TypeQuestion
CREATE TABLE TypeQuestion (
    TypeID          INT             NOT NULL AUTO_INCREMENT,
    TypeName        VARCHAR(50)     NOT NULL,
    CONSTRAINT chk_type_name CHECK (TypeName IN ('Essay', 'Multiple-Choice')),
    PRIMARY KEY (TypeID)
);

-- Table 7: CategoryQuestion
CREATE TABLE CategoryQuestion (
    CategoryID      INT             NOT NULL AUTO_INCREMENT,
    CategoryName    VARCHAR(100)    NOT NULL,
    PRIMARY KEY (CategoryID)
);

-- Table 8: Question
CREATE TABLE Question (
    QuestionID      INT             NOT NULL AUTO_INCREMENT,
    Content         TEXT            NOT NULL,
    CategoryID      INT,
    TypeID          INT,
    CreatorID       INT,
    CreateDate      DATE            NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (QuestionID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (TypeID)     REFERENCES TypeQuestion(TypeID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (CreatorID)  REFERENCES Account(AccountID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Table 9: Answer
CREATE TABLE Answer (
    AnswerID        INT             NOT NULL AUTO_INCREMENT,
    Content         TEXT            NOT NULL,
    QuestionID      INT             NOT NULL,
    isCorrect       TINYINT(1)      NOT NULL DEFAULT 0,  -- 0: sai, 1: đúng
    PRIMARY KEY (AnswerID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table 10: Exam
CREATE TABLE Exam (
    ExamID          INT             NOT NULL AUTO_INCREMENT,
    Code            VARCHAR(50)     NOT NULL UNIQUE,
    Title           VARCHAR(255)    NOT NULL,
    CategoryID      INT,
    Duration        INT             NOT NULL,   -- Thời gian thi (phút)
    CreatorID       INT,
    CreateDate      DATE            NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (ExamID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (CreatorID)  REFERENCES Account(AccountID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Table 11: ExamQuestion
CREATE TABLE ExamQuestion (
    ExamID          INT             NOT NULL,
    QuestionID      INT             NOT NULL,
    PRIMARY KEY (ExamID, QuestionID),
    FOREIGN KEY (ExamID)     REFERENCES Exam(ExamID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
        ON UPDATE CASCADE ON DELETE CASCADE
);
