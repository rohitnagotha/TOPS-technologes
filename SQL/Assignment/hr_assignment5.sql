CREATE DATABASE HR_5;
USE HR_5;


create table employee
(emp_id int  primary key not null,
first_name char(30),
last_name char(30),
job_id varchar(30),
salary int,
bonus int,
manager_id int,
department_id int,
department_name char(30),
city char(30),
manager_name char(30),
stat_name varchar (20),
location_id int,
vendor_name char(30),
category char(50),
sub_category varchar(50),
product char(50),
order_id int,
adress varchar,
price int,
vendor_id int,
subcategory_id int);
 
 drop table employee;



 
select * from employee;
-- Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus--

select emp_id,first_name,last_name from employee as e
join bonus as b 
on e.emp_id = b.emp_id
where e.department = 'sales'and b.bonus = 2000;

select emp_i,first_name last_name from employee
where department_name = 'sales'

--Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A--

select first_name,last_name,COALESCE(adress,'NA') from employee
where stat_name ='ca'

--Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product--

select order_id,product from employee

--Find the subcategories that have at least two different prices less than $15--

select sub_category  from employee
where price <15
group by sub_category
having (count distinct price)>=2;

--Write a query to display employees and their manager details. Fetch employee id, 
employee first name, and manager id, manager name--

select emp_id, 
first_name,
manager_name,
manager_id from employee;

--Display the employee id and employee name of employees who do not have manager--

select emp_id,first_name from employee
where manager_name is  null;

--Display the names of all products of a particular subcategory 15 and the names of their 
vendors--

select p.product,v.vendor_name from employee
join vendor_name v on p.vendor_id= v.vendor_id
where p.subcategory_id = 15;

--Find the products that have more than one vendor--

select product from employee
where vendor_id >1;



