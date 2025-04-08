-- WINDOWS FUNCTION 

 -- Common Window Functions:
-- Function	Description
-- ROW_NUMBER()	Assigns a unique number to each row within a partition.
-- RANK()	Gives ranks to rows in a partition with gaps.
-- DENSE_RANK()	Ranks without gaps (dense ranking).
-- NTILE(n)	Divides the result set into n buckets.
-- LEAD()	Gets the next row’s value.
-- LAG()	Gets the previous row’s value.
-- SUM()	Performs cumulative total.
-- AVG()	Running average, etc.
-- COUNT()	Row count over partition.
-- MAX() / MIN()	Gets max/min values over window.

SELECT * from employees;

-- for each department what is average salary
select department , avg(salary) as dept_avg_salary
from employees
group by department;

select *,
avg(salary) over(partition by department) as avg_salary -- partition by is sub group 
from employees; 

-- OVER IS USED TO DEFINE WINDOW SPECIFICATION

-- FIND SALARY IN DESCENDING ORDER
SELECT EMPLOYEE_ID, department, job_title, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- RANK EMPLOYEES BASED ON SALARIES
SELECT EMPLOYEE_ID, department, job_title, SALARY,
RANK() OVER(ORDER BY SALARY DESC) SAARY_RANK
FROM EMPLOYEES;

-- DENSE_RANK DO NOT SKIPS THE SEQUENCE
SELECT EMPLOYEE_ID, department, job_title, SALARY,
DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_SALARY_RANK
FROM EMPLOYEES;

-- ROW_NUMBER : ALWAYS UNIQUE NO.( NO DUPLICATE OR SAME RANK )
SELECT EMPLOYEE_ID, department, job_title, SALARY,
ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ROW_NO_RANK
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, department, job_title, SALARY,
RANK() OVER(ORDER BY SALARY DESC) AS RANK_SALARY,
ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ROW_NO_RANK,
DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_SALARY_RANK
FROM EMPLOYEES;

-- Step 1: Create the table
CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY,
    Employee VARCHAR(50),
    Region VARCHAR(50),
    Amount INT,
    Sale_Date DATE
);

-- Step 2: Insert sample data with duplicates
INSERT INTO Sales (Sale_ID, Employee, Region, Amount, Sale_Date) VALUES
(1, 'Alice',   'East',  500, '2024-01-01'),
(2, 'Bob',     'West',  700, '2024-01-03'),
(3, 'Alice',   'East',  500, '2024-01-05'),  -- duplicate Amount & Employee
(4, 'Charlie', 'East',  300, '2024-01-06'),
(5, 'Bob',     'West',  700, '2024-01-07'),  -- duplicate Amount & Employee
(6, 'Charlie', 'East',  800, '2024-01-08'),
(7, 'Alice',   'East',  300, '2024-01-09'),  -- same Amount as Charlie
(8, 'David',   'North', 900, '2024-01-10'),
(9, 'Alice',   'East',  500, '2024-01-11'),  -- same Employee + Amount
(10,'Bob',     'West',  600, '2024-01-12');


SELECT * FROM EMPLOYEES;

SELECT Sale_ID , Employee , Amount ,
RANK() OVER(ORDER BY AMOUNT DESC) AS AMOUNT_RANK,
DENSE_RANK() OVER (ORDER BY AMOUNT DESC) AS AMOUNT_DENSE_RANK,
ROW_NUMBER() OVER (ORDER BY AMOUNT DESC) AS AMOUNT_ROW_NUMBER
FROM SALES;

 -- Find Top 3 Highest Paid Employees in Each Department
 SELECT * FROM( SELECT first_name, DEPARTMENT ,salary,
 RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS TOP_PAID_EMPLOYEES
 FROM EMPLOYEES)T
 WHERE T.TOP_PAID_EMPLOYEES < 4;
    
-- HIGHEST PAID EMPLOYEE
 SELECT first_name, DEPARTMENT ,salary,
 first_value(first_name) OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS highest_paid
 FROM EMPLOYEES;
 
 -- lowest paid employee per department
SELECT first_name, DEPARTMENT ,salary,
 last_value(first_name) OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS lowest_paid
 FROM EMPLOYEES; 

-- get the 3rd highest salary in each deparment 
select first_name , department , salary , 
nth_value(SALARY,3) over (partition by department order by salary desc) as third_largest
from employees;

-- LAG
-- LEAD
-- COMPARE EACH EMPLOYEE SALARY WITH ALL EMPLOYEE IN EACH DEPARTMENT
select first_name , department , salary , 
LAG(SALARY) over (partition by department order by salary desc) as LAG_VALUE
from employees;

-- select first_name , department , salary , 
-- LEAD(SALARY) over (partition by department order by salary desc) as LEAD_VALUE

-- USE CASE >> VERY IMPORTANT TO COMPARE ANY VALUE WITH PREVIOUS OR NEXT VALUE
-- TIME SERIES DATA