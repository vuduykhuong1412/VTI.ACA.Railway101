CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

-- =====================================================================================
-- EXERCISE 1 - QUESTION 1: OPTIMIZE SCHEMAS & CONSTRAINTS
-- =====================================================================================

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

-- =====================================================================================
-- EXERCISE 1 - QUESTION 2 & EXERCISE 2 - QUESTION 1: INSERT MOCK DATA (>= 10 RECORDS)
-- =====================================================================================

INSERT INTO Department (DepartmentName) 
VALUES 
(N'Marketing'), (N'Sale'), (N'Bảo vệ'), (N'Nhân sự'), (N'Kỹ thuật'), 
(N'Tài chính'), (N'Phó giám đốc'), (N'Giám đốc'), (N'Thư ký'), (N'Bán hàng');

INSERT INTO Position (PositionName) 
VALUES 
('Dev'), ('Test'), ('Scrum Master'), ('PM');

INSERT INTO Account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
VALUES 
('dang.le@vti.com.vn', 'dang.le', 'Le Hai Dang', 1, 1, '2019-11-05'),
('lan.nguyen@vti.com.vn', 'lan.nguyen', 'Nguyen Thi Lan', 2, 2, '2019-12-15'),
('minh.tran@vti.com.vn', 'minh.tran', 'Tran Van Minh', 3, 3, '2020-01-10'),
('huong.pham@vti.com.vn', 'huong.pham', 'Pham Thanh Huong', 2, 1, '2019-12-25'),
('loc.nguyenba@vti.com.vn', 'loc.nguyenba', 'Nguyen Ba Loc', 5, 4, '2019-10-01'),
('dung.hoang@vti.com.vn', 'dung.hoang', 'Hoang Tien Dung', 2, 2, '2019-12-18'),
('oanh.vu@vti.com.vn', 'oanh.vu', 'Vu Thi Oanh', 7, 3, '2020-02-20'),
('tu.le@vti.com.vn', 'tu.le', 'Le Hoang Tu', 8, 4, '2020-03-15'),
('Duong.nguyen@vti.com.vn', 'duong.nguyen', 'Nguyen Van Duong', 2, 1, '2019-11-20'),
('phong.bui@vti.com.vn', 'phong.bui', 'Bui Minh Phong', 10, 2, '2020-05-12');

INSERT INTO `Group` (GroupName, CreatorID, CreateDate) 
VALUES 
('Pegasus Chapter', 1, '2019-11-10'),
('Dev Team 1', 5, '2019-12-01'),
('Testing Group', 2, '2019-12-20'),
('Management Crew', 8, '2020-01-05'),
('Marketing Hub', 1, '2019-11-12'),
('Sale Force', 4, '2019-12-28'),
('Scrum Masters', 3, '2020-01-15'),
('Data Analytics', 5, '2020-02-01'),
('Automation Test', 6, '2020-02-15'),
('Intern Ship', 1, '2020-03-01');

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate) 
VALUES 
(1, 1, '2019-11-11'), (1, 2, '2019-12-16'), (1, 3, '2020-01-11'),
(2, 5, '2019-12-02'), (2, 1, '2019-12-05'), (3, 2, '2019-12-21'),
(3, 6, '2019-12-22'), (4, 8, '2020-01-06'), (4, 7, '2020-02-21'),
(5, 1, '2019-11-13'), (6, 4, '2019-12-29'), (6, 9, '2019-12-30');

INSERT INTO TypeQuestion (TypeName) 
VALUES 
('Essay'), ('Multiple-Choice');

INSERT INTO CategoryQuestion (CategoryName) 
VALUES 
('Java'), ('.NET'), ('SQL'), ('Postman'), ('Ruby'), 
('Python'), ('C++'), ('HTML'), ('CSS'), ('JavaScript');

INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) 
VALUES 
('câu hỏi về Java OOP là gì?', 1, 1, 1, '2019-11-15'),
('câu hỏi về Spring Boot để làm gì?', 1, 2, 1, '2019-11-16'),
('câu hỏi về LINQ trong .NET?', 2, 2, 5, '2019-12-05'),
('câu hỏi về SQL Truncate vs Delete?', 3, 2, 3, '2019-12-10'),
('câu hỏi về Postman Environment?', 4, 1, 2, '2019-12-22'),
('câu hỏi về Ruby on Rails?', 5, 2, 4, '2020-01-02'),
('Python Decorators là gì?', 6, 1, 5, '2020-01-20'),
('Con trỏ trong C++?', 7, 2, 8, '2020-02-11'),
('Flexbox trong CSS?', 9, 2, 10, '2020-03-01'),
('Async Await JavaScript?', 10, 1, 1, '2020-03-10');

INSERT INTO Answer (Content, QuestionID, isCorrect) 
VALUES 
('Tính kế thừa, đóng gói, đa hình, trừu tượng', 1, 1),
('Là một Framework phát triển Web', 2, 1),
('Language Integrated Query', 3, 1),
('Truncate nhanh hơn và không rollback', 4, 1),
('Biến môi trường trong Postman', 5, 1),
('Một câu trả lời sai mẫu 1', 4, 0),
('Một câu trả lời sai mẫu 2', 4, 0),
('Một câu trả lời sai mẫu 3', 4, 0),
('Một câu trả lời sai mẫu 4', 4, 0),
('Là một tính năng bất đồng bộ', 10, 1);

INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate) 
VALUES 
('VTI001', 'Đề thi Java Cơ Bản', 1, 60, 1, '2019-11-20'),
('VTI002', 'Đề thi .NET Nâng Cao', 2, 90, 5, '2019-12-08'),
('VTI003', 'Đề thi SQL Thiết kế DB', 3, 45, 3, '2019-12-15'),
('VTI004', 'Đề thi Postman API', 4, 60, 2, '2019-12-24'),
('VTI005', 'Đề thi Web Frontend', 9, 30, 10, '2020-03-05'),
('VTI006', 'Đề thi Ruby Cơ Bản', 5, 60, 4, '2020-01-05'),
('VTI007', 'Đề thi Python Scripting', 6, 120, 5, '2020-01-25'),
('VTI008', 'Đề thi C++ Thuật toán', 7, 90, 8, '2020-02-15'),
('VTI009', 'Đề thi JavaScript ES6', 10, 60, 1, '2020-03-12'),
('VTI010', 'Đề thi Java Web Nâng cao', 1, 90, 1, '2019-11-25');

INSERT INTO ExamQuestion (ExamID, QuestionID) 
VALUES 
(1, 1), (1, 2), (2, 3), (3, 4), (4, 5), 
(6, 6), (7, 7), (8, 8), (9, 10), (10, 2);

-- =====================================================================================
-- EXERCISE 2: DATA QUERIES
-- =====================================================================================

-- Question 2: Lấy ra tất cả các phòng ban
SELECT * FROM Department;

-- Question 3: Lấy ra id của phòng ban 'Sale'
SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sale';

-- Question 4: Lấy ra thông tin account có full name dài nhất
SELECT * FROM Account WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM Account);

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT * FROM Account WHERE DepartmentID = 3 AND LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM Account WHERE DepartmentID = 3);

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT g.GroupName FROM `Group` g
JOIN GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.JoinDate < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID FROM Answer GROUP BY QuestionID HAVING COUNT(AnswerID) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `Code` FROM Exam WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(AccountID) AS TotalEmployee FROM Account WHERE DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT * FROM Account WHERE FullName LIKE 'D%o';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM Exam WHERE CreateDate < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM Question WHERE Content LIKE 'câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE Account SET FullName = N'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn' WHERE AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE GroupAccount SET GroupID = 4 WHERE AccountID = 5 LIMIT 1;