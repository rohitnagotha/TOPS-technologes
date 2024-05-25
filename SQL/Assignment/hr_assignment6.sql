create database hr_4;
use  hr_4;

create table employee
(emp_id int  primary key not null,
first_name char(30),
last_name char(30),
hire_date date,
job_id varchar(30),
salary int,
commission float,
manager_id int,
department_id int,
department_name char(30),
city char(30),
manager_name char(30),
stat_name varchar (20),
location_id int);



insert into employee
(emp_id,first_name,last_name,hire_date,job_id,salary,commission,manager_id,department_id,department_name,city,manager_name,stat_name,location_id)
values
(101,'steven','king','2003-06-17','ad_pres',24000,0.0,0,90,'executive','roma',null,'ca',1710),
(102,'kochhar','nkochar','2005-09-21','a_vp',17000,0.0,100,90,'executive','venice','jeniffer','tx',1730),
(103,'de haan','ldehaan','2001-01-13','ad_vp',17000,0.0,0,90,'executive','hiroshima',null,'ca',1720),
(104,'hunold','ahunold','2006-01-03','it_prog',9000,0.0,0,60,'it','toronto',null,'ta',1080),
(105,'bruce','ernst','2007-05-21','it_prog',6000,0.0,103,60,'it','bern','donald','tx',1090),
(106,'david','austin','2005-06-25','it_prog',4800,0.0,103,60,'it','Trenna','michel','ca',1780),
(107,'valli','pataballa','2001-06-03','it_prog',4800,0.0,103,60,'it','Trenna','michel','ca',1790),
(108,'dianna','lorentz','2009-07-25','fi_manger',1208,0.0,101,100,'finance','Trenna','alana','tx',1780),
(109,'nancy','greenberg','2006-03-28','fi_account',9000,0.0,0,100,'finance','ATLANTA',null,'ta',1800),
(110,'daanial','faviet','2005-12-17','fi_account',8200,0.0,108,100,'finance','ATLANTA','alana','florida',1800),
(111,'john','chen','2005-06-25','fi_account',7000,0.0,108,100,'finance','ATLANTA','alana','ta',1800),
(112,'ismael','sciaria','2003-06-03','fi-account',6900,0.0,108,100,'finance','sydney','alana','ca',1780),
(113,'lois','popp','2005-06-25','cleark',2500,0.0,103,30,'purchasing','Trenna','samuel','tx',1780),
(114,'james','mrlow','2006-02-10','cleark',2700,0.0,0,30,'purchasing','Trenna',null,'ta',1780),
(115,'steven','markle','2005-06-25','cleark',2500,0.0,120,30,'purchasing','sydney','kevin','ca',1900),
(116,'lauren','bisot','2009-08-28','cleark',2800,0.0,120,30,'purchasing','ATLANTA','sarah','ca',1800),
(117,'ki','gee','2010-06-03','cleark',2000,0.0,121,30,'purchasing','ATLANTA','sarah','ca',1800),
(118,'john','seo','2005-01-30','cleark',2200,0.0,121,30,'purchasing','beijing','pat','florida',1810),
(119,'joshua','patel','2005-01-24','cleark',3600,0.0,121,30,'purchasing','beijing','pat','ta',1810),
(120,'peter','vargas','2005-05-05','sales_rep',10000,0.10,147,80,'sales','Trenna','samuel','florida',1780),
(121,'trenna','rajs','2005-08-10','sales_rep',9000,0.22,147,80,'sales','Trenna','samuel','tx',1780),
(122,'peter','hall','2008-09-25','sales_rep',15000,0.15,147,80,'sales','Trenna','samuel','ca',1780),
(123,'oliver','tuvalt','2005-10-25','sales_rep',8800,0.10,147,80,'sales','ATLANTA','pat','ta',1800),
(124,'jenette','king','2005-06-10','sales_rep',7000,0.15,149,80,'sales','ATLANTA','pat','ta',1800), 
(125,'loise','doran','2005-09-02','sales_rep',15000,0.20,149,80,'sales','roma','pat','ca',1710);

--Write a query to display the last name and hire date of any employee in the same
department as SALES--

select last_name,hire_date from employee
where department_name = 'sales'

-- Create a query to display the employee numbers and last names of all employees who
earn more than the average salary. Sort the results in ascending order of salary.--

select avg(salary) from employee

select last_name,salary from employee
where salary>(select avg(salary) from employee)

--Write a query that displays the employee numbers and last names of all employees who
work in a department with any employee whose last name_contains u--

select last_name,department_id from employee
where department_id in (select department_id from employee where last_name like '%u%')


--Display the last name, department number, and job ID of all employees whose
department location is ATLANTA--

select last_name,department_id,job_id from employee
where city ='ATLANTA'


--Display the last name and salary of every employee who reports to samuel--

select last_name,salary from employee
where manager_name = 'samuel'

--Display the department number, last name, and job ID for every employee in the
IT department--

select department_id,last_name ,job_id from employee
where department_name = 'it'

--Modify the above query to display the employee numbers, last names, and salaries of all
employees who earn more than the average salary and who work in a department with any
employee with a 'u'in their name--

select last_name,salary from employee
where salary>(select avg(salary) from employee) 
and department_id in (select department_id from employee where last_name like '%u%')


--Display the names of all employees whose job title is the same as anyone in the sales
dept--

select * from employee
where job_id in (select job_id from employee where department_name = 'sales')


--Write a compound query to produce a list of employees showing raise percentages,
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
given a 15% raise, and employees in department 6 are not given a raise--

select emp_id,department_id,salary,
case 
when department_id in (90,100) then 0.05
when department_id = 80 then 0.10
when department_id in (30,30) then 0.15
else 0.00
end as raise_per
from employee


--Write a query to display the top three earners in the EMPLOYEES table. Display their last
names and salaries--

select last_name,salary from employee
order by salary desc
limit 3;

--Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column--



SELECT first_name, salary, COALESCE(commission, 0) as commission
FROM employee



--Display the Managers (name) with top three salaries along with their salaries and
department information--

select first_name,salay,department_id from employee
where manager_name = true
order by salary desc
limit 3;
