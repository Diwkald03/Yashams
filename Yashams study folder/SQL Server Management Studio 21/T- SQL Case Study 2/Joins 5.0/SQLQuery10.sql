use CS_#2


--5.1
SELECT
    E.First_Name,
    E.Last_Name,
    D.Name AS Department_Name
FROM
    EMPLOYEE E
JOIN
    Department4 D ON E.Department_ID = D.Department_Id
GO

--5.2

SELECT
    Employee_ID as [Employee ID]
    , E.First_Name as [First Name]
    , E.Last_name as [Last Name]
    , J.Designation as [Designation]
from
    EMPLOYEE E
join    
    JOB J on E.Job_ID =J.Job_ID

--5.3
SELECT
    Employee_ID as [Employee ID]
    , E.First_Name as [First Name]
    , E.Last_Name as [Last Name]
    , D.Name AS [Department Name]
    , L.City
FROM
    EMPLOYEE E
JOIN
    Department4 D ON E.Department_ID = D.Department_Id
JOIN
    Location4 L ON D.Location_ID = L.Location_ID;
GO

--5.4
SELECT
    D.Name AS [Department Name]
    , COUNT(E.Employee_ID) AS [Total Employees]
FROM
    EMPLOYEE E
JOIN
    Department4 D ON E.Department_ID = D.Department_Id
GROUP BY
    D.Name
ORDER BY
    [Total Employees] DESC;
GO

--5.5
SELECT
    COUNT(E.Employee_ID) AS [Employees in Sales]
FROM
    EMPLOYEE E
JOIN
    Department4 D ON E.Department_ID = D.Department_Id
WHERE
    D.Name = 'Sales';
GO

--5.6
SELECT
    D.Name AS [Department Name]
    , COUNT(E.Employee_ID) AS [Number of Employees]
FROM
    EMPLOYEE E
JOIN
    Department4 D ON E.Department_ID = D.Department_Id
GROUP BY
    D.Name
HAVING
    COUNT(E.Employee_ID) >= 3
ORDER BY
    [Department Name] ASC;
GO

--5.7
SELECT
    COUNT(E.Employee_ID) AS [Employees in Dallas]
FROM
    EMPLOYEE E
JOIN
    Department4 D ON E.Department_ID = D.Department_Id
JOIN
    Location4 L ON D.Location_ID = L.Location_ID
WHERE
    L.City = 'Dallas';
GO

--5.8
SELECT
    Employee_ID as [Employee ID]
    , E.First_Name as [First Name]
    , E.Last_Name as [Last Name]
    , D.Name AS [Department Name]
FROM
    EMPLOYEE E
JOIN
    Department4 D ON E.Department_ID = D.Department_Id
WHERE
    D.Name = 'Sales' OR D.Name = 'Operations'
GO