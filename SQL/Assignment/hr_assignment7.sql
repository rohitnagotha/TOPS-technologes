create database hr_7;
use hr_7;

create table customer(
emp_id int primary key not null,
hire_date date,
regignation_date date);

insert into customer
(emp_id,hire_date,regignation_date)
values
(1,'2000/01/01','2013/10/07'),
(2,'2003/12/04','2017/08/03'),
(3,'2012/09/22','2015/06/21'),
(4,'2015/04/13',null),
(5,'2016/06/03',null),
(6,'2017/08/08',null),
(7,'2016/11/13',null);
 
 select * from customer;

--Find the date difference between the hire date and resignation_date for all the 
employees. Display in no. of days, months and year_1 year_3 months 5_days).
Emp_ID Hire_Date Resignation_Date--

  SELECT 
    emp_ID,
    hire_date,
    regignation_date,
    CONCAT(
        DATEDIFF(YEAR, hire_date, regignation_date) - 
        CASE 
            WHEN MONTH(hire_date) > MONTH(regignation_date) OR 
                (MONTH(hire_date) = MONTH(regignation_date) AND DAY(hire_date) > DAY(regignation_date)) 
            THEN 1 
            ELSE 0 
        END, ' years ',
        ABS(DATEDIFF(MONTH, DATEADD(YEAR, DATEDIFF(YEAR, hire_date, regignation_date), hire_date), regignation_date) 
            - CASE 
                WHEN DAY(hire_date) > DAY(regignation_date) THEN 1 
                ELSE 0 
              END), ' months ',
        DATEDIFF(DAY, 
            DATEADD(MONTH, DATEDIFF(MONTH, DATEADD(YEAR, DATEDIFF(YEAR, hire_date, regignation_date), hire_date), regignation_date), 
            DATEADD(YEAR, DATEDIFF(YEAR, hire_date, regignation_date), hire_date)), 
            regignation_date), ' days'
    ) AS difference
FROM 
    customer;

---Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)--

	select date_format( hire_Date,"%d/%m/%Y") as "hire date",  IFNULL(date_format(regignation_date,"%b %D, %X"), "DEC, 01th 1900")  as "Registration date"
from customer;

--Calcuate experience of the employee till date in Years and months(example 1 year and 3 
months)--

WITH DateDiffs AS (
    SELECT 
        emp_ID,
        hire_date,
        COALESCE(regignation_date, GETDATE()) AS End_Date,
        hire_date AS Original_Hire_Date,
        COALESCE(regignation_date, GETDATE()) AS Original_End_Date,
        DATEDIFF(YEAR, hire_date, COALESCE(regignation_date, GETDATE())) - 
        CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, hire_date, COALESCE(regignation_date, GETDATE())), hire_date) > COALESCE(regignation_date, GETDATE())
            THEN 1
            ELSE 0
        END AS years,
        DATEDIFF(MONTH, hire_date, COALESCE(regignation_date, GETDATE())) % 12 AS months
    FROM  customer
)
SELECT 
    emp_ID,
    FORMAT(Original_Hire_Date, 'MM/dd/yyyy') AS Hire_Date,
    FORMAT(Original_End_Date, 'MMM dd"th", yyyy') AS Resignation_Date,
    CONCAT(
        years, ' years and ',
        months, ' months'
    ) AS Experience
FROM 
    DateDiffs;

--Display the count of days in the previous quarter--

--Fetch the previous Quarter's second week's first day's date-- 
--Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)--
--Find out the date that corresponds to the last Saturday of January, 2015 using with 
clause--