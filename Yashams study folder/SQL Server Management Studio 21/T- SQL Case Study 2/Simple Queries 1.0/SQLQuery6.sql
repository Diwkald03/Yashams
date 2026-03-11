use CS_#2

--SIMPLE QUERIES
--1. 
SELECT * FROM DBO.EMPLOYEE

--2. 
SELECT * FROM DBO.Department4

--3.
SELECT * FROM DBO.JOB

--4.
SELECT * FROM DBO.LOCATION4

--5.
SELECT
	First_Name,
	Last_Name,
	Salary,
	Commission
FROM
	EMPLOYEE
	
--6.
SELECT
	Employee_ID as [ID of the Employee]
	, Last_Name as [Name of the Employee]
	, Department_ID as [Dep_ID]
from
	EMPLOYEE


--7.
SELECT
    First_Name
    ,(Salary * 12) AS [Annual Salary]
FROM
    EMPLOYEE;
