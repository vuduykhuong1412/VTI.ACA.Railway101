-- Question 1: Liệt kê nhân viên và phòng ban của họ
SELECT a.FullName, d.DepartmentName
FROM Account a
JOIN Department d
ON a.DepartmentID = d.DepartmentID;

-- Question 2: Account tạo sau ngày 20/12/2010
SELECT *
FROM Account
WHERE CreateDate > '2010-12-20';

-- Question 3: Liệt kê Developer
SELECT a.*
FROM Account a
JOIN Position p
ON a.PositionID = p.PositionID
WHERE p.PositionName = 'Dev';

-- Question 4: Phòng ban có từ 3 nhân viên trở lên
SELECT d.DepartmentName,
       COUNT(*) AS SoLuong
FROM Department d
JOIN Account a
ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(*) >= 3;

-- Question 5: Question được dùng nhiều nhất trong Exam
SELECT QuestionID,
       COUNT(*) AS SoLanDung
FROM ExamQuestion
GROUP BY QuestionID
ORDER BY SoLanDung DESC
LIMIT 1;

-- Question 6: Mỗi Category có bao nhiêu Question
SELECT c.CategoryName,
       COUNT(q.QuestionID) AS SoLuong
FROM CategoryQuestion c
LEFT JOIN Question q
ON c.CategoryID = q.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

-- Question 7: Mỗi Question được dùng trong bao nhiêu Exam
SELECT q.QuestionID,
       q.Content,
       COUNT(eq.ExamID) AS SoLanDung
FROM Question q
LEFT JOIN ExamQuestion eq
ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID, q.Content;

-- Question 8: Question có nhiều Answer nhất
SELECT q.QuestionID,
       q.Content,
       COUNT(a.AnswerID) AS SoLuong
FROM Question q
JOIN Answer a
ON q.QuestionID = a.QuestionID
GROUP BY q.QuestionID, q.Content
ORDER BY SoLuong DESC
LIMIT 1;

-- Question 9: Đếm số Account trong mỗi Group
SELECT g.GroupName,
       COUNT(ga.AccountID) AS SoLuong
FROM `Group` g
LEFT JOIN GroupAccount ga
ON g.GroupID = ga.GroupID
GROUP BY g.GroupID, g.GroupName;

-- Question 10: Chức vụ có ít người nhất
SELECT p.PositionName,
       COUNT(a.AccountID) AS SoLuong
FROM Position p
LEFT JOIN Account a
ON p.PositionID = a.PositionID
GROUP BY p.PositionID, p.PositionName
ORDER BY SoLuong ASC
LIMIT 1;

-- Question 11: Đếm Dev, Test, PM, Scrum Master của từng phòng ban
SELECT d.DepartmentName,
       SUM(p.PositionName = 'Dev') AS Dev,
       SUM(p.PositionName = 'Test') AS Test,
       SUM(p.PositionName = 'PM') AS PM,
       SUM(p.PositionName = 'Scrum Master') AS ScrumMaster
FROM Department d
LEFT JOIN Account a
ON d.DepartmentID = a.DepartmentID
LEFT JOIN Position p
ON a.PositionID = p.PositionID
GROUP BY d.DepartmentID, d.DepartmentName;

-- Question 12: Thông tin chi tiết Question
SELECT q.QuestionID,
       q.Content,
       t.TypeName,
       c.CategoryName,
       a.Content AS Answer
FROM Question q
JOIN TypeQuestion t
ON q.TypeID = t.TypeID
JOIN CategoryQuestion c
ON q.CategoryID = c.CategoryID
LEFT JOIN Answer a
ON q.QuestionID = a.QuestionID;

-- Question 13: Số lượng Question theo loại
SELECT t.TypeName,
       COUNT(q.QuestionID) AS SoLuong
FROM TypeQuestion t
LEFT JOIN Question q
ON t.TypeID = q.TypeID
GROUP BY t.TypeID, t.TypeName;

-- Question 14: Group không có Account
SELECT g.*
FROM `Group` g
LEFT JOIN GroupAccount ga
ON g.GroupID = ga.GroupID
WHERE ga.AccountID IS NULL;

-- Question 15: Account không thuộc Group nào
SELECT a.*
FROM Account a
LEFT JOIN GroupAccount ga
ON a.AccountID = ga.AccountID
WHERE ga.GroupID IS NULL;

-- Question 16: Question không có Answer
SELECT q.*
FROM Question q
LEFT JOIN Answer a
ON q.QuestionID = a.QuestionID
WHERE a.AnswerID IS NULL;
