use CS_#2

--7.1


select
    Employee_ID [Employee ID]
    , First_Name [First Name]
    , Last_Name [Last Name]
    , Salary
from
    employee
where
    Salary = (
        select
            max(Salary)
        from
            EMPLOYEE
    )
go

--7.2
select
    Employee_id  [Employee ID]
    , First_Name  [First Name]
    , Last_Name  [Last Name]
    , Salary
    , Department_id  [Department ID]
from
    employee
where
    Department_id = (
        select
            Department_Id
        from
            Department4
        where
            name = 'Sales'
    )
go

--7.3
select
    Employee_id  [Employee ID]
    , First_Name  [First Name]
    , Last_Name  [Last Name]
    , Job_id  [Job ID]
from
    employee
where
    job_id = (
        select
            job_id
        from
            job
        where
            Designation = 'Clerk'
    )
go


--7.4
select
    Employee_id  [Employee ID]
    , First_Name [First Name]
    , Last_Name  [Last Name]
    , Department_id  [Department ID]
from
    employee
where
    Department_ID = (
        select
            Department_Id
        from
            Department4
        where
            Location_id = (
                select
                    Location_id
                from
                    Location4
                where
                    city = 'Boston'
            ))
go

--7.5
select
    count(Employee_id)  [Number of Employees in Sales]
from
    employee
where
    Department_id = (
        select
            Department_id
        from
            Department4
        where
            name = 'Sales'
    )
go

--7.6
update employee
set
    salary = salary * 1.10
where
    job_id = (
        select
            job_id
        from
            job
        where
            designation = 'clerk'
    )
go

select
    e.first_name [First Name]
    , e.last_name [Last Name]
    , e.salary [Salary]
    , j.designation [Designation]
from
    employee e
join
    job j on e.job_id = j.job_id
where
    j.designation = 'clerk'
go

--7.7
select
    employee_id [Employee ID]
    , first_name [First Name]
    , last_name [Last Name]
    , Salary 
from
    employee
where
    salary = (
        select
            max(salary)
        from
            employee
        where
            salary < (
                select
                    max(salary)
                from
                    employee
            ))
go


--7.8
select
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
from
    employee
where
    salary > (
        select
            max(salary)
        from
            employee
        where
            department_id = 30
    )
    and department_id <> 30
go

--7.9
select
    department_id [Department ID]
    , name [Department Name]
from
    department4
where
    department_id not in (
        select
            department_id
        from
            employee
    )
go

--7.10
select
    e.employee_id [Employee ID]
    , e.first_name [First Name]
    , e.last_name [Last Name]
    , e.department_id [Department ID]
    , e.[Salary]
from
    employee e
where
    e.salary > (
        select
            avg(salary)
        from
            employee
        where
            department_id = e.department_id 
    )
go