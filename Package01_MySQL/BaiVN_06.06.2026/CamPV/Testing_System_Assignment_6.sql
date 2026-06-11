-- câu 1
DROP PROCEDURE IF EXISTS sp_GetAccFromDep;

DELIMITER $$
CREATE PROCEDURE sp_GetAccFromDep(IN in_dep_name NVARCHAR(50))
BEGIN
    SELECT A.AccountID, A.FullName, D.DepartmentName 
    FROM `Account` A
    INNER JOIN `Department` D ON D.DepartmentID = A.DepartmentID
    WHERE D.DepartmentName = in_dep_name;
END$$
DELIMITER ;

CALL sp_GetAccFromDep('Sale');
-- câu 2
DROP PROCEDURE IF EXISTS sp_GetCountAccFromGroup;

DELIMITER $$
CREATE PROCEDURE sp_GetCountAccFromGroup(IN in_group_name NVARCHAR(50))
BEGIN
    SELECT g.GroupName, COUNT(ga.AccountID) AS SL 
    FROM `GroupAccount` ga
    INNER JOIN `Group` g ON ga.GroupID = g.GroupID
    WHERE g.GroupName = in_group_name
    GROUP BY g.GroupID, g.GroupName;
END$$
DELIMITER ;

CALL sp_GetCountAccFromGroup('Testing System');
-- câu 3
DROP PROCEDURE IF EXISTS sp_GetCountTypeInMonth;

DELIMITER $$
CREATE PROCEDURE sp_GetCountTypeInMonth()
BEGIN
    SELECT tq.TypeName, COUNT(q.TypeID) AS Total_Question
    FROM `Question` q
    INNER JOIN `TypeQuestion` tq ON q.TypeID = tq.TypeID
    WHERE MONTH(q.CreateDate) = MONTH(NOW()) AND YEAR(q.CreateDate) = YEAR(NOW())
    GROUP BY q.TypeID, tq.TypeName;
END$$
DELIMITER ;

CALL sp_GetCountTypeInMonth();
-- câu 4
DROP PROCEDURE IF EXISTS sp_GetCountQuesFromType;

DELIMITER $$
CREATE PROCEDURE sp_GetCountQuesFromType(OUT out_TypeID TINYINT)
BEGIN
    WITH CTE_CountType AS (
        SELECT TypeID, COUNT(QuestionID) AS SL 
        FROM `Question` 
        GROUP BY TypeID
    )
    SELECT TypeID INTO out_TypeID
    FROM CTE_CountType
    WHERE SL = (SELECT MAX(SL) FROM CTE_CountType)
    LIMIT 1; 
    
END$$
DELIMITER ;
