create database company;

create table worker(
	worker_id int not null,
	first_name char(50),
	last_name char(50),
	salary int,
	joining_date date,
	department char(50)
);

drop table worker 
	
insert into worker
values
(1,'monika','arora',100000,'2014-02-20','HR'),
(2,'niharika','verma',80000,'2014-06-11','Admin'),
(1,'vishal','singhal',300000,'2014-02-20','HR'),
(1,'amitabh','singh',500000,'2014-02-20','Admin'),
(1,'vivek','bhati',500000,'2014-06-11','Admin'),
(1,'vipul','diwan',200000,'2014-06-11','Account'),
(1,'satish','kumar',75000,'2014-01-20','Account'),
(1,'geetika','chauhan',90000,'2014-04-11','Admin');

select * from worker

--Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME
Ascending and DEPARTMENT Descending--

select *from worker
order by first_name asc,department desc


--Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
from the Worker table.--

select * from worker
where first_name in ('vipul','satish')

--Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
contains six alphabets--

select first_name,last_name from worker
where first_name like '_____h'; 

--Write an SQL query to print details of the Workers whose SALARY lies between 1.--

select * from worker
where salary >=1;

--Write an SQL query to fetch duplicate records having matching data in some fields of a table.--

select  first_name,last_name,count(*) from worker
group by  first_name,last_name,
having count(*)>1

--Write an SQL query to show the top 6 records of a table---

select * from worker
limit 6;

---Write an SQL query to fetch the departments that have less than five people in them--

select department,count(*) as num_of_emp from worker
group by department
having count(*) <5;

--Write an SQL query to show all departments along with the number of people in there--


select department,count(*) as num_of_emp from worker
group by department

-- Write an SQL query to print the name of employees having the highest salary in each
department-

with high_salary as (
	select first_name,last_name,salary,department,
	row_number() over (partition by department order by salary desc ) as rn from worker)
	
select first_name,last_name,salary,department from high_salary 
where rn =1;

create table student(
	stdid int,
	std_name char(50),
	sex char(10),
	percentage int,
	class int,
	sec varchar(5),
	stream char(30),
	dob date
);
drop table student
	
insert into student
values
(1001,'sureha joshi','female',82,12,'A','science','1998-08-03'),
(1002,'maahi agarwal','female',56,11,'C','commerce','2008-11-23'),
(1003,'sanam verma','male',59,11,'C','science','2006-06-28'),
(1004,'ronit kumar','male',63,11,'C','commerce','1997-05-11'),
(1005,'dipesh pulki','male',78,11,'B','science','2003-09-14'),
(1006,'jahanvi puri','female',60,11,'B','commerce','2008-07-11'),
(1007,'sanam kumar','male',23,12,'F','commerce','1998-08-03'),
(1008,'sahil saras','male',56,11,'C','commerce','2008-07-11'),
(1009,'akshra aagrwal','female',72,12,'B','commerce','1996-01-10'),
(1010,'stuti mishra','female',39,11,'F','science','2008-11-23'),
(1011,'harsh agarwal','male',42,11,'C','science','1998-08-03'),
(1012,'nikunj agarwal','male',49,12,'C','commerce','1998-06-28'),
(1013,'akriti saxena','female',89,12,'A','science','2008-11-23'),
(1014,'tani rastogi','female',82,12,'A','science','2008-11-23');

--To display all the records form STUDENT table--
select * from student

--To display any name and date of birth from the table STUDENT--

select std_name,dob from student

--To display all students record where percentage is greater of equal to 80 FROM student table--
	
select * from student
where percentage >=80

--To display student name, stream and percentage where percentage of student is more than 80--
	
select std_name,stream,percentage from student
where percentage >80


--To display all records of science students whose percentage is more than 75 form student table--

select * from student
where stream = 'science' and percentage >75

