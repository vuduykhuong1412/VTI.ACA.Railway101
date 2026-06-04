Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban Sale
CREAT OR REPLACE VIEW v_account_sale AS
-- Tạo View tên v_account_sale, Nếu VIEW này đã tồn tại thì thay thế cái mới
SELECT
	a.accountID,
	a.email,
	a.full_name,
	d.departmentID,
	d.departmentname
FROM `account` a
JOIN department d ON a.departmentID = d.departmentID
WHERE d.departmentname = 'Sale';

Question 2: Tạo view chứa account tham gia nhiều group nhất
-- Đếm mỗi account tham gia bao nhiêu group
-- Tìm số group lớn nhất
-- Lấy account có số group bằng số lớn nhất đó

CREAT OR REPLACE VIEW v_account_group AS
-- Tạo View tên là v_account_group
-- Dùng CTE (bảng tạm) chỉ dùng trong query này, tên bảng account_group_account
WITH account_group_count AS (
SELECT
	accountID,
	COUNT(groupID) AS Total_group
	FROM groupaccount
	GROUP BY accountID
)
SELECT 
	a.AccountID,
	a.Email,
	a.Username,
	a.FullName,
	agc.Total_Group
FROM account_group_count agc
JOIN `Account` a ON agc.AccountID = a.AccountID
WHERE agc.Total_Group = (
	SELECT MAX(Total_Group)
	FROM account_group_count
);

-- Question 3:
-- Tao view cac cau hoi co content qua dai > 300 ky tu
-- ==============================
CREATE OR REPLACE VIEW v_question_content_long AS
SELECT 
    QuestionID,
    Content,
    CategoryID,
    TypeID,
    CreatorID,
    CreateDate,
    CHAR_LENGTH(Content) AS Content_Length
FROM Question
WHERE CHAR_LENGTH(Content) > 300;

-- Question 5:
-- Tao view cac cau hoi do user ho Nguyen tao
-- ==============================
CREATE OR REPLACE VIEW v_question_created_by_nguyen AS
SELECT 
    q.QuestionID,
    q.Content,
    q.CategoryID,
    q.TypeID,
    q.CreatorID,
    q.CreateDate,
    a.FullName AS CreatorName
FROM Question q
JOIN `Account` a ON q.CreatorID = a.AccountID
WHERE a.FullName LIKE 'Nguyen%'
   OR a.FullName LIKE 'Nguyễn%';