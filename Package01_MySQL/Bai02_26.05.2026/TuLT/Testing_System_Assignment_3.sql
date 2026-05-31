-- Question 2
SELECT *
FROM Department;

-- Question 3
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'Sale';

-- Question 4
SELECT *
FROM `Account`
WHERE LENGTH(FullName) = (
    SELECT MAX(LENGTH(FullName))
    FROM `Account`
);

-- Question 5
SELECT *
FROM `Account`
WHERE DepartmentID = 3
  AND LENGTH(FullName) = (
      SELECT MAX(LENGTH(FullName))
      FROM `Account`
      WHERE DepartmentID = 3
  );

-- Question 6
SELECT DISTINCT g.GroupName
FROM `Group` g
JOIN GroupAccount ga ON g.GroupID = ga.GroupID
WHERE ga.JoinDate < '2019-12-20';

-- Question 7
SELECT QuestionID
FROM Answer
GROUP BY QuestionID
HAVING COUNT(*) >= 4;

-- Question 8
SELECT `Code`
FROM Exam
WHERE Duration >= 60
  AND CreateDate < '2019-12-20';

-- Question 9
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10
SELECT COUNT(*) AS TotalAccount
FROM `Account`
WHERE DepartmentID = 2;

-- Question 11
SELECT *
FROM `Account`
WHERE FullName LIKE 'D%o';

-- Question 12
DELETE
FROM Exam
WHERE CreateDate < '2019-12-20';

-- Question 13
DELETE
FROM Question
WHERE Content LIKE 'Câu hỏi%';

-- Question 14
UPDATE `Account`
SET 
    FullName = 'Nguyen Van A',
    Email = 'nguyenvana@gmail.com'
WHERE AccountID = 5;

-- Question 15
UPDATE `Account`
SET DepartmentID = 4
WHERE AccountID = 5;