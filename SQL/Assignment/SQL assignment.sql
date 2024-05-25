create database HR;
use HR;

create table employe(
emp_id int  primary key not null,
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
manager_name char(30));

drop table employe;

insert into employe
(emp_id,first_name,last_name,hire_date,job_id,salary,commission,manager_id,department_id,department_name,city,manager_name)
values
(101,'steven','king','2003-06-17','ad_pres',24000,0.0,0,90,'executive','roma',null),
(102,'kochhar','nkochar','2005-09-21','a_vp',17000,0.0,100,90,'executive','venice','jeniffer'),
(103,'de haan','ldehaan','2001-01-13','ad_vp',17000,0.0,0,90,'executive','hiroshima',null),
(104,'hunold','ahunold','2006-01-03','it_prog',9000,0.0,0,60,'it','toronto',null),
(105,'bruce','ernst','2007-05-21','it_prog',6000,0.0,103,60,'it','bern','donald'),
(106,'david','austin','2005-06-25','it_prog',4800,0.0,103,60,'it','Trenna','michel'),
(107,'valli','pataballa','2001-06-03','it_prog',4800,0.0,103,60,'it','Trenna','michel'),
(108,'dianna','lorentz','2009-07-25','fi_manger',1208,0.0,101,100,'finance','Trenna','alana'),
(109,'nancy','greenberg','2006-03-28','fi_account',9000,0.0,0,100,'finance','ATLANTA',null),
(110,'daanial','faviet','2005-12-17','fi_account',8200,0.0,108,100,'finance','ATLANTA','alana'),
(111,'john','chen','2005-06-25','fi_account',7000,0.0,108,100,'finance','ATLANTA','alana'),
(112,'ismael','sciaria','2003-06-03','fi-account',6900,0.0,108,100,'finance','sydney','alana'),
(113,'lois','popp','2005-06-25','cleark',2500,0.0,103,30,'purchasing','Trenna','samuel'),
(114,'james','mrlow','2006-02-10','cleark',2700,0.0,0,30,'purchasing','Trenna',null),
(115,'steven','markle','2005-06-25','cleark',2500,0.0,120,30,'purchasing','sydney','kevin'),
(116,'lauren','bisot','2009-08-28','cleark',2800,0.0,120,30,'purchasing','ATLANTA','sarah'),
(117,'ki','gee','2010-06-03','cleark',2000,0.0,121,30,'purchasing','ATLANTA','sarah'),
(118,'john','seo','2005-01-30','cleark',2200,0.0,121,30,'purchasing','beijing','pat'),
(119,'joshua','patel','2005-01-24','cleark',3600,0.0,121,30,'purchasing','beijing','pat'),
(120,'peter','vargas','2005-05-05','sales_rep',10000,0.10,147,80,'sales','Trenna','samuel'),
(121,'trenna','rajs','2005-08-10','sales_rep',9000,0.22,147,80,'sales','Trenna','samuel'),
(122,'peter','hall','2008-09-25','sales_rep',15000,0.15,147,80,'sales','Trenna','samuel'),
(123,'oliver','tuvalt','2005-10-25','sales_rep',8800,0.10,147,80,'sales','ATLANTA','pat'),
(124,'jenette','king','2005-06-10','sales_rep',7000,0.15,149,80,'sales','ATLANTA','pat'), 
(125,'loise','doran','2005-09-02','sales_rep',15000,0.20,149,80,'sales','roma','pat');

select * from employe;



--display only hire date & empname

select first_name, last_name, hire_date from employe

 --Display the ename concatenated with the job ID--

select first_name,concat(Trim(first_name),'_',job_id) as employee_title from employe;

--display the name and salary >2000

select first_name,last_name,salary from employe
where salary>2000;


--display names and hire date of employee order were hire--

select first_name,hire_date from employe
order by hire_date asc

--display emp name salary in reverse--

select first_name, salary from employe
order by salary desc

--Display the hire date, name and department number for all clerks-- 

select first_name,last_name,hire_date,department_id from employe
where job_id='cleark';

--Display the names and dates of employees with "Name" and "Start_date--

select first_name as name, hire_date as start_date from  employe

--Display 'ename" and "deptno" who are all earned commission--

select first_name,department_id from employe
where commission is not null
order by salary desc

--display the last name and job title of all employees who do not have a manager--

select first_name,last_name,job_id from employe
where manager_id = 0;

select * from employe;

select last_name,job_id,salary from employe
where job_id ='sales_rep'or job_id='cleark';

select last_name,job_id,salary from employe
where job_id in('sales_rep','cleark')
and salary not in(2500, 3500,5000);

--Display the maximum, minimum and average salary and commission earned--

select max(salary) as max_sal,min(salary)as min_sal,avg(salary)as avg_sal, 
min(commission)min_com,max(commission)as max_com,avg(commission) as av_com 
from employe

--Display the department number, total salary payout and total commission payout for 
each_department--

select department_id,sum(salary) as sal ,sum(commission) as comm 
from employe
group by department_id
having sum(salary)>0;

--Display the department number and number of employees in each department--
select department_id,count(emp_id) as emp
from employe
group by department_id

-- Display the department number and total salary of employees in each department--
select department_name,sum(salary) as total_salary
from employe
group by department_name

--Display the employees name_who doesnt earn a commission. Order_the result set_ 
withoutusing the column_name-- 

select first_name,last_name from employe
where commission =0

select first_name,department_id,
COALESCE(commission,null) as commission
from employe


 --Display the employee's name, department id who have the first name same as another 
employee in the same department--

select DISTINCT first_name as emp_name,department_id as d_id
from employe

--Display the sum of salaries of the employees working under each Manager--

select manager_id as mng_id,sum(salary) total_sal
from employe
where  emp_id not in(select manager_id from employe)
group by manager_id

--select the Managers name, the count of employees working under and the department 
ID of the manager--

select manager_name,count(emp_id) as total_emp
from employe
group by manager_name

-- Select the maximum salary of each department along with the department id--
select department_id,max(salary)
from employe
group by department_id

select first_name,salary, COALESCE(commission, 0.1 * salary, 1) as comiision
from employe