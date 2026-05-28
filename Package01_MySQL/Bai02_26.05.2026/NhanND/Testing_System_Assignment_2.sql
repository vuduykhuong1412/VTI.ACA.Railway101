-- Bảng Department
CREATE TABLE IF NOT EXISTS Department (
    DepartmentID   INT             NOT NULL AUTO_INCREMENT,
    DepartmentName NVARCHAR(100)   NOT NULL,
    CONSTRAINT PK_Department PRIMARY KEY (DepartmentID),
    CONSTRAINT UQ_Department_Name UNIQUE (DepartmentName)
);

-- Bảng Position (chức vụ)
CREATE TABLE IF NOT EXISTS `Position` (
    PositionID   INT           NOT NULL AUTO_INCREMENT,
    PositionName NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Position PRIMARY KEY (PositionID),
    CONSTRAINT UQ_Position_Name UNIQUE (PositionName)
);

-- Bảng Account (nhân viên / người dùng)
CREATE TABLE IF NOT EXISTS Account (
    AccountID    INT           NOT NULL AUTO_INCREMENT,
    Email        VARCHAR(255)  NOT NULL,
    Username     VARCHAR(100)  NOT NULL,
    FullName     NVARCHAR(150) NOT NULL,
    Password     VARCHAR(255)  NOT NULL,
    PhoneNumber  VARCHAR(15)   NULL,
    DepartmentID INT           NULL,
    PositionID   INT           NULL,
    CreateDate   DATE          NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT PK_Account      PRIMARY KEY (AccountID),
    CONSTRAINT UQ_Account_Email    UNIQUE (Email),
    CONSTRAINT UQ_Account_Username UNIQUE (Username),
    CONSTRAINT FK_Account_Department
        FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT FK_Account_Position
        FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT CHK_Account_Phone
        CHECK (PhoneNumber REGEXP '^[0-9]{9,15}$')
);

-- Bảng `Group`
CREATE TABLE IF NOT EXISTS `Group` (
    GroupID     INT           NOT NULL AUTO_INCREMENT,
    GroupName   NVARCHAR(150) NOT NULL,
    CreateDate  DATE          NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT PK_Group PRIMARY KEY (GroupID),
    CONSTRAINT UQ_Group_Name UNIQUE (GroupName)
);

-- Bảng Account_Group (quan hệ nhiều-nhiều)
CREATE TABLE IF NOT EXISTS Account_Group (
    AccountID  INT  NOT NULL,
    GroupID    INT  NOT NULL,
    JoinDate   DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT PK_Account_Group
        PRIMARY KEY (AccountID, GroupID),
    CONSTRAINT FK_AG_Account
        FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_AG_Group
        FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Bảng TypeQuestion
CREATE TABLE IF NOT EXISTS TypeQuestion (
    TypeID   INT           NOT NULL AUTO_INCREMENT,
    TypeName NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_TypeQuestion PRIMARY KEY (TypeID),
    CONSTRAINT UQ_TypeQuestion_Name UNIQUE (TypeName)
);

-- Bảng Question
CREATE TABLE IF NOT EXISTS Question (
    QuestionID   INT            NOT NULL AUTO_INCREMENT,
    Content      NVARCHAR(1000) NOT NULL,
    TypeID       INT            NOT NULL,
    DepartmentID INT            NULL,
    CreateByID   INT            NULL,
    CreateDate   DATE           NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT PK_Question PRIMARY KEY (QuestionID),
    CONSTRAINT FK_Question_Type
        FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID)
        ON UPDATE CASCADE,
    CONSTRAINT FK_Question_Department
        FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT FK_Question_Account
        FOREIGN KEY (CreateByID) REFERENCES Account(AccountID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Bảng Answer
CREATE TABLE IF NOT EXISTS Answer (
    AnswerID   INT            NOT NULL AUTO_INCREMENT,
    Content    NVARCHAR(500)  NOT NULL,
    IsCorrect  TINYINT(1)     NOT NULL DEFAULT 0,
    QuestionID INT            NOT NULL,
    CONSTRAINT PK_Answer PRIMARY KEY (AnswerID),
    CONSTRAINT FK_Answer_Question
        FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT CHK_Answer_IsCorrect CHECK (IsCorrect IN (0, 1))
);

-- Bảng Exam
CREATE TABLE IF NOT EXISTS Exam (
    ExamID      INT            NOT NULL AUTO_INCREMENT,
    ExamCode    VARCHAR(50)    NOT NULL,
    Title       NVARCHAR(200)  NOT NULL,
    Duration    INT            NOT NULL COMMENT 'Thời gian thi (phút)',
    CreateByID  INT            NULL,
    CreateDate  DATE           NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT PK_Exam PRIMARY KEY (ExamID),
    CONSTRAINT UQ_Exam_Code UNIQUE (ExamCode),
    CONSTRAINT FK_Exam_Account
        FOREIGN KEY (CreateByID) REFERENCES Account(AccountID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT CHK_Exam_Duration CHECK (Duration > 0)
);

-- Bảng Exam_Question (quan hệ nhiều-nhiều)
CREATE TABLE IF NOT EXISTS Exam_Question (
    ExamID     INT NOT NULL,
    QuestionID INT NOT NULL,
    CONSTRAINT PK_Exam_Question PRIMARY KEY (ExamID, QuestionID),
    CONSTRAINT FK_EQ_Exam
        FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_EQ_Question
        FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- =============================================
-- EXERCISE 1 - QUESTION 2 & EXERCISE 2 - QUESTION 1
-- Insert dữ liệu (>= 10 records mỗi bảng)
-- =============================================

-- -----------------------------------------------
-- Department
-- -----------------------------------------------
INSERT INTO Department (DepartmentName) VALUES
    (N'Marketing'),
    (N'Sale'),
    (N'Bảo vệ'),
    (N'Nhân sự'),
    (N'Kỹ thuật'),
    (N'Tài chính'),
    (N'Phó giám đốc'),
    (N'Giám đốc'),
    (N'Thư ký'),
    (N'Bán hàng');

-- -----------------------------------------------
-- Position
-- -----------------------------------------------
INSERT INTO `Position` (PositionName) VALUES
    (N'Nhân viên'),
    (N'Trưởng nhóm'),
    (N'Trưởng phòng'),
    (N'Phó giám đốc'),
    (N'Giám đốc'),
    (N'Thực tập sinh'),
    (N'Chuyên viên'),
    (N'Kỹ sư'),
    (N'Kiểm thử viên'),
    (N'Lập trình viên');

-- -----------------------------------------------
-- Account
-- -----------------------------------------------
INSERT INTO Account (Email, Username, FullName, Password, PhoneNumber, DepartmentID, PositionID, CreateDate) VALUES
    ('an.nguyen@vti.com.vn',      'an.nguyen',      N'Nguyễn Văn An',        'hashed_pw_1', '0912345601', 1,  1,  '2019-10-01'),
    ('binh.tran@vti.com.vn',      'binh.tran',      N'Trần Thị Bình',        'hashed_pw_2', '0912345602', 2,  2,  '2019-11-05'),
    ('cuong.le@vti.com.vn',       'cuong.le',       N'Lê Văn Cường',         'hashed_pw_3', '0912345603', 3,  3,  '2019-11-15'),
    ('dung.pham@vti.com.vn',      'dung.pham',      N'Phạm Thị Dung',        'hashed_pw_4', '0912345604', 4,  1,  '2019-12-01'),
    ('dao.hoang@vti.com.vn',      'dao.hoang',      N'Hoàng Văn Đào',        'hashed_pw_5', '0912345605', 5,  10, '2019-12-10'),
    ('giang.vu@vti.com.vn',       'giang.vu',       N'Vũ Thị Giang',         'hashed_pw_6', '0912345606', 2,  1,  '2020-01-10'),
    ('hung.do@vti.com.vn',        'hung.do',        N'Đỗ Văn Hùng',          'hashed_pw_7', '0912345607', 5,  8,  '2020-01-20'),
    ('lan.nguyen@vti.com.vn',     'lan.nguyen',     N'Nguyễn Thị Lan',       'hashed_pw_8', '0912345608', 1,  7,  '2020-02-01'),
    ('minh.bui@vti.com.vn',       'minh.bui',       N'Bùi Văn Minh',         'hashed_pw_9', '0912345609', 3,  1,  '2020-02-15'),
    ('nam.dinh@vti.com.vn',       'nam.dinh',       N'Đinh Thị Nam',         'hashed_pw_10','0912345610', 6,  3,  '2020-03-01'),
    ('dieu.truong@vti.com.vn',    'dieu.truong',    N'Trương Thị Diệu',      'hashed_pw_11','0912345611', 4,  2,  '2020-03-15'),
    ('khanh.phan@vti.com.vn',     'khanh.phan',     N'Phan Văn Khánh',       'hashed_pw_12','0912345612', 5,  9,  '2020-04-01');

-- -----------------------------------------------
-- Group
-- -----------------------------------------------
INSERT INTO `Group` (GroupName, CreateDate) VALUES
    (N'Nhóm Kỹ thuật A',   '2019-10-05'),
    (N'Nhóm Marketing B',  '2019-11-10'),
    (N'Nhóm Sale C',       '2019-12-01'),
    (N'Nhóm Kiểm thử D',   '2019-12-18'),
    (N'Nhóm Dev E',        '2020-01-08'),
    (N'Nhóm HR F',         '2020-01-15'),
    (N'Nhóm Finance G',    '2020-02-20'),
    (N'Nhóm Admin H',      '2020-03-10'),
    (N'Nhóm Support I',    '2020-03-25'),
    (N'Nhóm Training J',   '2020-04-05');

-- -----------------------------------------------
-- Account_Group
-- -----------------------------------------------
INSERT INTO Account_Group (AccountID, GroupID, JoinDate) VALUES
    (1,  1,  '2019-10-10'),
    (2,  2,  '2019-11-15'),
    (3,  3,  '2019-12-05'),
    (4,  3,  '2019-12-10'),
    (5,  1,  '2019-12-15'),
    (6,  2,  '2020-01-12'),
    (7,  5,  '2020-01-22'),
    (8,  6,  '2020-02-05'),
    (9,  4,  '2020-02-20'),
    (10, 7,  '2020-03-05'),
    (11, 8,  '2020-03-20'),
    (12, 9,  '2020-04-08');

-- -----------------------------------------------
-- TypeQuestion
-- -----------------------------------------------
INSERT INTO TypeQuestion (TypeName) VALUES
    (N'Một đáp án'),
    (N'Nhiều đáp án'),
    (N'Đúng/Sai'),
    (N'Điền vào chỗ trống'),
    (N'Tự luận'),
    (N'Ghép cặp'),
    (N'Sắp xếp thứ tự'),
    (N'Chọn hình ảnh'),
    (N'Kéo thả'),
    (N'Câu hỏi mở');

-- -----------------------------------------------
-- Question
-- -----------------------------------------------
INSERT INTO Question (Content, TypeID, DepartmentID, CreateByID, CreateDate) VALUES
    (N'SQL là viết tắt của từ gì?',                         1, 5, 7,  '2019-10-20'),
    (N'Câu hỏi về khái niệm JOIN trong SQL?',               1, 5, 7,  '2019-11-01'),
    (N'Câu hỏi về các loại index trong Database?',          2, 5, 8,  '2019-11-10'),
    (N'Câu hỏi về Primary Key và Foreign Key?',             1, 5, 8,  '2019-12-05'),
    (N'Câu hỏi về stored procedure là gì?',                 1, 5, 7,  '2019-12-12'),
    (N'Các nguyên tắc SOLID trong lập trình hướng đối tượng?', 2, 5, 12, '2020-01-05'),
    (N'Câu hỏi phân biệt INNER JOIN và OUTER JOIN?',        1, 5, 8,  '2020-01-15'),
    (N'Câu hỏi về chuẩn hoá cơ sở dữ liệu (Normalization)?', 2, 5, 7, '2020-02-01'),
    (N'Câu hỏi về transaction và ACID properties?',         1, 5, 12, '2020-02-10'),
    (N'Câu hỏi về trigger trong SQL?',                      1, 5, 8,  '2020-03-01'),
    (N'Câu hỏi về view trong SQL?',                         1, 5, 7,  '2020-03-15'),
    (N'Câu hỏi về hàm window function trong SQL?',          2, 5, 12, '2020-04-01');

-- -----------------------------------------------
-- Answer
-- -----------------------------------------------
INSERT INTO Answer (Content, IsCorrect, QuestionID) VALUES
    -- Q1: SQL là viết tắt của gì? (4 đáp án)
    (N'Structured Query Language',           1, 1),
    (N'Simple Query Language',               0, 1),
    (N'Standard Query Language',             0, 1),
    (N'Sequential Query Language',           0, 1),
    -- Q2: JOIN (4 đáp án)
    (N'Kết hợp dữ liệu từ nhiều bảng',       1, 2),
    (N'Xóa dữ liệu trùng lặp',              0, 2),
    (N'Tạo bảng mới trong database',         0, 2),
    (N'Sắp xếp dữ liệu tăng dần',           0, 2),
    -- Q3: Index (4 đáp án)
    (N'B-tree Index',                        1, 3),
    (N'Hash Index',                          1, 3),
    (N'Full-text Index',                     1, 3),
    (N'Virtual Index',                       0, 3),
    -- Q4: PK và FK (4 đáp án)
    (N'PK định danh duy nhất một bản ghi',   1, 4),
    (N'FK liên kết hai bảng với nhau',       1, 4),
    (N'PK có thể chứa giá trị NULL',         0, 4),
    (N'FK không cần tham chiếu đến PK',      0, 4),
    -- Q5: Stored Procedure (4 đáp án)
    (N'Là tập hợp các câu lệnh SQL được lưu sẵn', 1, 5),
    (N'Là một loại bảng trong database',     0, 5),
    (N'Chỉ dùng để SELECT dữ liệu',         0, 5),
    (N'Không thể nhận tham số đầu vào',      0, 5),
    -- Q6: SOLID (4 đáp án)
    (N'Single Responsibility Principle',     1, 6),
    (N'Open/Closed Principle',               1, 6),
    (N'Liskov Substitution Principle',       1, 6),
    (N'Simple Object Language Design',       0, 6),
    -- Q7: INNER vs OUTER JOIN (3 đáp án)
    (N'INNER JOIN chỉ lấy bản ghi khớp ở cả 2 bảng', 1, 7),
    (N'LEFT JOIN lấy tất cả bản ghi bảng trái',       1, 7),
    (N'OUTER JOIN không tồn tại trong SQL',           0, 7),
    -- Q8: Normalization (4 đáp án)
    (N'1NF: Loại bỏ nhóm dữ liệu lặp',     1, 8),
    (N'2NF: Loại bỏ phụ thuộc một phần',    1, 8),
    (N'3NF: Loại bỏ phụ thuộc bắc cầu',     1, 8),
    (N'4NF: Thêm nhiều cột vào bảng',       0, 8);

-- -----------------------------------------------
-- Exam
-- -----------------------------------------------
INSERT INTO Exam (ExamCode, Title, Duration, CreateByID, CreateDate) VALUES
    ('EX001', N'Kiểm tra SQL cơ bản',            45,  7,  '2019-10-25'),
    ('EX002', N'Kiểm tra SQL nâng cao',           90,  8,  '2019-11-20'),
    ('EX003', N'Kiểm tra OOP',                    60,  12, '2019-12-15'),
    ('EX004', N'Kiểm tra Database Design',        75,  7,  '2019-12-18'),
    ('EX005', N'Kiểm tra .NET Framework',         60,  8,  '2020-01-10'),
    ('EX006', N'Kiểm tra Java cơ bản',            90,  12, '2020-01-25'),
    ('EX007', N'Kiểm tra HTML/CSS',               30,  7,  '2020-02-05'),
    ('EX008', N'Kiểm tra JavaScript',             60,  8,  '2020-02-20'),
    ('EX009', N'Kiểm tra React cơ bản',           75,  12, '2020-03-10'),
    ('EX010', N'Kiểm tra kiến thức tổng hợp',    120,  7,  '2020-03-30');

-- -----------------------------------------------
-- Exam_Question
-- -----------------------------------------------
INSERT INTO Exam_Question (ExamID, QuestionID) VALUES
    (1, 1), (1, 2), (1, 4),
    (2, 2), (2, 3), (2, 7), (2, 8),
    (3, 6),
    (4, 3), (4, 4), (4, 8),
    (5, 9), (5, 10),
    (6, 6), (6, 11),
    (7, 1), (7, 5),
    (8, 7), (8, 11), (8, 12),
    (9, 9), (9, 12),
    (10, 1),(10, 2),(10, 3),(10, 6),(10, 9);


-- =============================================
-- EXERCISE 2
-- =============================================

-- Q2: Lấy ra tất cả các phòng ban
SELECT *
FROM Department;

-- Q3: Lấy ra id của phòng ban "Sale"
SELECT DepartmentID
FROM Department
WHERE DepartmentName = N'Sale';

-- Q4: Lấy ra thông tin account có full name dài nhất
SELECT *
FROM Account
WHERE LENGTH(FullName) = (
    SELECT MAX(LENGTH(FullName))
    FROM Account
);

-- Q5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM Account
WHERE DepartmentID = 3
  AND LENGTH(FullName) = (
      SELECT MAX(LENGTH(FullName))
      FROM Account
      WHERE DepartmentID = 3
  );

-- Q6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT g.GroupName
FROM `Group` g
INNER JOIN Account_Group ag ON g.GroupID = ag.GroupID
WHERE ag.JoinDate < '2019-12-20';

-- Q7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID
FROM Answer
GROUP BY QuestionID
HAVING COUNT(AnswerID) >= 4;

-- Q8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và tạo trước ngày 20/12/2019
SELECT ExamCode
FROM Exam
WHERE Duration >= 60
  AND CreateDate < '2019-12-20';

-- Q9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Q10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(*) AS TotalEmployees
FROM Account
WHERE DepartmentID = 2;

-- Q11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM Account
WHERE FullName LIKE N'D%o';

-- Q12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Exam
WHERE CreateDate < '2019-12-20';
SET SQL_SAFE_UPDATES = 1;

-- Q13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Question
WHERE Content LIKE N'Câu hỏi%';
SET SQL_SAFE_UPDATES = 1;

-- Q14: Update account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE Account
SET FullName = N'Nguyễn Bá Lộc',
    Email    = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- Q15: Update account có id = 5 sẽ thuộc group có id = 4
UPDATE Account_Group
SET GroupID = 4
WHERE AccountID = 5;

-- Nếu account 5 chưa có trong Account_Group, dùng INSERT ... ON DUPLICATE KEY UPDATE:
-- INSERT INTO Account_Group (AccountID, GroupID, JoinDate)
-- VALUES (5, 4, CURRENT_DATE)
-- ON DUPLICATE KEY UPDATE GroupID = 4;
