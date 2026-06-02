-- =====================================================================================
-- EXERCISE 1: JOIN
-- =====================================================================================

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT a.AccountID, a.Email, a.Username, a.FullName, d.DepartmentName
FROM Account a
LEFT JOIN Department d ON a.DepartmentID = d.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT a.AccountID, a.Email, a.Username, a.FullName, a.CreateDate, d.DepartmentName, p.PositionName
FROM Account a
LEFT JOIN Department d ON a.DepartmentID = d.DepartmentID
LEFT JOIN Position p ON a.PositionID = p.PositionID
WHERE a.CreateDate > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT a.AccountID, a.Email, a.Username, a.FullName, p.PositionName
FROM Account a
JOIN Position p ON a.PositionID = p.PositionID
WHERE p.PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT d.DepartmentID, d.DepartmentName, COUNT(a.AccountID) AS TotalEmployees
FROM Department d
JOIN Account a ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(a.AccountID) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT q.QuestionID, q.Content, COUNT(eq.ExamID) AS TotalUsed
FROM Question q
JOIN ExamQuestion eq ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID, q.Content
HAVING COUNT(eq.ExamID) = (
    SELECT MAX(ExamCount) 
    FROM (SELECT COUNT(ExamID) AS ExamCount FROM ExamQuestion GROUP BY QuestionID) AS Temp
);

-- Question 6: Thống kê mỗi categoryQuestion được sử dụng trong bao nhiêu Question
SELECT cq.CategoryID, cq.CategoryName, COUNT(q.QuestionID) AS TotalQuestions
FROM CategoryQuestion cq
LEFT JOIN Question q ON cq.CategoryID = q.CategoryID
GROUP BY cq.CategoryID, cq.CategoryName;

-- Question 7: Thống kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.QuestionID, q.Content, COUNT(eq.ExamID) AS TotalExams
FROM Question q
LEFT JOIN ExamQuestion eq ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID, q.Content;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT q.QuestionID, q.Content, COUNT(a.AnswerID) AS TotalAnswers
FROM Question q
JOIN Answer a ON q.QuestionID = a.QuestionID
GROUP BY q.QuestionID, q.Content
HAVING COUNT(a.AnswerID) = (
    SELECT MAX(AnswerCount) 
    FROM (SELECT COUNT(AnswerID) AS AnswerCount FROM Answer GROUP BY QuestionID) AS Temp
);

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT g.GroupID, g.GroupName, COUNT(ga.AccountID) AS TotalAccounts
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY g.GroupID, g.GroupName;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT p.PositionID, p.PositionName, COUNT(a.AccountID) AS TotalAccounts
FROM Position p
LEFT JOIN Account a ON p.PositionID = a.PositionID
GROUP BY p.PositionID, p.PositionName
HAVING COUNT(a.AccountID) = (
    SELECT MIN(AccountCount) 
    FROM (SELECT COUNT(AccountID) AS AccountCount FROM Account GROUP BY PositionID) AS Temp
);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.DepartmentName, p.PositionName, COUNT(a.AccountID) AS Total
FROM Department d
CROSS JOIN Position p
LEFT JOIN Account a ON d.DepartmentID = a.DepartmentID AND p.PositionID = a.PositionID
GROUP BY d.DepartmentName, p.PositionName
ORDER BY d.DepartmentName;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT q.QuestionID, q.Content AS QuestionContent, tq.TypeName, creator.FullName AS CreatorName, q.CreateDate, ans.Content AS AnswerContent, ans.isCorrect
FROM Question q
JOIN TypeQuestion tq ON q.TypeID = tq.TypeID
JOIN Account creator ON q.CreatorID = creator.AccountID
LEFT JOIN Answer ans ON q.QuestionID = ans.QuestionID;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT tq.TypeID, tq.TypeName, COUNT(q.QuestionID) AS TotalQuestions
FROM TypeQuestion tq
LEFT JOIN Question q ON tq.TypeID = q.TypeID
GROUP BY tq.TypeID, tq.TypeName;

-- Question 14: Lấy ra group không có account nào
SELECT g.GroupID, g.GroupName
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.AccountID IS NULL;

-- Question 15: Lấy ra group không có account nào (Trùng câu hỏi 14 trong đề)
SELECT g.GroupID, g.GroupName
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.AccountID IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT q.QuestionID, q.Content
FROM Question q
LEFT JOIN Answer a ON q.QuestionID = a.QuestionID
WHERE a.AnswerID IS NULL;


-- =====================================================================================
-- EXERCISE 2: UNION
-- =====================================================================================

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT ga.AccountID, a.FullName, ga.GroupID FROM GroupAccount ga JOIN Account a ON ga.AccountID = a.AccountID WHERE ga.GroupID = 1

UNION

-- b) Lấy các account thuộc nhóm thứ 2
SELECT ga.AccountID, a.FullName, ga.GroupID FROM GroupAccount ga JOIN Account a ON ga.AccountID = a.AccountID WHERE ga.GroupID = 2;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau (Sử dụng UNION như trên)


-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT g.GroupID, g.GroupName, COUNT(ga.AccountID) AS TotalMembers FROM `Group` g JOIN GroupAccount ga ON g.GroupID = ga.GroupID GROUP BY g.GroupID, g.GroupName HAVING COUNT(ga.AccountID) > 5

UNION

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT g.GroupID, g.GroupName, COUNT(ga.AccountID) AS TotalMembers FROM `Group` g JOIN GroupAccount ga ON g.GroupID = ga.GroupID GROUP BY g.GroupID, g.GroupName HAVING COUNT(ga.AccountID) < 7;
-- c) Ghép 2 kết quả từ câu a) và câu b) (Sử dụng UNION như trên)