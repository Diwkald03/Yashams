use CS_#2

--4.1
SELECT
    Department_ID as [Department ID]
    ,MAX(Salary) AS [Maximum Salary]
    ,MIN(Salary) AS [Minimum Salary]
    ,AVG(Salary) AS [Average Salary]
FROM
    EMPLOYEE
GROUP BY
    Department_ID;

--4.2
SELECT
    Job_ID as [Job ID]
    ,MAX(Salary) AS [Maximum Salary]
    ,MIN(Salary) AS [Minimum Salary]
    ,AVG(Salary) AS [Average Salary]
FROM
    EMPLOYEE
GROUP BY
    Job_ID

--4.3
SELECT
    FORMAT([Hire Date], 'MMM') AS Hire_Month, 
    COUNT(Employee_ID) AS Total_Hired
FROM
    EMPLOYEE
GROUP BY
    FORMAT([Hire Date], 'MMM'),
    MONTH([Hire Date]) 
ORDER BY
    MONTH([Hire Date]) ASC;


--4.4
SELECT
    E.Employee_ID AS [Employee ID],
    E.First_Name AS [First Name],
    E.Last_Name AS [Last Name],
    E.[Hire Date],
    YEAR(E.[Hire Date]) AS [Hire Year],
    MONTH(E.[Hire Date]) AS [Hire Month Number],
    T.[Total Hired In Month]
FROM
    EMPLOYEE E,
    (
        SELECT
            YEAR([Hire Date]) AS [Hire of Year],
            MONTH([Hire Date]) AS [Hire of Month],
            COUNT(Employee_ID) AS [Total Hired In Month]
        FROM
            EMPLOYEE
        GROUP BY
            YEAR([Hire Date]),
            MONTH([Hire Date])
        HAVING
            COUNT(Employee_ID) >= 1 
    ) AS T 
WHERE
    YEAR(E.[Hire Date]) = T.[Hire of Year]
    AND MONTH(E.[Hire Date]) = T.[Hire of Month]
ORDER BY
    [Hire Year] ASC,
    [Hire Month Number] ASC,
    E.Employee_ID ASC
GO

--4.5
SELECT
    Department_ID,
    COUNT(Employee_ID) AS [Number of Employees]
FROM
    EMPLOYEE
GROUP BY
    Department_ID
HAVING
    COUNT(Employee_ID) >= 4


--4.6
SELECT
    E.Employee_ID as [Employee ID]
    , E.First_Name as [First Name]
    , E.Last_Name as [Last Name]
    , E.[Hire Date]
    , T.[Total Hired in Feb] 
FROM
    EMPLOYEE E,
    (
        SELECT
            COUNT(Employee_ID) AS [Total Hired in Feb]
        FROM
            EMPLOYEE
        WHERE
            MONTH([Hire Date]) = 2 
        GROUP BY
            MONTH([Hire Date]) 
        HAVING
            COUNT(Employee_ID) >= 0 
    ) AS T
WHERE
    MONTH(E.[Hire Date]) = 2 
    


--4.7
SELECT
    E.Employee_ID as [Employee ID]
    , E.First_Name as [First Name]
    , E.Last_Name as [Last Name]
    , E.[Hire Date]
    , T.[Total Hired in Month]
FROM
    EMPLOYEE E,
    (
        SELECT
            MONTH([Hire Date]) AS [Hire of Month]
            , COUNT(Employee_ID) AS [Total Hired in Month]
        FROM
            EMPLOYEE
        WHERE
            MONTH([Hire Date]) IN (5, 6)
        GROUP BY
            MONTH([Hire Date])
        HAVING
            COUNT(Employee_ID) >= 1
    ) AS T 
WHERE
    MONTH(E.[Hire Date]) = T.[Hire of Month]
ORDER BY
    E.[Hire Date] ASC;
GO


--4.8
SELECT
    E.Employee_ID as [Employee ID]
    , E.First_Name as [First Name]
    , E.Last_Name as [Last Name]
    , E.[Hire Date]
    , T.[Total Hired in "85] -- Subquery से गिनती
FROM
    EMPLOYEE E,
    (
        SELECT
            COUNT(Employee_ID) AS [Total Hired in "85]
        FROM
            EMPLOYEE
        WHERE
            YEAR([Hire Date]) = 1985
        GROUP BY
            YEAR([Hire Date]) 
        HAVING
            COUNT(Employee_ID) >= 0
    ) AS T
WHERE
    YEAR(E.[Hire Date]) = 1985 
GO

--4.9
SELECT
    E.Employee_ID AS [Employee ID]
    , E.First_Name as [First Name]
    , E.Last_Name as [Last Name]
    , E.[Hire Date]
    , MONTH(E.[Hire Date]) AS [Hire Month Number]
    , T.[Total Hired in Month]
FROM
    EMPLOYEE E
JOIN
    (
        SELECT
            MONTH([Hire Date]) AS [Hire Month Number]
            , COUNT(Employee_ID) AS [Total Hired in Month] 
        FROM
            EMPLOYEE
        WHERE
            YEAR([Hire Date]) = 1985 
        GROUP BY
            MONTH([Hire Date]) 
    ) AS T ON MONTH(E.[Hire Date]) = T.[Hire Month Number]
WHERE
    YEAR(E.[Hire Date]) = 1985 
ORDER BY
    [Hire Month Number] ASC

--4.10
SELECT
    E.Employee_ID AS [Employee ID]
    ,E.First_Name as [First Name]
    ,E.Last_Name as [Last Name]
    ,E.[Hire Date] 
    ,T.[Total Hired in Apr '85]
FROM
    EMPLOYEE E, 
    (
        SELECT
            COUNT(Employee_ID) AS [Total Hired in Apr '85]
        FROM
            EMPLOYEE
        WHERE
            YEAR([Hire Date]) = 1985
            AND MONTH([Hire Date]) = 4
        GROUP BY 
            YEAR([Hire Date])
            , MONTH([Hire Date])
    ) AS T 
WHERE
    YEAR(E.[Hire Date]) = 1985
    AND MONTH(E.[Hire Date]) = 4


--4.11
INSERT INTO EMPLOYEE (Employee_ID, Last_Name, First_Name, Job_ID, Department_ID, [Hire Date], Salary, Commission)
VALUES
(7055, 'JONES', 'LISA', 667, 30, '1985-04-10', 1300.00, NULL)
, (7056, 'ADAMS', 'JOHN', 667, 30, '1985-04-20', 1350.00, NULL) 
GO


INSERT INTO EMPLOYEE (Employee_ID, Last_Name, First_Name, Job_ID, Department_ID, [Hire Date], Salary, Commission)
VALUES
(7054, 'MARTIN', 'BLAKE', 667, 30, '1985-04-01', 1250.00, NULL)
, (7783, 'CLARK', 'PETER', 671, 10, '1985-04-09', 2450.00, NULL)
, (7845, 'TURNER', 'JESS', 670, 20, '1985-04-15', 1500.00, 0.00)
, (7901, 'JAMES', 'SCOTT', 668, 40, '1984-04-03', 3000.00, NULL)
go

SELECT * FROM EMPLOYEE
go


SELECT
    E.Employee_ID AS [Employee ID]
    , E.First_Name AS [First Name]
    , E.Last_Name AS [Last Name]
    , E.[Hire Date]
    , E.Department_ID AS [Department ID]
    , T.[Total Hired in Dept Apr '85]
FROM
    EMPLOYEE E,
    (
        SELECT
            Department_ID
            , COUNT(Employee_ID) AS [Total Hired in Dept Apr '85]
        FROM
            EMPLOYEE
        WHERE
            YEAR([Hire Date]) = 1985
            AND MONTH([Hire Date]) = 4
        GROUP BY
            Department_ID
        HAVING
            COUNT(Employee_ID) >= 3 
    ) AS T
WHERE
    E.Department_ID = T.Department_ID
    AND YEAR(E.[Hire Date]) = 1985
    AND MONTH(E.[Hire Date]) = 4
ORDER BY
    E.Department_ID
    , E.Employee_ID

