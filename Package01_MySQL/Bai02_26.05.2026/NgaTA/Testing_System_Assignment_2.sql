use Testing_System_Assignment_1;

-- insert data
-- Department
insert into Department (DepartmentName)
values 
('Finance'),
('Security'),
('Business Analyst'),
('Customer Service'),
('Support'),
('AI Research'),
('Design'),
('Operations'),
('Logistics'),
('Training');

-- Position
insert into Position (PositionName)
values
('Backend Dev'),
('Frontend Dev'),
('Database Admin'),
('UI/UX Designer'),
('Business Analyst'),
('Security Engineer'),
('DevOps'),
('Team Leader'),
('Intern'),
('Product Owner');

-- Account
insert into Account 
(Email, Username, FullName, DepartmentID, PositionID)
values
('huy@gmail.com', 'huy01', 'Nguyen Quang Huy', 5, 5),
('mai@gmail.com', 'mai01', 'Le Thi Mai', 6, 6),
('phuc@gmail.com', 'phuc01', 'Tran Minh Phuc', 7, 7),
('hoa@gmail.com', 'hoa01', 'Vo Thi Hoa', 8, 8),
('duc@gmail.com', 'duc01', 'Pham Minh Duc', 9, 9),
('tam@gmail.com', 'tam01', 'Nguyen Thi Tam', 10, 10),
('vy@gmail.com', 'vy01', 'Le Ngoc Vy', 11, 1),
('long@gmail.com', 'long01', 'Tran Hoang Long', 12, 2),
('dat@gmail.com', 'dat01', 'Bui Tien Dat', 13, 3),
('thao@gmail.com', 'thao01', 'Dang Phuong Thao', 14, 4);

-- Group
insert into `Group`
(GroupName, CreatorID)
values
('Backend Team', 5),
('Frontend Team', 6),
('DevOps Club', 7),
('AI Engineer', 8),
('Database Team', 9),
('Security Team', 10),
('Tester Group', 11),
('Java Advanced', 12),
('Spring Boot Team', 13),
('Cloud Computing', 14);

-- GroupAccount
insert into GroupAccount
(GroupID, AccountID, JoinDate)
values
(4, 5, '2026-05-05'),
(4, 6, '2026-05-06'),
(5, 7, '2026-05-07'),
(5, 8, '2026-05-08'),
(6, 9, '2026-05-09'),
(6, 10, '2026-05-10'),
(7, 11, '2026-05-11'),
(8, 12, '2026-05-12'),
(9, 13, '2026-05-13'),
(10, 14, '2026-05-14');

-- TypeQuestion
insert into TypeQuestion (TypeName)
values
('True/False'),
('Fill in blank'),
('Short Answer'),
('Code Review'),
('Theory'),
('Practical'),
('Matching'),
('Interview'),
('Quiz'),
('Final Exam');

-- CategoryQuestion
insert into CategoryQuestion (CategoryName)
values
('Spring Boot'),
('ReactJS'),
('Docker'),
('Kubernetes'),
('AWS'),
('Linux'),
('Git'),
('Cyber Security'),
('Machine Learning'),
('Data Structure');

-- Question
insert into Question
(Content, CategoryID, TypeID, CreatorID)
values
('Spring Boot dung de lam gi?', 5, 3, 5),
('ReactJS la framework hay library?', 6, 1, 6),
('Docker co dung de container hoa khong?', 7, 2, 7),
('Kubernetes dung de quan ly gi?', 8, 4, 8),
('AWS la dich vu cua cong ty nao?', 9, 5, 9),
('Linux co phai he dieu hanh ma nguon mo?', 10, 1, 10),
('Git dung de quan ly source code dung khong?', 11, 2, 11),
('Firewall co tac dung gi?', 12, 3, 12),
('Machine Learning thuoc linh vuc nao?', 13, 4, 13),
('Stack va Queue la cau truc du lieu dung khong?', 14, 1, 14);

-- Answer
insert into Answer
(Content, QuestionID, isCorrect)
values
('Framework Java', 5, true),
('Library', 6, true),
('Dung', 7, true),
('Quan ly container', 8, true),
('Amazon', 9, true),
('Dung', 10, true),
('Dung', 11, true),
('Bao mat mang', 12, true),
('Tri tue nhan tao', 13, true),
('Dung', 14, true);

-- Exam
insert into Exam
(Code, Title, CategoryID, Duration, CreatorID)
values
('EX004', 'Spring Boot Test', 5, 60, 5),
('EX005', 'ReactJS Basic', 6, 45, 6),
('EX006', 'Docker Practice', 7, 50, 7),
('EX007', 'Kubernetes Exam', 8, 90, 8),
('EX008', 'AWS Cloud', 9, 60, 9),
('EX009', 'Linux Command', 10, 40, 10),
('EX010', 'Git Master', 11, 30, 11),
('EX011', 'Cyber Security', 12, 75, 12),
('EX012', 'AI Basic', 13, 80, 13),
('EX013', 'Data Structure', 14, 100, 14);

-- ExamQuestion
insert into ExamQuestion
(ExamID, QuestionID)
values
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14);

-- Lấy ra tất cả các phòng ban
select * from Department;

-- Lấy ra id của phòng ban "Sale" 
select d.DepartmentID
from Department d
where d.DepartmentName = 'Sale';

-- Lấy ra thông tin account có full name dài nhất
-- C1: Có thể có nhiều account vì cùng độ dài 
select *
from Account a
where char_length(a.FullName) = (
select max(char_length(FullName))
from Account
);

-- C2: vì dùng limit 1 nên chỉ lấy được 1 account 
select *
from Account
order by char_length(FullName) desc
limit 1;

-- Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id  = 3 
-- C1
select *
from Account a
where a.DepartmentID = 3
and char_length(a.FullName) = (
    select max(char_length(FullName))
    from Account
    where DepartmentID = 3
);

-- C2
select *
from Account a 
where a.DepartmentID = 3
order by char_length(a.FullName) desc
limit 1; 

-- Lấy ra tên group đã tham gia trước ngày 20/12/2019 
select GroupName
from `Group` g
join GroupAccount ga on g.GroupiD = ga.GroupID 
where JoinDate < '2019-12-20';

-- Lấy ra ID của question có >= 4 câu trả lời 
# em không chắc với cách em làm muốn được thầy giải thích em cầu này ạ
select QuestionID
from Answer
group by QuestionID
having count(AnswerID) >= 4;

-- Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
select *
from Exam
where Duration >= 60 and CreateDate < '2019-12-20';

-- Lấy ra 5 group được tạo gần đây nhất 
select * 
from `Group`
order by CreateDate desc
limit 5;

-- Đếm số nhân viên thuộc department có id = 2 
select count(*) as 'Số nhân viên thuộc department có id = 2'
from Account 
where DepartmentID = 2;

-- Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
select *
from Account 
where FullName like  'D%o';

-- Xóa tất cả các exam được tạo trước ngày 20/12/2019
delete from Exam
where CreateDate < '2019-12-20';

-- Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 
delete from Question
where Content like 'câu hỏi%';

-- Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" 
-- và email thành loc.nguyenba@vti.com.vn h 
update Account
set FullName = 'Nguyễn Bá Lộc',
    Email = 'loc.nguyenba@vti.com.vn'
where AccountID = 5;

-- update account có id = 5 sẽ thuộc group có id = 4 
update GroupAccount
set GroupID = 4
where AccountID = 5;