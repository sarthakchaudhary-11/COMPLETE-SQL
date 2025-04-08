-- NUMERIC FUNCTION

-- Numeric functions allows us to perform mathematical operations
-- 🔢 Common Numeric Functions in SQL
-- Function	Description:-
-- ABS(x)	Returns the absolute (positive) value of x.
-- CEIL(x) / CEILING(x)	Rounds x up to the nearest integer.
-- FLOOR(x)	Rounds x down to the nearest integer.
-- ROUND(x, d)	Rounds x to d decimal places. If d is 0, rounds to nearest integer.
-- POWER(x, y)	Returns x raised to the power y (x^y).
-- SQRT(x)	Returns the square root of x.
-- MOD(x, y)	Returns the remainder of x divided by y.
-- EXP(x)	Returns e raised to the power of x.
-- LOG(x)	Returns the natural logarithm (base e) of x.
-- LOG10(x)	Returns the base-10 logarithm of x.
-- SIGN(x)	Returns the sign of x: -1 (negative), 0 (zero), or 1 (positive).
-- RAND()	Returns a random float number between 0 and 1. (May differ slightly by DBMS.)
-- TRUNCATE(x, d)	Truncates x to d decimal places (available in MySQL).
-- PI()	Returns the value of π (~3.14159).

create database EMP_INFO;
USE EMP_INFO;

CREATE TABLE employeesemployees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    department VARCHAR(50),
    job_title VARCHAR(100),
    salary INT,
    hire_date DATE,
    email VARCHAR(100),
    phone VARCHAR(15)
);
INSERT INTO employees VALUES
(101, 'John', 'Smith', 'M', 'IT', 'Software Engineer', 75000, '2019-04-22', 'john.smith@company.com', '9876543210'),
(102, 'Sarah', 'Johnson', 'F', 'HR', 'HR Manager', 68000, '2020-01-15', 'sarah.j@company.com', '8765432109'),
(103, 'Michael', 'Brown', 'M', 'Finance', 'Financial Analyst', 72000, '2018-07-11', 'michael.b@company.com', '7654321098'),
(104, 'Emily', 'Davis', 'F', 'Marketing', 'Marketing Executive', 62000, '2021-06-30', 'emily.d@company.com', '6543210987'),
(105, 'David', 'Wilson', 'M', 'IT', 'DevOps Engineer', 80000, '2022-03-25', 'david.w@company.com', '5432109876'),
(106, 'Olivia', 'Garcia', 'F', 'Sales', 'Sales Representative', 61000, '2023-02-10', 'olivia.g@company.com', '4321098765'),
(107, 'James', 'Martinez', 'M', 'HR', 'Recruiter', 58000, '2021-12-05', 'james.m@company.com', '3210987654'),
(108, 'Sophia', 'Lee', 'F', 'Finance', 'Accountant', 67000, '2020-10-19', 'sophia.lee@company.com', '2109876543'),
(109, 'Robert', 'Walker', 'M', 'IT', 'System Administrator', 77000, '2017-08-09', 'robert.w@company.com', '1098765432'),
(110, 'Ava', 'Clark', 'F', 'Marketing', 'Social Media Manager', 65000, '2022-11-21', 'ava.clark@company.com', '9988776655');

SELECT * FROM employees;

-- Find the difference between an employee's salary and average salary.
SELECT *, ABS(SALARY - (SELECT AVG(SALARY) FROM EMPLOYEES)) AS SALARY_DIFF
FROM EMPLOYEES;

-- CEIL >>> ROUNDS UP TO THE NEAREST WHOLE NUMBER -- 7.4 = 8
-- FLOOR >>> ROUNDS DOWN TO THE PREVIOUS WHOLE NUMBER -- 7.4 = 7

-- ROUND THE EMPLOYEE's SALARY TO NEAREST THOUSAND
SELECT employee_id , first_name , salary/920 ,
ceil(salary/920) as rounded_up_ceil ,
floor(salary/920) as rounded_down_floor
from employees;

SELECT employee_id , first_name , salary/920 ,
round(salary/920,2) as rounded_up_ceil ,
round(salary/920,2)  as rounded_down_floor
from employees;

-- MOD(x, y)	Returns the remainder of x divided by y.
-- check which employee have salary multiple of 5000
select employee_id , salary ,
mod(salary,5000) as remainder
from employees
where mod(salary,5000) =0;

-- calculate square of salary 
select employee_id,salary,
power(salary,2) as squared_salary
from employees;

-- CALCULATE SQRT OF EACH SALARY
select employee_id,salary,
SQRT(salary) as square_root
from employees;

-- TRUNCATE >> TO REMOVE DECIMAL PLACES 
SELECT employee_id , salary/901 , 
truncate(salary/901,0) as truncated_salary
from employees;