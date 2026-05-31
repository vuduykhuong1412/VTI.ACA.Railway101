-- Bai 1: Account kem Department
SELECT 
    a.AccountID,
    a.FullName,
    d.DepartmentName
FROM `Account` a
JOIN Department d ON a.DepartmentID = d.DepartmentID;

-- Bai 2: Account kem Position
SELECT 
    a.AccountID,
    a.FullName,
    p.PositionName
FROM `Account` a
JOIN `Position` p ON a.PositionID = p.PositionID;

-- Bai 3: Account kem Department va Position
SELECT 
    a.AccountID,
    a.FullName,
    d.DepartmentName,
    p.PositionName
FROM `Account` a
JOIN Department d ON a.DepartmentID = d.DepartmentID
JOIN `Position` p ON a.PositionID = p.PositionID;

-- Bai 4: Group va nguoi tao group
SELECT 
    g.GroupID,
    g.GroupName,
    a.FullName AS CreatorName
FROM `Group` g
JOIN `Account` a ON g.CreatorID = a.AccountID;

-- Bai 5: Group va thanh vien trong group
SELECT 
    g.GroupName,
    a.FullName,
    ga.JoinDate
FROM `Group` g
JOIN GroupAccount ga ON g.GroupID = ga.GroupID
JOIN `Account` a ON ga.AccountID = a.AccountID;

-- Bai 6: Group tham gia truoc ngay 20/12/2019
SELECT DISTINCT 
    g.GroupName
FROM `Group` g
JOIN GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.JoinDate < '2019-12-20';

-- Bai 7: Question kem Category
SELECT 
    q.QuestionID,
    q.Content,
    cq.CategoryName
FROM Question q
JOIN CategoryQuestion cq ON q.CategoryID = cq.CategoryID;

-- Bai 8: Question kem TypeQuestion
SELECT 
    q.QuestionID,
    q.Content,
    tq.TypeName
FROM Question q
JOIN TypeQuestion tq ON q.TypeID = tq.TypeID;

-- Bai 9: Question kem Category, Type va nguoi tao
SELECT 
    q.Content,
    cq.CategoryName,
    tq.TypeName,
    a.FullName AS CreatorName
FROM Question q
JOIN CategoryQuestion cq ON q.CategoryID = cq.CategoryID
JOIN TypeQuestion tq ON q.TypeID = tq.TypeID
JOIN `Account` a ON q.CreatorID = a.AccountID;

-- Bai 10: Question va Answer
SELECT 
    q.Content AS QuestionContent,
    an.Content AS AnswerContent,
    an.isCorrect
FROM Question q
JOIN Answer an ON q.QuestionID = an.QuestionID;

-- Bai 11: Exam kem Category
SELECT 
    e.ExamID,
    e.`Code`,
    e.Title,
    cq.CategoryName
FROM Exam e
JOIN CategoryQuestion cq ON e.CategoryID = cq.CategoryID;

-- Bai 12: Exam kem nguoi tao
SELECT 
    e.`Code`,
    e.Title,
    a.FullName AS CreatorName
FROM Exam e
JOIN `Account` a ON e.CreatorID = a.AccountID;

-- Bai 13: Exam gom nhung Question nao
SELECT 
    e.`Code`,
    e.Title,
    q.Content AS QuestionContent
FROM Exam e
JOIN ExamQuestion eq ON e.ExamID = eq.ExamID
JOIN Question q ON eq.QuestionID = q.QuestionID;

-- Bai 14: Tat ca Department, co account hoac khong
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    a.FullName
FROM Department d
LEFT JOIN `Account` a ON d.DepartmentID = a.DepartmentID;

-- Bai 15: Department chua co account
SELECT 
    d.DepartmentID,
    d.DepartmentName
FROM Department d
LEFT JOIN `Account` a ON d.DepartmentID = a.DepartmentID
WHERE a.AccountID IS NULL;

-- Bai 16: Tat ca Group, co thanh vien hoac khong
SELECT 
    g.GroupID,
    g.GroupName,
    a.FullName
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
LEFT JOIN `Account` a ON ga.AccountID = a.AccountID;

-- Bai 17: Group chua co thanh vien
SELECT 
    g.GroupID,
    g.GroupName
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.GroupID IS NULL;

-- Bai 18: UNION DepartmentName va GroupName
SELECT DepartmentName AS Name
FROM Department

UNION

SELECT GroupName AS Name
FROM `Group`;

-- Bai 19: UNION ALL DepartmentName va GroupName
SELECT DepartmentName AS Name
FROM Department

UNION ALL

SELECT GroupName AS Name
FROM `Group`;

-- Bai 20: CROSS JOIN Department va Position
SELECT 
    d.DepartmentName,
    p.PositionName
FROM Department d
CROSS JOIN `Position` p;