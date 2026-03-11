USE master;
GO

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

