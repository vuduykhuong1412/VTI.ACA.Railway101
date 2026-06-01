USE TestingSystem;

-- Exercise 1 - Question 1
SELECT 
    a.AccountID,
    a.Email,
    a.Username,
    a.FullName,
    d.DepartmentID,
    d.DepartmentName
FROM `Account` a
JOIN Department d ON a.DepartmentID = d.DepartmentID;

-- Question 2
SELECT *
FROM `Account`
WHERE CreateDate > '2010-12-20';

-- Question 3
SELECT 
    a.AccountID,
    a.Email,
    a.Username,
    a.FullName,
    p.PositionName
FROM `Account` a
JOIN `Position` p ON a.PositionID = p.PositionID
WHERE p.PositionName = 'Dev';

-- Question 4
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    COUNT(a.AccountID) AS Total_Account
FROM Department d
JOIN `Account` a ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(a.AccountID) > 3;

-- Question 5
SELECT 
    q.QuestionID,
    q.Content,
    COUNT(eq.ExamID) AS Total_Exam
FROM Question q
JOIN ExamQuestion eq ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID, q.Content
HAVING COUNT(eq.ExamID) = (
    SELECT MAX(Question_Count)
    FROM (
        SELECT COUNT(ExamID) AS Question_Count
        FROM ExamQuestion
        GROUP BY QuestionID
    ) AS temp
);

-- Question 6
SELECT 
    cq.CategoryID,
    cq.CategoryName,
    COUNT(q.QuestionID) AS Total_Question
FROM CategoryQuestion cq
LEFT JOIN Question q ON cq.CategoryID = q.CategoryID
GROUP BY cq.CategoryID, cq.CategoryName;

-- Question 7
SELECT 
    q.QuestionID,
    q.Content,
    COUNT(eq.ExamID) AS Total_Exam
FROM Question q
LEFT JOIN ExamQuestion eq ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID, q.Content;

-- Question 8
SELECT 
    q.QuestionID,
    q.Content
FROM Question q
LEFT JOIN Answer a ON q.QuestionID = a.QuestionID
WHERE a.AnswerID IS NULL;

-- Question 9
SELECT 
    g.GroupID,
    g.GroupName,
    COUNT(ga.AccountID) AS Total_Account
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY g.GroupID, g.GroupName;

-- Question 10
SELECT 
    p.PositionID,
    p.PositionName,
    COUNT(a.AccountID) AS Total_Account
FROM `Position` p
LEFT JOIN `Account` a ON p.PositionID = a.PositionID
GROUP BY p.PositionID, p.PositionName
HAVING COUNT(a.AccountID) = (
    SELECT MIN(Position_Count)
    FROM (
        SELECT COUNT(a2.AccountID) AS Position_Count
        FROM `Position` p2
        LEFT JOIN `Account` a2 ON p2.PositionID = a2.PositionID
        GROUP BY p2.PositionID
    ) AS temp
);

-- Question 11
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    SUM(CASE WHEN p.PositionName = 'Dev' THEN 1 ELSE 0 END) AS Total_Dev,
    SUM(CASE WHEN p.PositionName = 'Test' THEN 1 ELSE 0 END) AS Total_Test,
    SUM(CASE WHEN p.PositionName = 'Scrum Master' THEN 1 ELSE 0 END) AS Total_Scrum_Master,
    SUM(CASE WHEN p.PositionName = 'PM' THEN 1 ELSE 0 END) AS Total_PM
FROM Department d
LEFT JOIN `Account` a ON d.DepartmentID = a.DepartmentID
LEFT JOIN `Position` p ON a.PositionID = p.PositionID
GROUP BY d.DepartmentID, d.DepartmentName;

-- Question 12
SELECT DISTINCT
    a.AccountID,
    a.Email,
    a.Username,
    a.FullName
FROM `Account` a
LEFT JOIN `Group` g ON a.AccountID = g.CreatorID
LEFT JOIN Question q ON a.AccountID = q.CreatorID
LEFT JOIN Exam e ON a.AccountID = e.CreatorID
WHERE g.CreatorID IS NOT NULL
   OR q.CreatorID IS NOT NULL
   OR e.CreatorID IS NOT NULL;

-- Question 13
SELECT 
    tq.TypeID,
    tq.TypeName,
    COUNT(q.QuestionID) AS Total_Question
FROM TypeQuestion tq
LEFT JOIN Question q ON tq.TypeID = q.TypeID
GROUP BY tq.TypeID, tq.TypeName;

-- Question 14
SELECT 
    g.GroupID,
    g.GroupName
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.AccountID IS NULL;

-- Question 15
SELECT 
    q.QuestionID,
    q.Content
FROM Question q
LEFT JOIN Answer a ON q.QuestionID = a.QuestionID
WHERE a.AnswerID IS NULL;

-- Question 16
SELECT 
    q.QuestionID,
    q.Content
FROM Question q
LEFT JOIN Answer a ON q.QuestionID = a.QuestionID
WHERE a.AnswerID IS NULL;

-- Exercise 2 - Question 17c
SELECT 
    a.AccountID,
    a.Email,
    a.Username,
    a.FullName
FROM `Account` a
JOIN GroupAccount ga ON a.AccountID = ga.AccountID
WHERE ga.GroupID = 1

UNION

SELECT 
    a.AccountID,
    a.Email,
    a.Username,
    a.FullName
FROM `Account` a
JOIN GroupAccount ga ON a.AccountID = ga.AccountID
WHERE ga.GroupID = 2;

-- Exercise 2 - Question 18c
SELECT 
    g.GroupID,
    g.GroupName,
    COUNT(ga.AccountID) AS Total_Member
FROM `Group` g
JOIN GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY g.GroupID, g.GroupName
HAVING COUNT(ga.AccountID) > 5

UNION

SELECT 
    g.GroupID,
    g.GroupName,
    COUNT(ga.AccountID) AS Total_Member
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY g.GroupID, g.GroupName
HAVING COUNT(ga.AccountID) < 7;