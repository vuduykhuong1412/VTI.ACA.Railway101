-- câu 2:
SELECT * FROM department;
-- câu 3
SELECT DepartmentID FROM department
WHERE DepartmentName = 'Sale';
-- câu 4
SELECT * FROM Account
WHERE LENGTH(FullName) = (
    SELECT MAX(LENGTH(FullName))
    FROM Account
);
-- câu 5
SELECT * FROM Account
WHERE DepartmentID = 3
AND LENGTH(FullName) = (
    SELECT MAX(LENGTH(FullName))
    FROM Account
    WHERE DepartmentID = 3
);
-- câu 6
SELECT GroupName
FROM `group`
WHERE CreateDate < 2019-12-20;
-- câu 7
SELECT QuestionID
FROM Answer
GROUP BY QuestionID
HAVING COUNT(AnswerID) >= 4;
-- câu 8
SELECT `Code`
FROM Exam
WHERE Duration >= 60
AND CreateDate < '2019-12-20';
-- câu 9
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;
-- câu 10
SELECT COUNT(AccountID) AS SoLuongNhanVien
FROM Account
WHERE DepartmentID = 2;
-- câu 11
SELECT *
FROM Account
WHERE FullName LIKE 'D%o';