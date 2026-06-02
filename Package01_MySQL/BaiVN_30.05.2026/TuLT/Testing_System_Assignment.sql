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