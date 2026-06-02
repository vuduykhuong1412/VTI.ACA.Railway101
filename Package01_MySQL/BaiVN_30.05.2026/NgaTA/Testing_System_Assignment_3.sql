# SQL – Assignment 3 
use Testing_System_Assignment_1;

-- XÓA TOÀN BỘ DATA CŨ
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE ExamQuestion;
TRUNCATE TABLE Answer;
TRUNCATE TABLE Question;
TRUNCATE TABLE Exam;
TRUNCATE TABLE GroupAccount;
TRUNCATE TABLE `Group`;
TRUNCATE TABLE `Account`;
TRUNCATE TABLE Department;
TRUNCATE TABLE `Position`;
TRUNCATE TABLE TypeQuestion;
TRUNCATE TABLE CategoryQuestion;

SET FOREIGN_KEY_CHECKS = 1;

-- INSERT DATA MẪU
-- Department
INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Sale'),
(2, 'Marketing'),
(3, 'IT'),
(4, 'HR'),
(5, 'Finance');

-- Position
INSERT INTO `Position` (PositionID, PositionName) VALUES
(1, 'Dev'),
(2, 'Test'),
(3, 'Scrum Master'),
(4, 'PM');

-- Account
INSERT INTO `Account` 
(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
VALUES
(1, 'nga@gmail.com', 'nga', 'Truong Ai Nga', 3, 1, '2021-01-10'),
(2, 'linh@gmail.com', 'linh', 'Nguyen My Linh', 3, 1, '2022-03-15'),
(3, 'hung@gmail.com', 'hung', 'Tran Van Hung', 3, 1, '2023-05-20'),
(4, 'duy@gmail.com', 'duy', 'Le Minh Duy', 3, 2, '2020-11-11'),
(5, 'thao@gmail.com', 'thao', 'Pham Thu Thao', 3, 2, '2010-12-21'),

(6, 'nam@gmail.com', 'nam', 'Nguyen Van Nam', 1, 1, '2011-01-01'),
(7, 'hai@gmail.com', 'hai', 'Tran Quang Hai', 1, 1, '2009-09-09'),
(8, 'vy@gmail.com', 'vy', 'Hoang Thanh Vy', 1, 2, '2024-02-02'),
(9, 'an@gmail.com', 'an', 'Do Gia An', 1, 4, '2025-01-01'),

(10, 'minh@gmail.com', 'minh', 'Pham Van Minh', 2, 1, '2019-08-08'),
(11, 'mai@gmail.com', 'mai', 'Le Thi Mai', 2, 3, '2020-01-15'),
(12, 'khoa@gmail.com', 'khoa', 'Tran Dang Khoa', 4, 3, '2018-06-06');

-- Group
INSERT INTO `Group` (GroupID, GroupName, CreatorID, CreateDate) VALUES
(1, 'Java Fresher', 1, '2023-01-01'),
(2, 'SQL Basic', 2, '2023-02-01'),
(3, 'Spring Boot', 3, '2023-03-01'),
(4, 'Empty Group 1', 1, '2023-04-01'),
(5, 'Empty Group 2', 2, '2023-05-01');

-- GroupAccount
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate) VALUES
(1, 1, '2023-01-05'),
(1, 2, '2023-01-06'),
(1, 3, '2023-01-07'),
(2, 4, '2023-02-05'),
(2, 5, '2023-02-06'),
(3, 1, '2023-03-05'),
(3, 6, '2023-03-06');

-- TypeQuestion
INSERT INTO TypeQuestion (TypeID, TypeName) VALUES
(1, 'Essay'),
(2, 'Multiple-Choice');

-- CategoryQuestion
INSERT INTO CategoryQuestion (CategoryID, CategoryName) VALUES
(1, 'Java'),
(2, 'SQL'),
(3, '.NET'),
(4, 'Postman'),
(5, 'Ruby');

-- Question
INSERT INTO Question 
(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) 
VALUES
(1, 'Java là gì?', 1, 1, 1, '2023-01-01'),
(2, 'SQL JOIN dùng để làm gì?', 2, 2, 2, '2023-01-02'),
(3, 'GROUP BY khác WHERE như thế nào?', 2, 1, 3, '2023-01-03'),
(4, 'Postman dùng để làm gì?', 4, 2, 4, '2023-01-04'),
(5, 'Ruby là ngôn ngữ gì?', 5, 1, 5, '2023-01-05'),
(6, 'Câu hỏi chưa có answer', 3, 2, 1, '2023-01-06');

-- Answer
INSERT INTO Answer 
(AnswerID, Content, QuestionID, isCorrect) 
VALUES
(1, 'Java là ngôn ngữ lập trình', 1, 1),
(2, 'Java là hệ điều hành', 1, 0),
(3, 'Java là database', 1, 0),
(4, 'Java là trình duyệt', 1, 0),

(5, 'JOIN dùng để ghép bảng', 2, 1),
(6, 'JOIN dùng để xóa bảng', 2, 0),

(7, 'GROUP BY dùng để gom nhóm', 3, 1),
(8, 'WHERE dùng để lọc dòng', 3, 1),

(9, 'Postman dùng để test API', 4, 1),
(10, 'Ruby là ngôn ngữ lập trình', 5, 1);

-- Exam
INSERT INTO Exam 
(ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) 
VALUES
(1, 'E001', 'Java Basic Test', 1, 60, 1, '2023-02-01'),
(2, 'E002', 'SQL Basic Test', 2, 45, 2, '2023-02-02'),
(3, 'E003', 'Backend Test', 1, 90, 3, '2023-02-03'),
(4, 'E004', 'API Test', 4, 30, 4, '2023-02-04');

-- ExamQuestion
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES
(1, 1),
(1, 2),
(1, 3),

(2, 1),
(2, 2),
(2, 4),

(3, 1),
(3, 3),
(3, 5),

(4, 4);

-- Exercise 1: Join 
-- Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
select a.AccountID, a.FullName, d.DepartmentName
from Account a join Department d
on a.DepartmentID = d.DepartmentID;


-- Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
select *
from Account
where CreateDate > '2010-12-20';

-- Viết lệnh để lấy ra tất cả các developer
select a.AccountID, a.FullName, p.PositionName
from Account a join Position p
on a.PositionID = p.PositionID
where p.PositionName = 'Dev';

-- Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
select d.DepartmentID, d.DepartmentName, count(*) as TotalEmployee 
from Account a join Department d
on a.DepartmentID = d.DepartmentID
group by d.DepartmentName, d.DepartmentID
having count(*) > 3;

-- Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select q.QuestionID,
q.Content,
count(*) as TotalExam
from ExamQuestion eq
join Question q
on eq.QuestionID = q.QuestionID
group by q.QuestionID, q.Content
order by TotalExam desc
limit 1;

-- Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
select cq.CategoryID, cq.CategoryName, count(*) as Total
from CategoryQuestion cq
join Question q
on q.CategoryID = cq.CategoryID 
group by cq.CategoryID, cq.CategoryName; 


-- Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select q.QuestionID, q.Content, count(*) as Total
from ExamQuestion eq 
join Question q 
on q.QuestionID = eq.QuestionID
group by q.QuestionID, q.Content;

-- Lấy ra Question có nhiều câu trả lời nhất 
select q.QuestionID, q.Content, count(*) as TotalAcount
from Question q
join Answer a
on q.QuestionID = a.QuestionID
group by q.QuestionID, q.Content 
order by Total desc
limit 1;

-- Thống kê số lượng account trong mỗi group
select g.GroupID, g.GroupName, count(*) as Total
from GroupAccount ga
join `Group` g
on ga.GroupID = g.GroupID
group by g.GroupID, g.GroupName; 

-- Tìm chức vụ có ít người nhất
select p.PositionID, p.PositionName, count(*) as TotalUser
from Account a
join Position p
on a.PositionID = p.PositionID
group by p.PositionID, p.PositionName
order by TotalUser asc
limit 1;

-- Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
select d.DepartmentID, d.DepartmentName, p.PositionName, count(*) as TotalUser
from Account a
join Position p
on a.PositionID = p.PositionID
join Department d
on a.DepartmentID = d.DepartmentID
group by d.DepartmentID, d.DepartmentName, p.PositionName;

-- Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … 
select q. QuestionID,
q.Content as 'Question', 
tq.TypeName as 'Type Question',
ac.FullName as 'Creator Name',
a.Content as 'Answer'
from Question q
join TypeQuestion tq
on q.TypeID = tq.TypeID
join Account ac
on q.CreatorID = ac.AccountID
left join Answer a 
on a.QuestionID = q.QuestionID;

-- Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select tq.TypeID, tq.TypeName, count(*) as Total
from Question q 	
join TypeQuestion tq
on q.TypeID = tq.TypeID
group by tq.TypeID, tq.TypeName;

-- Lấy ra group không có account nào
select g.GroupID, g.GroupName, count(ga.AccountID) as TotalAccount
from `Group` g
left join GroupAccount ga
on g.GroupID = ga.GroupID
group by g.GroupID, g.GroupName
having count(ga.AccountID) = 0;

-- Lấy ra group không có account nào 
select g.GroupID, g.GroupName
from `Group` g
left join GroupAccount ga
on g.GroupID = ga.GroupID
where ga.AccountID is null;

-- Lấy ra question không có answer nào 
select q.QuestionID, q.Content, count(a.AnswerID) as TotalAnswer
from Question q
left join Answer a
on q.QuestionID = a.QuestionID
group by q.QuestionID, q.Content
having count(a.AnswerID) = 0;

-- Lấy ra question không có answer nào 
select q.QuestionID, q.Content
from Question q
left join Answer a
on q.QuestionID = a.QuestionID
where a.AnswerID is null;

-- Exercise 2: Union
-- Thêm account mới để group có nhiều thành viên hơn
INSERT INTO `Account`
(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
(13, 'user13@gmail.com', 'user13', 'Nguyen Van A', 1, 1, '2023-01-01'),
(14, 'user14@gmail.com', 'user14', 'Nguyen Van B', 1, 2, '2023-01-01'),
(15, 'user15@gmail.com', 'user15', 'Nguyen Van C', 2, 1, '2023-01-01'),
(16, 'user16@gmail.com', 'user16', 'Nguyen Van D', 2, 3, '2023-01-01'),
(17, 'user17@gmail.com', 'user17', 'Nguyen Van E', 3, 4, '2023-01-01'),
(18, 'user18@gmail.com', 'user18', 'Nguyen Van F', 3, 1, '2023-01-01');

-- Thêm thành viên vào các group
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
-- Group 1: tổng 7 thành viên
(1, 13, '2023-01-08'),
(1, 14, '2023-01-09'),
(1, 15, '2023-01-10'),
(1, 16, '2023-01-11'),

-- Group 2: tổng 6 thành viên
(2, 13, '2023-02-07'),
(2, 14, '2023-02-08'),
(2, 15, '2023-02-09'),
(2, 16, '2023-02-10'),

-- Group 3: tổng 3 thành viên
(3, 17, '2023-03-07');

-- Lấy các account thuộc nhóm thứ 1
select a.AccountID, a.FullName, ga.GroupID
from Account a
join GroupAccount ga
on a.AccountID = ga.AccountID
where ga.GroupID = 1;

-- Lấy các account thuộc nhóm thứ 2 
select a.AccountID, a.FullName, ga.GroupID
from Account a
join GroupAccount ga
on a.AccountID = ga.AccountID
where ga.GroupID = 2;

-- Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 
select a.AccountID, a.FullName, ga.GroupID
from Account a
join GroupAccount ga
on a.AccountID = ga.AccountID
where ga.GroupID = 1

union 

select a.AccountID, a.FullName, ga.GroupID
from Account a
join GroupAccount ga
on a.AccountID = ga.AccountID
where ga.GroupID = 2;

-- Lấy các group có lớn hơn 5 thành viên 
select g.GroupID, g.GroupName, count(ga.AccountID) as TotalMember
from `Group` g
left join GroupAccount ga
on g.GroupID = ga.GroupID
group by g.GroupID, g.GroupName
having TotalMember > 5; 

-- Lấy các group có nhỏ hơn 7 thành viên 
select g.GroupID, g.GroupName, count(ga.AccountID) as TotalMember
from `Group` g
left join GroupAccount ga
on g.GroupID = ga.GroupID
group by g.GroupID, g.GroupName
having TotalMember < 7; 

-- Ghép 2 kết quả từ câu a) và câu b) 
select g.GroupID, g.GroupName, count(ga.AccountID) as TotalMember
from `Group` g
left join GroupAccount ga
on g.GroupID = ga.GroupID
group by g.GroupID, g.GroupName
having TotalMember > 5

union

select g.GroupID, g.GroupName, count(ga.AccountID) as TotalMember
from `Group` g
left join GroupAccount ga
on g.GroupID = ga.GroupID
group by g.GroupID, g.GroupName
having TotalMember < 7;