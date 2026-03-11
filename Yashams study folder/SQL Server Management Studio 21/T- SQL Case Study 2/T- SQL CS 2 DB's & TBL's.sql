USE master;
GO
USE CS_#2
GO

DROP TABLE IF EXISTS dbo.EMPLOYEE;
DROP TABLE IF EXISTS dbo.JOB;
DROP TABLE IF EXISTS dbo.Department4;
DROP TABLE IF EXISTS dbo.Location4;
GO


CREATE TABLE Location4(Location_ID INT PRIMARY KEY,City VARCHAR(100));
GO


INSERT INTO Location4(Location_ID,City)VALUES(122,'New York'),(123,'Dallas'),(124,'Chicago'),(167,'Boston');
GO


SELECT * FROM Location4;
GO


CREATE TABLE Department4(Department_Id INT PRIMARY KEY,Name VARCHAR(100),Location_ID INT,CONSTRAINT FK_Department_Location FOREIGN KEY (Location_ID) REFERENCES Location4 (Location_ID));
GO


INSERT INTO Department4(Department_Id,Name,Location_ID)VALUES(10,'Accounting',122),(20,'Sales',124),(30,'Research',123),(40,'Operations',167);
GO


SELECT * FROM Department4;
GO


CREATE TABLE JOB (Job_ID INT PRIMARY KEY,Designation VARCHAR(100));
GO


INSERT INTO JOB (Job_ID, Designation) VALUES(667, 'Clerk'),(668, 'Staff'),(669, 'Analyst'),(670, 'Sales Person'),(671, 'Manager'),(672, 'President');
GO


SELECT * FROM JOB;
GO


CREATE TABLE EMPLOYEE (
    Employee_ID INT PRIMARY KEY
    , Last_Name VARCHAR(100)
    , First_Name VARCHAR(100)
    , Middle_Name VARCHAR(100)
    , Job_ID INT
    CONSTRAINT FK_EMPLOYEE_JOB 
        FOREIGN KEY (Job_ID) 
        REFERENCES JOB (Job_ID)
    , [Hire Date] DATE
    , Salary int
    , Commission int
    , Department_ID int
    constraint fk_EPLOYEE_Department4 
        foreign key(Department_ID)
        references Department4(Department_ID))
GO

INSERT INTO EMPLOYEE VALUES
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, Null, 20)
,(7499, 'Allen', 'Kelvin', 'J', 670, '1985-02-20', 1600, 300, 30)
, (755, 'Doyle', 'Jean', 'K', 671, '1985-04-04', 2850, Null, 30)
, (756, 'Dennis', 'Lynn', 'S', 671, '1985-06-15', 2750, Null, 30)
, (757, 'Baker', 'Leslie', 'D', 671, '1985-07-10', 2200, Null, 40)
, (7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22', 1250, 50, 30)
go

select * from EMPLOYEE
