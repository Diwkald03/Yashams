use CS_#2
--select from EMPLOYEE
--6.1


select
    Employee_ID as [Employee ID]
    , First_Name as [First Name]
    , Last_Name as [Last Name]
    , Salary
    , case
        when salary >= 2500 then 'A (High)'
        when salary between 2000 and 2799 then 'B (Medium)'
        when salary between 1500 and 1999 then 'C (Low)'
        else 'D (Very Low)'
    end as [Salary Grade]
from
    EMPLOYEE


--6.2
SELECT
    s.[Salary Grade],
    COUNT(s.Employee_ID) AS [Number of Employees]
FROM
    (
        SELECT
            Employee_ID,
            Salary,
            CASE
                WHEN Salary >= 2500 THEN 'A (High)'
                WHEN Salary BETWEEN 2000 AND 2499 THEN 'B (Medium)'
                WHEN Salary BETWEEN 1500 AND 1999 THEN 'C (Low)'
                ELSE 'D (Very Low)'
            END AS [Salary Grade]
        FROM
            EMPLOYEE
    ) AS s
GROUP BY
    s.[Salary Grade]
ORDER BY
    [Number of Employees] DESC;
GO


--6.3
SELECT
    [Salary Grade],
    [Number of Emp in Grade],
    (
        SELECT
            COUNT(Employee_ID)
        FROM
            EMPLOYEE
        WHERE
            Salary BETWEEN 2000 AND 5000
    ) AS [Total Emp 2000 to 5000]
FROM
    (
        SELECT
            CASE
                WHEN Salary >= 2800 THEN 'A'
                WHEN Salary BETWEEN 2000 AND 2799 THEN 'B'
                WHEN Salary BETWEEN 1500 AND 1999 THEN 'C'
                ELSE 'D'
            END AS [Salary Grade],
            COUNT(Employee_ID) AS [Number of Emp in Grade]
        FROM
            EMPLOYEE
        GROUP BY
            CASE
                WHEN Salary >= 2800 THEN 'A'
                WHEN Salary BETWEEN 2000 AND 2799 THEN 'B'
                WHEN Salary BETWEEN 1500 AND 1999 THEN 'C'
                ELSE 'D'
            END
    ) AS T
ORDER BY
    [Salary Grade];
GO