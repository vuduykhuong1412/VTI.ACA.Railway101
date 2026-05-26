create database Testing_System_Assignment_1;

use Testing_System_Assignment_1;

create table Department (
DepartmentID int auto_increment primary key,
DepartmentName nvarchar(255) not null 
);

create table Position (
PositionID int auto_increment primary key,
PositionName nvarchar(255) not null 
);

create table Account (
AccountID int auto_increment primary key,
Email varchar(255) not null unique,
Username varchar(50) not null unique,
FullName nvarchar(255) not null,
DepartmentID int,
PositionID int,
CreateDate timestamp default (current_timestamp()),
    
foreign key (DepartmentID) references Department(DepartmentID),
foreign key (PositionID) references `Position`(PositionID)
);

create table `Group` (
GroupID int auto_increment primary key,
GroupName nvarchar(255) not null,
CreatorID int,
CreateDate timestamp default (current_timestamp()),
    
foreign key (CreatorID) references Account(AccountID)
);

create table GroupAccount (
GroupID int,
AccountID int,
JoinDate date,
    
primary key (GroupID, AccountID),
foreign key (GroupID) references `Group`(GroupID),
foreign key (AccountID) references Account(AccountID)
);

create table TypeQuestion (
TypeID int auto_increment primary key,
TypeName nvarchar(255) not null
);

create table CategoryQuestion  (
CategoryID int auto_increment primary key,
CategoryName nvarchar(50) not null
);

create table Question (
QuestionID int auto_increment primary key,
Content nvarchar(255) not null,
CategoryID int,
TypeID int,
CreatorID int,
CreateDate timestamp default (current_timestamp()),
    
foreign key (CategoryID) references CategoryQuestion(CategoryID),
foreign key (TypeID) references TypeQuestion(TypeID),
foreign key (CreatorID) references Account(AccountID)
);

create table Answer (
AnswerID int auto_increment primary key,
Content nvarchar(255) not null,
QuestionID int,
isCorrect boolean not null,
    
foreign key (QuestionID) references Question(QuestionID)
);

create table Exam (
ExamID int auto_increment primary key,
Code varchar(50) not null,
Title nvarchar(255) not null,
CategoryID int,
Duration int unsigned not null,
CreatorID int,
CreateDate timestamp default (current_timestamp()),
    
foreign key (CategoryID) references CategoryQuestion(CategoryID),
foreign key (CreatorID) references Account(AccountID)
);

create table ExamQuestion (
ExamID int,
QuestionID int,
    
primary key (ExamID, QuestionID),
foreign key (ExamID) references Exam(ExamID),
foreign key (QuestionID) references Question(QuestionID)
);

-- Department
insert into Department (DepartmentName)
values 
('Sale'),
('Marketing'),
('HR'),
('IT');

-- Position
insert into Position (PositionName)
values
('Dev'),
('Test'),
('Scrum Master'),
('PM');

-- Account
insert into Account 
(Email, Username, FullName, DepartmentID, PositionID)
values
('nga@gmail.com', 'nga01', 'Truong Ai Nga', 1, 1),
('linh@gmail.com', 'linh01', 'Pham Thi Linh', 2, 2),
('an@gmail.com', 'an01', 'Nguyen Van An', 3, 3),
('kien@gmail.com', 'kien01', 'Tran Quoc Kien', 4, 4);

-- Group
insert into `Group`
(GroupName, CreatorID)
values
('Java Fresher', 1),
('Testing System', 2),
('SQL Master', 3);

-- GroupAccount
insert into GroupAccount
(GroupID, AccountID, JoinDate)
values
(1, 1, '2026-05-01'),
(1, 2, '2026-05-02'),
(2, 3, '2026-05-03'),
(3, 4, '2026-05-04');

-- TypeQuestion
insert into TypeQuestion (TypeName)
values
('Essay'),
('Multiple Choice');

-- CategoryQuestion
insert into CategoryQuestion (CategoryName)
values
('Java'),
('SQL'),
('.NET'),
('Postman');

-- Question
insert into Question
(Content, CategoryID, TypeID, CreatorID)
values
('Java la gi?', 1, 1, 1),
('SQL dung de lam gi?', 2, 2, 2),
('Spring Boot co phai framework khong?', 1, 2, 3),
('Postman dung de test API dung khong?', 4, 2, 4);

-- Answer
insert into Answer
(Content, QuestionID, isCorrect)
values
('Ngon ngu lap trinh', 1, true),
('He quan tri co so du lieu', 2, true),
('Khong phai framework', 3, false),
('Dung', 4, true);

-- Exam
insert into Exam
(Code, Title, CategoryID, Duration, CreatorID)
values
('EX001', 'Java Basic Test', 1, 60, 1),
('EX002', 'SQL Final Test', 2, 90, 2),
('EX003', 'API Testing', 4, 45, 3);

-- ExamQuestion
insert into ExamQuestion
(ExamID, QuestionID)
values
(1, 1),
(1, 3),
(2, 2),
(3, 4);

select * from Department;
select * from Account;
select * from `Group`;
select * from Question;
select * from Exam;

select 
a.FullName,
d.DepartmentName,
p.PositionName
from Account a
join Department d on a.DepartmentID = d.DepartmentID
join Position p on a.PositionID = p.PositionID;