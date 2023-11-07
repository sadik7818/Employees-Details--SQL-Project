create database Project

Create Table EmployeeDetails (EmployeeId Int,FirstName Varchar(max),LastName varchar(max),Salary int,JoiningDate Datetime,Department varchar(max),Gender Varchar(max))
select * from EmployeeDetails

-- Write a query to get all employee detail from "EmployeeDetail" table
select * from EmployeeDetails

--Write a query to get only "FirstName" column from "EmployeeDetail" table
Select FirstName from EmployeeDetails

-- Write a query to get FirstName in upper case 
select upper(FirstName) from EmployeeDetails

-- Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
select CONCAT(FirstName,' ',LastName) 'Name' from EmployeeDetails

--Select employee detail whose name is "Vikas
select * from EmployeeDetails where FirstName='Vikas'

--Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
select * from EmployeeDetails
where FirstName like 'A%'

-- Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
select * from EmployeeDetails
where FirstName like '%H'

--Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'
select * from EmployeeDetails
where FirstName like '[a-p^]%'

-- Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
select * from EmployeeDetails
where FirstName like '[^a-p]%'

-- Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character
select * from EmployeeDetails
where Gender like '__le'

-- Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
select * from EmployeeDetails
where FirstName like 'A____'

-- Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
select * from EmployeeDetails
where FirstName like '%[%]%'

--Get all unique "Department" from EmployeeDetail table
select Distinct(Department) 'Unique-Department' from EmployeeDetails

-- Get the highest "Salary" from EmployeeDetail table.
select max(Salary) 'Maximum Salary' from EmployeeDetails

-- Get the lowest "Salary" from EmployeeDetail table
select min(Salary) 'Minimum Salary' from EmployeeDetails

-- Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
select convert(varchar(20),JoiningDate,106)
from EmployeeDetails

-- Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
select convert(varchar(20),JoiningDate,111)
from EmployeeDetails

-- Show only time part of the "JoiningDate"
select convert(varchar(20),JoiningDate,108)
from EmployeeDetails

--Get only Year part of "JoiningDate"
select year(JoiningDate) from EmployeeDetails

--Get only Month part of "JoiningDate”
select MONTH(JoiningDate) from EmployeeDetails
--Get system date
SELECT GETDATE()

--Get UTC date.
Select GETUTCDATE()

--Get the first name, current date, joiningdate and diff between current date and joining date in months.
Select firstname,GETDATE(),JoiningDate,DATEDIFF(month,JoiningDate,Getdate())'Diffrence - in Months' from EmployeeDetails

--Get the first name, current date, joiningdate and diff between current date and joining date in days.
select FirstName,GetDate(),JoiningDate,DATEDIFF(Day,Joiningdate,Getdate())'Diffrence - In days' from EmployeeDetails


--Get all employee details from EmployeeDetail table whose joining year is 2013
select * from EmployeeDetails where Datepart(YYYY,JoiningDate)='2013'

--Get all employee details from EmployeeDetail table whose joining month is Jan(1)
select * from EmployeeDetails where Datepart(MM,JoiningDate)='1'


--Get how many employee exist in "EmployeeDetail" table
select Count(*)' Total Employees' from EmployeeDetails

--31. Select only one/top 1 record from "EmployeeDetail" table
select top 1 * from EmployeeDetails
-- Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select * from EmployeeDetails where Firstname in('Vikas','Ashish','Nikhil')

-- Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
select * from EmployeeDetails where Firstname not in('Vikas','Ashish','Nikhil')

-- Select first name from "EmployeeDetail" table after removing white spaces from right side
---RTRIM (for Right Side)    --LTRIM(For Left side)
select RTRIM(Firstname) from EmployeeDetails

--Select first name from "EmployeeDetail" table after removing white spaces from left side
select LTRIM(Firstname) from EmployeeDetails

--Display first name and Gender as M/F.(if male then M, if Female then F)
select FirstName , 
case
when Gender='Female' then 'F'
else 'M'
end as 
'Gender(M/F)'
from EmployeeDetails

--Select first name from "EmployeeDetail" table prifixed with "Hello
select 'HELLO '+ fIRSTNAME from EmployeeDetails

-- Get employee details from "EmployeeDetail" table whose Salary greater than 600000
select * from EmployeeDetails where Salary>600000

-- Get employee details from "EmployeeDetail" table whose Salary less than 700000
select * from EmployeeDetails where Salary<700000

-- Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
select * from EmployeeDetails where Salary between 500000 and 600000

----------------Project Detail Table-----------------------
create table ProjectDetail(ProjectDetailID Int,EmployeeDetailID int ,ProjectName varchar(max))
select * from ProjectDetail

--- Give records of ProjectDetail table
select * from ProjectDetail

-- Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.
select department ,sum(Salary) from EmployeeDetails
group by (Department)

-- Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
select department ,sum(Salary) from EmployeeDetails
group by (Department) 
order by sum(Salary)

-- Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary
select department ,sum(Salary) from EmployeeDetails
group by (Department) 
order by sum(Salary) desc

-- Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
select department,count(department),sum(Salary) from EmployeeDetails
group by Department

--- Get department wise average salary from "EmployeeDetail" table order by salary ascending
select department,avg(salary)'Avg Salary' from EmployeeDetails
group by Department
order by AVG(Salary)
-- Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
select department,max(salary)'Maximum Salary' from EmployeeDetails
group by Department
order by [Maximum Salary]

-- Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
select department,min(salary) 'Minimum Salary' from EmployeeDetails
group by department
order by [Minimum Salary]

--- Join both the table that is Employee and ProjectDetail based on some common paramter
select * from EmployeeDetails
select * from ProjectDetail

select EmployeeDetails.EmployeeID,EmployeeDetails.FirstName,EmployeeDetails.LastName,EmployeeDetails.Salary,EmployeeDetails.Department,
ProjectDetail.ProjectDetailID,ProjectDetail.EmployeeDetailID,ProjectDetail.ProjectName
from EmployeeDetails
full outer join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.ProjectDetailID


--Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
select concat(FirstName,' ',LastName),ProjectName
from EmployeeDetails
inner join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailID
order by FirstName

-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.
select CONCAT(FirstName,' ',LastName),ProjectDetail.ProjectName
from EmployeeDetails
Left join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailID
order by FirstName

-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"
select concat(FirstName,' ',LastName),ISNULL(ProjectDetail.ProjectName,'NO PROJECT ASSIGNED') 'Project Name'
from EmployeeDetails
Left join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailID

--Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail
select CONCAT(FirstName,' ',LastName),ProjectDetail.ProjectName
from EmployeeDetails
full outer join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailID
order by FirstName

-- Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
select EmployeeId, CONCAT(FirstName,' ',LastName),salary,joiningDate,Department,Gender,ProjectDetailid,EmployeeDetailID, ProjectDetail.ProjectName
from EmployeeDetails
full outer join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailID
order by FirstName

--Write down the query to fetch EmployeeName & Project who has assign more than one project
select FirstName,ProjectName 
from EmployeeDetails
inner join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailID
where employeeid in (select EmployeeDetailID from ProjectDetail 
group by EmployeeDetailId having count(*)>1)

-- Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName
select FirstName,ProjectName 
from EmployeeDetails
inner join ProjectDetail
on EmployeeDetails.EmployeeID=ProjectDetail.EmployeeDetailID
where ProjectName in (select ProjectName from ProjectDetail 
group by ProjectName having count(1)>1)


-- Apply Cross Join in Both the tables
select * from EmployeeDetails
cross join ProjectDetail

---Write down the query to print first letter of a Name in Upper Case and all other letter in Lower Case.(EmployDetail table)
select concat(Upper(left(Firstname,1)),Lower(Right(FirstName,Len(FirstName)-1))) from EmployeeDetails

-- Write down the query to display all employee name in one cell seprated by ',' ex:-"Vikas, nikita, Ashish, Nikhil , anish"(EmployDetail table)

--Write down the query to get ProjectName and respective EmployeeName(firstname) which are working on the project--if more then one employee working on same project, then it should be in same cell seprated by comma 
--for example :- Task Tracker : Vikas, Ashish


-- You have a table(FuelDetail) with ID, Fuel, And Date columns. --Fuel column is contain fuel quantity at a particular time when car start traveling.
-- So we need to find out that when the driver fill Petrol in his/her car.
 --By FuelDetail Table image on the top of this post, you can understand the query.
 --Car start driving at 10 Am on 25th April with petrol(10 liter) 
--at 11 AM Petrol was 9 liters
 --at 12 AM petrol was 8 liters 
--at 2 PM (14) petrol was 12 liters... 
--This means that he/she fill the petrol at 25th April 2014 at 2PM --Next time he fill petrol at 7PM 25th April 2014 
--and Next time he fill petrol at 11PM 25th April 2014


Create Table FuelDetail(ID int,Fuel int,Date Datetime)
select * from FuelDetail



-- What would be the out-put of the following Sql query? 
SELECT A.A FROM (SELECT 1 A, 2 B) A JOIN (SELECT 1 A,1 B)B ON A.A = B.B 
Options:
