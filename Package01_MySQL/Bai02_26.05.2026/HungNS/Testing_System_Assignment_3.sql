USE Testing_System_Assignment_2;

-- Question 2
SELECT * FROM Department;

-- Question 3
SELECT DepartmentID 
FROM Department 
WHERE DepartmentName = 'Sale';

-- Question 4
SELECT * FROM `Account` 
WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account`);

-- Question 5
SELECT * FROM `Account` 
WHERE DepartmentID = 3 
  AND LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account` WHERE DepartmentID = 3);

-- Question 6
SELECT GroupName 
FROM `Group` 
WHERE CreateDate < '2019-12-20';

-- Question 7
SELECT QuestionID 
FROM Answer 
GROUP BY QuestionID 
HAVING COUNT(AnswerID) >= 4;

-- Question 8
SELECT `Code` 
FROM Exam 
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Question 10
SELECT COUNT(AccountID) AS SoNhanVien 
FROM `Account` 
WHERE DepartmentID = 2;

-- Question 11
SELECT FullName 
FROM `Account` 
WHERE FullName LIKE 'D%o';