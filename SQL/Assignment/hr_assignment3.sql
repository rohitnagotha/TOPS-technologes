create database HR_2;
use HR_2;

create table hr
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
stat_name varchar (20));

drop table hr;

insert into hr
(emp_id,first_name,last_name,hire_date,job_id,salary,commission,manager_id,department_id,department_name,city,manager_name,stat_name)
values
(101,'steven','king','2003-06-17','ad_pres',24000,0.0,0,90,'executive','roma',null,'ca'),
(102,'kochhar','nkochar','2005-09-21','a_vp',17000,0.0,100,90,'executive','venice','jeniffer','tx'),
(103,'de haan','ldehaan','2001-01-13','ad_vp',17000,0.0,0,90,'executive','hiroshima',null,'ca'),
(104,'hunold','ahunold','2006-01-03','it_prog',9000,0.0,0,60,'it','toronto',null,'ta'),
(105,'bruce','ernst','2007-05-21','it_prog',6000,0.0,103,60,'it','bern','donald','tx'),
(106,'david','austin','2005-06-25','it_prog',4800,0.0,103,60,'it','Trenna','michel','ca'),
(107,'valli','pataballa','2001-06-03','it_prog',4800,0.0,103,60,'it','Trenna','michel','ca'),
(108,'dianna','lorentz','2009-07-25','fi_manger',1208,0.0,101,100,'finance','Trenna','alana','tx'),
(109,'nancy','greenberg','2006-03-28','fi_account',9000,0.0,0,100,'finance','ATLANTA',null,'ta'),
(110,'daanial','faviet','2005-12-17','fi_account',8200,0.0,108,100,'finance','ATLANTA','alana','florida'),
(111,'john','chen','2005-06-25','fi_account',7000,0.0,108,100,'finance','ATLANTA','alana','ta'),
(112,'ismael','sciaria','2003-06-03','fi-account',6900,0.0,108,100,'finance','sydney','alana','ca'),
(113,'lois','popp','2005-06-25','cleark',2500,0.0,103,30,'purchasing','Trenna','samuel','tx'),
(114,'james','mrlow','2006-02-10','cleark',2700,0.0,0,30,'purchasing','Trenna',null,'ta'),
(115,'steven','markle','2005-06-25','cleark',2500,0.0,120,30,'purchasing','sydney','kevin','ca'),
(116,'lauren','bisot','2009-08-28','cleark',2800,0.0,120,30,'purchasing','ATLANTA','sarah','ca'),
(117,'ki','gee','2010-06-03','cleark',2000,0.0,121,30,'purchasing','ATLANTA','sarah','ca'),
(118,'john','seo','2005-01-30','cleark',2200,0.0,121,30,'purchasing','beijing','pat','florida'),
(119,'joshua','patel','2005-01-24','cleark',3600,0.0,121,30,'purchasing','beijing','pat','ta'),
(120,'peter','vargas','2005-05-05','sales_rep',10000,0.10,147,80,'sales','Trenna','samuel','florida'),
(121,'trenna','rajs','2005-08-10','sales_rep',9000,0.22,147,80,'sales','Trenna','samuel','tx'),
(122,'peter','hall','2008-09-25','sales_rep',15000,0.15,147,80,'sales','Trenna','samuel','ca'),
(123,'oliver','tuvalt','2005-10-25','sales_rep',8800,0.10,147,80,'sales','ATLANTA','pat','ta'),
(124,'jenette','king','2005-06-10','sales_rep',7000,0.15,149,80,'sales','ATLANTA','pat','ta'), 
(125,'loise','doran','2005-09-02','sales_rep',15000,0.20,149,80,'sales','roma','pat','ca');

select * from hr

1 --Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column_an 
appropriate label//---


SELECT 
    CONCAT(
        UPPER(SUBSTRING(last_name, 2, 1)),
        LOWER(SUBSTRING(last_name, 3, 3))
    ) AS "Partial Last Name"
FROM hr;

2--. Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month_on which the employee has joined--

select CONCAT(first_name,'_',last_name) as emp_name,MONTH(hire_date) as join_month from hr


3--Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label--

  SELECT 
    last_name AS "Last Name",
    salary AS "Original Salary",
    CASE
        WHEN salary / 2 > 10000 THEN salary * 1.10
        ELSE salary * 1.115
    END AS "Adjusted Salary",
    1500 AS "Bonus Amount"
FROM hr;
  
  --4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with--


SELECT
    CONCAT(
        LEFT(emp_id, 2),
        '00',
        SUBSTRING(emp_id,1,3),
        'E'
    ) AS "Modified Employee ID",
    department_id AS "Department ID",
    salary AS "Salary",
    UPPER(
        REPLACE(manager_name, 'z', '$') ) AS "Manager Name" FROM hr;

5--Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees

SELECT 
    CONCAT(UPPER(SUBSTRING(last_name, 1, 3)), LOWER(SUBSTRING(last_name, 2,4))) AS "Formatted Last Name",
    LEN(last_name) AS "Name Length" FROM hr
WHERE 
    last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY 
    last_name;


6-- Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY ---***

select last_name, ipad(salary,15,$) as salary from hr;  

7--Display the employee's_name if it is a_palindrome --**/

select first_name from hr where first_name = REVERSE(first_name);

8--Display First names of all employees with initcaps--

select upper(first_name) as First_name from hr;




 10--Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name--**// 

SELECT  first_name,LOWER(CONCAT_WS('', SUBSTRING(first_name, 1, 1), last_name, '@systechusa.com')) AS "e-mail address"
FROM hr;

11-- Display the names and job titles of all employees with the same job as Trenna--

SELECT first_name, last_name,job_id FROM hr
WHERE 
    job_id = (SELECT job_id FROM hr WHERE first_name = 'Trenna')
ORDER BY 
    last_name, first_name;


12--Display the names and department name of all employees working in the same city as 
Trenna--


SELECT 
    e.first_name,
    e.last_name,
    d.department_name
FROM  hr;
JOIN 
    departments d ON e.department_id = d.department_id

WHERE 
    l.city = (SELECT l2.city 
              FROM employees e2
              JOIN departments d2 ON e2.department_id = d2.department_id
              JOIN locations l2 ON d2.location_id = l2.location_id
              WHERE e2.first_name = 'Trenna')
ORDER BY 
    e.last_name, e.first_name;


13--Display the name of the employee whose salary is the lowest--
select min(salary) as lowest from hr

14--Display the names of all employees except the lowest paid--

select concat(first_name,'_',last_name) as "name" from hr  
where salary > (select min(salary) as lowest from hr)
