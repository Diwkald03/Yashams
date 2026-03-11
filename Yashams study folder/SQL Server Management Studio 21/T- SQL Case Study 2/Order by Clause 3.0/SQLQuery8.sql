USE CS_#2

--3.1
SELECT
    Employee_ID,
    Last_Name
FROM
    EMPLOYEE
ORDER BY
    Employee_ID ASC; 

--3.2
SELECT
    Employee_ID,
    First_Name,
    Salary
FROM
    EMPLOYEE
ORDER BY
    Salary desc

--3.3
SELECT
   *
FROM
    EMPLOYEE
ORDER BY
    Last_Name  ASC 

--3.4
SELECT
    Employee_ID,
    First_Name,
    Last_Name,
    Department_ID, 
    Salary
FROM
    EMPLOYEE
ORDER BY
    Last_Name ASC,       
    Department_ID desc

