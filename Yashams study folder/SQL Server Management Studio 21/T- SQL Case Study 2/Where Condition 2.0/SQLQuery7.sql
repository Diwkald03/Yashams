use CS_#2

--2.1
select * from EMPLOYEE
WHERE Last_Name ='Smith'

--2.2
select * from EMPLOYEE
WHERE Department_ID =20

--2.3
select * from EMPLOYEE
WHERE Salary between 2000 and 3000

--2.4
select * from EMPLOYEE
WHERE Department_ID = 10 or Department_ID = 20

--2.5
SELECT
   *
FROM
    EMPLOYEE
WHERE
    Department_ID NOT IN (10, 30)

--2.6
SELECT
*
FROM
    EMPLOYEE
WHERE
    First_Name LIKE 'L%'

--2.7.
SELECT
    *
FROM
    EMPLOYEE
WHERE
    First_Name LIKE 'L%%E'

--2.8.
SELECT
   *
FROM
    EMPLOYEE
WHERE
    LEN(First_Name) = 4 
    AND First_Name LIKE 'J%'
    
--2.9.
SELECT
   *
FROM
    EMPLOYEE
WHERE
    Department_ID = 30
    AND Salary > 2500

--2.10. 
SELECT
   *
FROM
    EMPLOYEE
WHERE
    Commission  is Null