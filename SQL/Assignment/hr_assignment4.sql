create database hr_3;
use hr_3



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

select * from employee

-Write a query to display the last name, department number, department name for all 
employees--

select last_name,department_id,department_name from employee;

 --Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output-- 

select distinct(job_id),department_name,location_id from employee


--Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission--

select last_name,department_name,city,location_id,commission from employee
where commission>=0.1

--Display the employee last name and department name of all employees who have an 'a' 
in their last_name--

select last_name,department_name from employee
where last_name like '%a%'

--Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA--

select last_name,job_id,department_id,department_name from employee
where city='ATLANTA';

--Display the employee last name and employee number along with their manager's last 
name and manager number--

select emp_id,last_name,manager_name as manager_lastname,manager_id from employee
where manager_name  is not null

-- Display the employee last name and employee number along with their manager's last 
name and manager number (including the employees who have no manager)--

select emp_id,last_name,manager_name as manager_lastname,manager_id from employee

--Create a query that displays employees last name,department number,and all the 
employees who_work in the same department as a given employee--




SELECT e1.last_name AS employee,
       e1.department_id,
       e2.last_name AS Colleague
FROM employee e1
JOIN employee e2
  ON e1.department_id = e2.department_id
WHERE e1.emp_id =109
ORDER BY e1.last_name, e2.last_name;


--Create a query that displays the name,job,department name,salary,grade for all
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C--

select first_name,job_id,department_name,salary,
case when salary>=50000 then 'a'
when salary>=30000 then 'b'
else 'c'
end as grade from employee


SELECT e.first_name as emp_name, e.hire_date AS "emp_hire_date" FROM employee e

SELECT e.first_name as emp_name,e.hire_date AS "emp_hire_date",
      manager_name as manager_name,
       m.hire_date AS "man_hire_date"
FROM employee e
JOIN employee m
  ON e.manager_id = m.emp_id
WHERE e.hire_date < m.hire_date
ORDER BY e.emp_name;





 

