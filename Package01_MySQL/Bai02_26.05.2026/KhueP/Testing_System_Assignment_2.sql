CREATE DATABASE Testing_System_Assignment_3;
use Testing_System_Assignment_3;
DROP DATABASE Testing_System_Assignment_3;

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
-- Question 1: Thêm ít nhất 10 record vào mỗi table

-- Insert Data Department
insert into Department(DepartmentName)
values
	('Sale'),
    ('Marketing'),
    ('HR'),
    ('IT'),
    ('Finance'),
    ('Security'),
    ('Management'),
    ('QA'),
    ('Support'),
    ('Research');
SELECT * FROM Department;

-- Insert data Position
insert into `Position`(PositionName)
values
	('Dev'),
    ('Test'),
    ('Scrum Master'),
    ('PM'),
    ('BA'),
    ('Leader'),
    ('Manager'),
    ('Intern'),
    ('Fresher'),
    ('Senior');
select * from `Position`;

-- Insert data TypeQuestion
insert into TypeQuestion(TypeName)
values
	('Essay'),
    ('Multiple-Choice'),
    ('True/False'),
    ('Fill In Blank'),
    ('Matching'),
    ('Coding'),
    ('Short Answer'),
    ('Long Answer'),
    ('Quiz'),
    ('Practice');
select * from TypeQuestion;

-- Insert data CategoryQuestion
insert into CategoryQuestion(CategoryName)
values
	('Java'),
    ('SQL'),
    ('.NET'),
    ('Python'),
    ('Ruby'),
    ('Postman'),
    ('NodeJS'),
    ('React'),
    ('HTML'),
    ('CSS');
select * from CategoryQuestion;

-- insert data Account
insert into Account(
	Email,
    Username,
    Fullname,
    DepartmentID,
    PositionID,
    CreateDate
)
values
('an.nguyen@vti.com','annguyen','Nguyen Van An', 1, 1, '2026-01-01'),
('binh.tran@vti.com','binhtran','Tran Hai Binh', 2, 2, '2026-01-02'),
('cuong.le@vti.com','cuongle','Le Minh Cuong', 3, 3, '2026-01-03'),
('dung.pham@vti.com','dungpham','Pham Tien Dung', 4, 4, '2026-01-04'),
('duong.ho@vti.com','duongho','Ho Hai Duong', 5, 5, '2026-01-05'),
('dat.vo@vti.com','datvo','Vo Quoc Dat', 6, 6, '2026-01-06'),
('dieu.ngo@vti.com','dieungo','Ngo Thi Dieu', 7, 7, '2026-01-07'),
('hoa.ly@vti.com','hoaly','Ly Thu Hoa', 8, 8, '2026-01-08'),
('khanh.do@vti.com','khanhdo','Do Minh Khanh', 9, 9, '2026-01-09'),
('loc.nguyen@vti.com','locnguyen','Nguyen Ba Loc', 10, 10, '2026-01-10');
select * from Account;

-- insert data Group
insert into `Group`
(
	GroupName,
    CreatorID,
    CreateDate
)
values
('Java Fresher', 1, '2026-02-01'),
('SQL Master', 2, '2026-02-02'),
('Backend Team', 3, '2026-02-03'),
('Frontend Team', 4, '2026-02-04'),
('DevOps Team', 5, '2026-02-05'),
('Testing Team', 6, '2026-02-06'),
('Security Team', 7, '2026-02-07'),
('AI Team', 8, '2026-02-08'),
('Cloud Team', 9, '2026-02-09'),
('Research Team', 10, '2026-02-10');
select * from `Group`;

-- Insert data Group Account
insert into GroupAccount
(
	GroupID,
    AccountID,
    JoinDate
)
values
(1, 1, '2026-03-01'),
(1, 2, '2026-03-02'),
(2, 3, '2026-03-03'),
(2, 4, '2026-03-04'),
(3, 5, '2026-03-05'),
(3, 6, '2026-03-06'),
(4, 7, '2026-03-07'),
(4, 8, '2026-03-08'),
(5, 9, '2026-03-09'),
(5, 10, '2026-03-10');
select * from GroupAccount;

-- Insert data Question
insert into Question(
	Content,
    CategoryID,
    TypeID,
    CreatorID,
    CreateDate
)
values
('What is Java?', 1, 1, 1, '2020-04-05'),
('What is SQL?', 2, 2, 2, '2020-04-05'),
('Explain .NET', 3, 3, 3, '2020-04-06'),
('What is Python?', 4, 4, 4, '2020-04-06'),
('What is Ruby?', 5, 5, 5, '2020-04-06'),
('Explain Postman', 6, 6, 6, '2020-04-06'),
('What is NodeJS?', 7, 7, 7, '2020-04-06'),
('Explain React?', 8, 8, 8, '2020-04-07'),
('What is HTML?', 9, 9, 9, '2020-04-07'),
('What is CSS?', 10, 10, 10, '2020-04-07');
select * from Question;

-- Insert data Answer
insert into Answer
(
	Content,
    QuestionID,
    isCorrect
)
values
	('Java is a programming language', 1, TRUE),
    ('SQL is a database language', 2, TRUE),
    ('.NET is a framework', 3, TRUE),
    ('Python is easy ', 4, TRUE),
    ('Ruby is dynamic', 5, TRUE),
    ('Postman is API tool', 6, TRUE),
    ('NodeJS runs JavaScript', 7, TRUE),
    ('React is frontend library', 8, TRUE),
    ('HTML creates web structure', 9, TRUE),
    ('CSS styles website', 10, TRUE);
    select * from Answer;
    
-- Insert data Exam
insert into exam 
(
	`Code`,
    Title,
    CategoryID,
    Duration,
    CreatorID,
    CreateDate
)
values 
('EX001', 'Java Basic Test', 1, 60, 1, '2019-04-05'),
('EX002', 'SQL Advanced Test', 2, 90, 2, '2019-04-05'),
('EX003', '.NET Test', 3, 45, 3, '2019-04-07'),
('EX004', 'Python Test', 4, 60, 4, '2020-04-08'),
('EX005', 'Ruby Test', 5, 30, 5, '2020-04-10'),
('EX006', 'Postman Test', 6, 50, 6, '2020-04-05'),
('EX007', 'NodeJS Test', 7, 70, 7, '2020-04-05'),
('EX008', 'React Test', 8, 80, 8, '2026-04-07'),
('EX009', 'HTML Test', 9, 40, 9, '2026-04-07'),
('EX010', 'CSS Test', 10, 55, 10, '2026-04-08');

select * from Exam;

-- Insert data ExamQuestion
insert into ExamQuestion
(
	ExamID,
    QuestionID
)
values
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
select * from ExamQuestion;

-- Question 2: Lấy ra tất cả các phòng ban
select * from  Department;
-- Question 3: Lấy ra id của phòng ban "Sale"
select DepartmentID
from Department
where DepartmentName = 'Sale';
-- Question 4: Lấy ra thông tin account có full name dài nhất 
select 		* 
from 		`Account` 
where 		length(Fullname) = (SELECT max(length(Fullname)) from `Account`)
order by 	Fullname desc;
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id  = 3
SELECT *
FROM Account
WHERE DepartmentID = 3
AND LENGTH(FullName) = (
    SELECT MAX(LENGTH(FullName))
    FROM Account
    WHERE DepartmentID = 3
);
-- Question 6: lấy ra tên group đã tham gia trước ngày 20/12/2019
select GroupName 
from `Group` 
where CreateDate < '2019-12-20';
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
select QuestionID
from Answer
group by QuestionID
having COUNT(QuestionID) >= 4;
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
select `code`
from Exam
where Duration >= 60 AND CreateDate < '2019/12/20';
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
select *
from `Group`
order by CreateDate DESC
limit 5;
-- Question 10: Đếm số nhân viên thuộc deparment có id = 2
select count(*) AS TotalAccount
from Account
where DepartmentID = 2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
select *
from `Account`
where FullName like 'D%o';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
select *
from exam
where CreateDate < '2019-12-20';
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
delete from question
where content like 'câu hỏi%';
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
SELECT *
FROM Account
WHERE AccountID = 5;
update `account`
set Fullname = 'Nguyễn Bá Lộc',
	Email = 'loc.nguyenba@vti.com.vn'
where AccountID = 5;
-- Question 15: update account có id =5 sẽ thuộc group có id = 4
update GroupAccount
set GroupID = 4
where AccountID = 5;