USE master;
GO

DROP TABLE IF EXISTS StudentCourses, StudentSkills, StudentPayments, Students, Courses, Departments, AdvancedStudents, StudentProfile, Enrollments, Student;

--Tables
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(50),
    DeptID INT FOREIGN KEY REFERENCES Departments(DeptID)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(50),
    City NVARCHAR(50),
    JoinDate DATE  -- DATE type only!
);

-- INSERT DATA (DATE strings, no ints!)
INSERT INTO Departments (DeptID, DeptName) VALUES 
(1, 'Computer Science'), (2, 'Data Science');

INSERT INTO Courses (CourseID, CourseName, DeptID) VALUES 
(101, 'Data Science', 2), (102, 'Python', 1), (103, 'SQL Server', 1);

INSERT INTO Students (StudentID, Name, City, JoinDate) VALUES 
(1, 'Yash Bhatt', 'Gandhidham', '2026-01-15'),  -- String 'YYYY-MM-DD' for DATE
(2, 'Rahul Shah', 'Bhuj', '2026-01-20'),
(3, 'Priya Patel', 'Mundra', '2026-02-01');

-- JUNCTION TABLES
CREATE TABLE StudentPayments (
    PaymentID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    PaymentDate DATE,
    Amount DECIMAL(10,2)
);
INSERT INTO StudentPayments VALUES (1001, 1, '2026-02-10', 5000.00), (1002, 2, '2026-02-12', 4500.00);

CREATE TABLE StudentSkills (
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    Skill NVARCHAR(50),
    PRIMARY KEY (StudentID, Skill)
);
INSERT INTO StudentSkills VALUES (1, 'Python'), (1, 'SQL'), (2, 'ML');

CREATE TABLE StudentCourses (
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Grade CHAR(2),
    PRIMARY KEY (StudentID, CourseID)
);
INSERT INTO StudentCourses VALUES (1, 101, 'A'), (2, 102, 'B');

PRINT '✅ Tables created - No errors!';


-- INNER JOIN (matching enrollments only)
SELECT s.Name, c.CourseName, sc.Grade
FROM Students s 
INNER JOIN StudentCourses sc ON s.StudentID = sc.StudentID
INNER JOIN Courses c ON sc.CourseID = c.CourseID;

-- LEFT JOIN (all students + their courses)
SELECT s.Name, c.CourseName
FROM Students s 
LEFT JOIN StudentCourses sc ON s.StudentID = sc.StudentID
LEFT JOIN Courses c ON sc.CourseID = c.CourseID;

-- RIGHT JOIN (all courses + enrolled students)
SELECT s.Name, c.CourseName
FROM Students s 
RIGHT JOIN StudentCourses sc ON s.StudentID = sc.StudentID
RIGHT JOIN Courses c ON sc.CourseID = c.CourseID;

-- FULL OUTER JOIN (all students/courses)
SELECT s.Name, c.CourseName
FROM Students s 
FULL OUTER JOIN StudentCourses sc ON s.StudentID = sc.StudentID
FULL OUTER JOIN Courses c ON sc.CourseID = c.CourseID;

-- CROSS JOIN (all student-course combinations)
SELECT s.Name, c.CourseName
FROM Students s CROSS JOIN Courses c;

----Aliases(AS)

--basic
SELECT Name AS [Student Name], 
       City AS Location,
       JoinDate AS [Joined On]
FROM Students;

--advanced
SELECT s.Name AS Student, 
       c.CourseName AS Subject,
       sc.Grade AS Marks
FROM Students AS s
INNER JOIN StudentCourses AS sc ON s.StudentID = sc.StudentID
INNER JOIN Courses AS c ON sc.CourseID = c.CourseID;


--Constraints

CREATE TABLE AdvancedStudents (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,           -- Mandatory
    Age INT CHECK (Age >= 18),            -- Range
    Email NVARCHAR(100) UNIQUE,           -- No duplicates
    Status NVARCHAR(20) DEFAULT 'Active', -- Default value
    Salary DECIMAL(10,2) CHECK (Salary > 0)
);



insert into AdvancedStudents values
(1, 'Yash Bhatt', 21, 'yash.bhatt@bca2026.com', 'Active', 25000.00),
(2, 'Rahul Shah', 22, 'rahul.shah@ds2026.com', 'Active', 32000.00),
(3, 'Priya Patel', 20, 'priya.patel@mlguru.com', 'Active', 28000.00),
(4, 'Amit Kumar', 25, 'amit.kumar@pythonpro.com', 'Inactive', 45000.00)


select * from AdvancedStudents


--Relationships (ER Diagram Logic)

-- 1:1 (One Student → One Profile)
CREATE TABLE StudentProfile (
    StudentID INT PRIMARY KEY,
    Phone NVARCHAR(15),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- 1:M (One Course → Many Students)
-- Already done via FK in Students

-- M:M (Junction Table)
CREATE TABLE Enrollments (
    StudentID INT , CourseID INT,
    EnrollDate DATE DEFAULT GETDATE(),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- INSERT enrollments (StudentID, CourseID pairs)
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 101),  -- Yash → Data Science
(1, 102),  -- Yash → Python
(2, 102),  -- Rahul → Python
(2, 103),  -- Rahul → SQL Server
(3, 101),  -- Priya → Data Science
(3, 102),  -- Priya → Python
(3, 103);  -- Priya → SQL Server

SELECT * FROM Enrollments ORDER BY StudentID, CourseID;



----Schema Diagram

exec sp_help 'Students';



