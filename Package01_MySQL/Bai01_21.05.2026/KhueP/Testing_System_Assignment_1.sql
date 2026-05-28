CREATE DATABASE Testing_System_Assignment_1;
use Testing_System_Assignment_1;

-- Tạo bảng Department
CREATE TABLE Department(
	DepartmentID INT auto_increment primary key,
    DepartmentName varchar(50) not null unique key
);

-- Tạo bảng Position
create table `Position`(
	PositionID int auto_increment primary key,
    PositionName varchar(50) not null unique key
);
-- Tạo bảng Account
create table Account(
	AccountID int auto_increment primary key,
    Email varchar(100) not null unique key,
    Username varchar(50) not null unique key,
    Fullname varchar(100) not null,
    DepartmentID int not null,
    PositionID int not null,
    CreateDate date,
    foreign key (DepartmentID)
		references Department(DepartmentID),
	foreign key (PositionID)
		references `Position`(PositionID)
);
-- Tạo bảng Group
create table `Group`(
	GroupID int auto_increment primary key,
    GroupName varchar(50) not null unique key,
    CreatorID int,
    CreateDate datetime default current_timestamp,
    foreign key (CreatorID)
		references Account(AccountID)
);
-- Tạo bảng GroupAccount
create table `GroupAccount` (
	GroupID int,
    AccountID int,
    JoinDate datetime default current_timestamp,
    primary key(GroupID, AccountID),
    foreign key (GroupID)
		references `Group`(GroupID),
	foreign key (AccountID)
		references `Account`(AccountID)
);
-- Tạo bảng TypeQuestion
create table TypeQuestion(
	TypeID int auto_increment primary key,
    TypeName varchar(50) not null unique
);
-- Tạo bảng CategoryQuestion
create table CategoryQuestion(
	CategoryID int auto_increment primary key,
    CategoryName varchar(50) not null unique
);
-- Tạo bảng Question
create table Question(
	QuestionID int auto_increment primary key,
    Content varchar(100) not null,
    CategoryID int not null,
    TypeID int not null,
    CreatorID int not null,
    CreateDate datetime default current_timestamp,
    foreign key(CategoryID)
		references CategoryQuestion(CategoryID),
	foreign key(TypeID)
		references TypeQuestion(TypeID),
	foreign key(CreatorID)
		references `Account`(AccountID)
);
-- Tạo bảng Answer
create table Answer(
	AnswerID int auto_increment primary key,
    Content varchar(100) not null,
    QuestionID int not null,
    isCorrect boolean not null default false,
    foreign key (QuestionID)
		references Question(QuestionID)
);
-- Tạo bảng Exam
create table Exam(
	ExamID int auto_increment primary key,
    `Code` varchar(50) not null unique,
    Title varchar(100) not null,
    CategoryID int not null,
    Duration int not null,
    CreatorID int not null,
    CreateDate datetime default current_timestamp,
    foreign key(CategoryID)
		references CategoryQuestion(CategoryID),
	foreign key (CreatorID)
		references `Account`(AccountID)
);
-- Tạo bảng ExamQuestion
create table ExamQuestion (
	ExamID int not null,
    QuestionID int not null,
    primary key (ExamID, QuestionID),
    foreign key (ExamID)
		references Exam(ExamID),
	foreign key (QuestionID)
		references Question(QuestionID)
);
