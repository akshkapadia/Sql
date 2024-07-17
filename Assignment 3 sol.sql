--Assignment 1

CREATE TABLE Emp_Detail (
    Emp_Id INT PRIMARY KEY,
    FullName VARCHAR(255),
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(255)
);

INSERT INTO Emp_Detail (Emp_Id, FullName, ManagerId, DateOfJoining, City)
VALUES
    (121, 'John Snow', 321, '2014-01-31', 'Toronto'),
    (321, 'Walter White', 986, '2015-01-30', 'California'),
    (421, 'Kuldeep Rana', 876, '2016-11-27', 'New Delhi');


CREATE TABLE Emp_Salary (
    Emp_Id INT,
    Project VARCHAR(255),
    Salary DECIMAL(10, 2),
    Variable DECIMAL(10, 2)
);

INSERT INTO Emp_Salary (Emp_Id, Project, Salary, Variable)
VALUES
    (421, 'P1', 8000, 500),
    (121, 'P2', 10000, 1000),
    (321, 'P1', 12000, 0)


SELECT Emp_Detail.*
FROM Emp_Detail
LEFT JOIN Emp_Salary ON Emp_Detail.Emp_Id = Emp_Salary.Emp_Id
WHERE Emp_Salary.Emp_Id IS NULL;


SELECT d.Emp_Id, d.FullName
FROM Emp_Detail AS d
LEFT JOIN Emp_Salary AS s ON d.Emp_Id = s.Emp_Id
WHERE s.Emp_Id IS NULL;


SELECT * FROM Emp_Detail
WHERE DATEPART(YEAR, DateOfJoining) = 2020;


SELECT d.Emp_Id, d.FullName, d.ManagerId, d.DateOfJoining, d.City
FROM Emp_Detail AS d
INNER JOIN Emp_Salary AS s ON d.Emp_Id = s.Emp_Id;


SELECT Project, COUNT(*) AS EmployeeCount
FROM Emp_Salary
GROUP BY Project;


SELECT
    D.Emp_Id,
    D.FullName,
    D.City,
    S.Project,
    ISNULL(S.Salary, 0) AS Salary
FROM Emp_Detail D
LEFT JOIN Emp_Salary S ON D.Emp_Id = S.Emp_Id;


SELECT * 
FROM Emp_Detail
WHERE Emp_Id IN (SELECT ManagerId FROM Emp_Detail);


SELECT Emp_Id, COUNT(Emp_Id) AS DuplicateCount
FROM Emp_Detail
GROUP BY Emp_Id
HAVING COUNT(Emp_Id) > 1;


WITH NumberedRows AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY Emp_Id) AS RowNum
    FROM Emp_Detail
)
SELECT * 
FROM NumberedRows
WHERE RowNum % 2 <> 0;


SELECT DISTINCT Salary
FROM Emp_Salary
WHERE Salary IS NOT NULL
ORDER BY Salary DESC
OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY;





--Assignment 2

SELECT Emp_Id, FullName
FROM Emp_Detail
WHERE ManagerId = 986;


SELECT DISTINCT Project
FROM Emp_Salary;


SELECT COUNT(*) AS EmployeeCount
FROM Emp_Salary
WHERE Project = 'P1';


SELECT
    MAX(Salary) AS Max_Salary,
    MIN(Salary) AS Min_Salary,
    AVG(Salary) AS Avg_Salary
FROM Emp_Salary;


SELECT Emp_Id
FROM Emp_Salary
WHERE Salary BETWEEN 9000 AND 15000;


SELECT Emp_Detail.Emp_Id, Emp_Detail.FullName
FROM Emp_Detail
WHERE Emp_Detail.City = 'Toronto' AND Emp_Detail.ManagerId = 321;


SELECT E.Emp_Id, E.FullName, E.City, E.ManagerId
FROM Emp_Detail E
WHERE E.City = 'California' OR E.ManagerId = 321;


SELECT ED.Emp_Id, ED.FullName
FROM Emp_Detail ED
JOIN Emp_Salary ES ON ED.Emp_Id = ES.Emp_Id
WHERE ES.Project <> 'P1';


SELECT
    ed.Emp_Id,
    ed.FullName,
    (es.Salary + es.Variable) AS TotalSalary
FROM Emp_Detail ed
JOIN Emp_Salary es ON ed.Emp_Id = es.Emp_Id;


SELECT * FROM Emp_Detail
WHERE FullName LIKE '__hn%';









--Assignment 3

SELECT Emp_Id FROM Emp_Detail
UNION
SELECT Emp_Id FROM Emp_Salary;


SELECT *
FROM Emp_Detail
INNER JOIN Emp_Salary ON Emp_Detail.Emp_Id = Emp_Salary.Emp_Id;


SELECT *
FROM Emp_Detail
WHERE Emp_Id NOT IN (SELECT Emp_Id FROM Emp_Salary);


SELECT DISTINCT E1.Emp_Id
FROM Emp_Detail E1
INNER JOIN Emp_Salary E2 ON E1.Emp_Id = E2.Emp_Id;


SELECT ED.Emp_Id
FROM Emp_Detail AS ED
LEFT JOIN Emp_Salary AS ES ON ED.Emp_Id = ES.Emp_Id
WHERE ES.Emp_Id IS NULL;


SELECT Emp_Id, FullName, REPLACE(FullName, ' ', '_') AS Modified_Name
FROM Emp_Detail;


SELECT CHARINDEX('S', FullName) AS Position
FROM Emp_Detail
WHERE Emp_Id = 121;


SELECT Emp_Id, ManagerId
FROM Emp_Detail;


SELECT SUBSTRING_INDEX(FullName, ' ', 1) AS FirstName
FROM Emp_Detail;


SELECT
  Emp_Id,
  UPPER(FullName) AS FullName,
  ManagerId,
  DateOfJoining,
  LOWER(City) AS City
FROM
  Emp_Detail;



  --Assignment 4

  SELECT
    SUM(LENGTH(FullName) - LENGTH(REPLACE(FullName, 'n', ''))) AS CountOfN
FROM
    Emp_Detail;


	UPDATE Emp_Detail
SET FullName = TRIM(BOTH ' ' FROM FullName);


SELECT
    ED.Emp_Id,
    ED.FullName,
    ED.ManagerId,
    ED.DateOfJoining,
    ED.City
FROM
    Emp_Detail ED
LEFT JOIN
    Emp_Salary ES ON ED.Emp_Id = ES.Emp_Id
WHERE
    ES.Project IS NULL;


	SELECT
    ED.FullName AS EmployeeName
FROM
    Emp_Detail ED
JOIN
    Emp_Salary ES ON ED.Emp_Id = ES.Emp_Id
WHERE
    ES.Salary >= 5000 AND ES.Salary <= 10000;


	SELECT CURRENT_TIMESTAMP AS CurrentDateTime;
	SELECT GETDATE() AS CurrentDateTime;


	SELECT *
FROM Emp_Detail
WHERE YEAR(DateOfJoining) = 2015;


SELECT Emp_Detail.*
FROM Emp_Detail
JOIN Emp_Salary ON Emp_Detail.Emp_Id = Emp_Salary.Emp_Id;


SELECT Project, COUNT(*) AS EmployeeCount
FROM Emp_Salary
GROUP BY Project
ORDER BY EmployeeCount DESC;


SELECT
    ED.Emp_Id,
    ED.FullName,
    ED.ManagerId,
    ED.DateOfJoining,
    ED.City,
    ES.Project,
    ES.Salary,
    ES.Variable
FROM
    Emp_Detail ED
LEFT JOIN
    Emp_Salary ES ON ED.Emp_Id = ES.Emp_Id;

--Advanced Assignment

CREATE TABLE EmployeeInfo (
  EmpID INT PRIMARY KEY,
  EmpFname VARCHAR(50) NOT NULL,
  EmpLname VARCHAR(50) NOT NULL,
  Department VARCHAR(50),
  Project VARCHAR(50),
  Address VARCHAR(255),
  DOB DATE,
  Gender VARCHAR(1)
);


INSERT
 
INTO EmployeeInfo (EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
VALUES
(1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)',
 
'01/12/1976', 'M'),
(2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '02/05/1968', 'F'),
(3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '01/01/1980', 'M'),
(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '02/05/1992', 'F'),
(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '03/07/1994', 'M');


CREATE TABLE EmployeePosition (
  EmpID INT,
  EmpPosition VARCHAR(50) NOT NULL,
  DateOfJoining DATE,
  Salary DECIMAL(10,2)
);

drop table EmployeePosition;

INSERT INTO EmployeePosition (EmpID, EmpPosition, DateOfJoining, Salary)
VALUES
(1, 'manager', '2022-02-01', 500000),
(2, 'Executive', '2022-05-02', 75000),
(3, 'Manager', '2022-05-01', 90000),
(2, 'Lead', '2022-05-02', 85000),
(1, 'Executive', '2022-05-01', 300000);


select * from EmployeeInfo;
select * from EmployeePosition;


SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;

SELECT COUNT(*)
FROM EmployeeInfo
WHERE Department = 'HR';


SELECT GETDATE();


SELECT SUBSTRING(EmpLname, 1, 4) AS FirstFourChar 
FROM EmployeeInfo;


SELECT SUBSTRING(Address, 1, CHARINDEX('(', Address) - 1) AS PlaceName
FROM EmployeeInfo;


SELECT EI.EmpID, EI.EmpFname, EI.EmpLname, EP.Salary
FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
WHERE EP.Salary BETWEEN 50000 AND 100000;


SELECT EmpFname, EmpLname
FROM EmployeeInfo
WHERE EmpFname LIKE 'S%';


SELECT CONCAT(EmpFname, ' ', EmpLname) AS FullName
FROM EmployeeInfo;


SELECT Gender, COUNT(*) AS NumberOfEmployees
FROM EmployeeInfo
WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31'
GROUP BY Gender;


SELECT *
FROM EmployeeInfo
ORDER BY EmpLname DESC, Department ASC;


SELECT EmpInfo.EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender, EmpPosition, DateOfJoining, Salary
FROM EmployeeInfo
INNER JOIN EmployeePosition ON EmployeeInfo.EmpID = EmployeePosition.EmpID
WHERE EmpLname REGEXP '^[A-Za-z]{3}A$';


SELECT *
FROM EmployeeInfo
WHERE EmpFname NOT IN ('Sanjay', 'Sonia');


SELECT EmployeeInfo.*, EmployeePosition.*
FROM EmployeeInfo
JOIN EmployeePosition ON EmployeeInfo.EmpID = EmployeePosition.EmpID
WHERE EmployeeInfo.Address = 'DELHI(DEL)';


SELECT e.EmpID, e.EmpFname, e.EmpLname, e.Department, e.Project, e.Address, e.DOB, e.Gender, p.EmpPosition
FROM EmployeeInfo AS e
INNER JOIN EmployeePosition AS p ON e.EmpID = p.EmpID
WHERE p.EmpPosition IN ('manager', 'Lead');


SELECT Department, COUNT(*) AS EmployeeCount
FROM EmployeeInfo
GROUP BY Department
ORDER BY EmployeeCount ASC;


SELECT
    t.*,
    CASE WHEN RowNum % 2 = 0 THEN 'Even' ELSE 'Odd' END AS Parity
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EmpID) AS RowNum
    FROM EmployeeInfo
) AS t
UNION ALL
SELECT
    t.*,
    CASE WHEN RowNum % 2 = 0 THEN 'Even' ELSE 'Odd' END AS Parity
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EmpID) AS RowNum
    FROM EmployeePosition
) AS t;


SELECT e.*
FROM EmployeeInfo e
INNER JOIN EmployeePosition p ON e.EmpID = p.EmpID;


SELECT *
FROM EmployeeInfo
GROUP BY EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender
HAVING COUNT(*) > 1;


SELECT Department, EmpFname, EmpLname
FROM EmployeeInfo e
INNER JOIN EmployeePosition p ON e.EmpID = p.EmpID
GROUP BY Department, EmpFname, EmpLname
ORDER BY Department, EmpFname;



SELECT *
FROM EmployeeInfo
ORDER BY EmpID DESC
LIMIT 3;


SELECT MAX(Salary)
FROM EmployeePosition
WHERE Salary NOT IN (
  SELECT MAX(Salary)
  FROM EmployeePosition
  WHERE Salary NOT IN (
    SELECT MAX(Salary)
    FROM EmployeePosition
  )
);


SELECT *
FROM EmployeeInfo
LIMIT 1, 1;


ALTER TABLE EmployeeInfo
ADD CONSTRAINT chk_email CHECK (EmpEmail LIKE '%@%');


SELECT Department
FROM EmployeeInfo
GROUP BY Department
HAVING COUNT(*) < 2;


SELECT EmpPosition, SUM(Salary) AS TotalSalary
FROM EmployeePosition
GROUP BY EmpPosition;


SELECT TOP 50 PERCENT *
FROM EmployeeInfo;





