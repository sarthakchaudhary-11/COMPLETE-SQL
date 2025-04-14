-- COMMON TABLE EXPRESSION
-- Find Top 3 Highest Paid Employees in Each Department
-- using window function 
SELECT *
FROM (
    SELECT 
        first_name, 
        department, 
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS top_paid_employees
    FROM employees
) AS ranked_employees
WHERE top_paid_employees < 4;


-- CTE --> Common Table Expression
-- CTE is temporary result set that you can reference within a sql query.
-- It improves the code readability and avoid subquery repetition 
-- WITH cte_name AS (
--    SELECT ...
--    FROM ...
--    WHERE ...)
-- SELECT * 
-- FROM cte_name
-- WHERE ...;

WITH ranked_employees AS (
    SELECT 
        first_name, 
        department, 
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS top_paid_employees
    FROM employees
)

SELECT * 
FROM ranked_employees
WHERE top_paid_employees < 4;

-- FIND EMPLOYEES HAVING SALARY ABOVE AVERAGE
select first_name  , department , salary
from employees
where salary > (select avg(salary) from employees);

-- USING CTE
with avg_salary as (
select avg(salary) as av_salary
from employees
where salary > av_salary
)
select first_name , department , salary
from employees;

-- 1. Create a Table: sales 
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100),
    region VARCHAR(50),
    month VARCHAR(20),
    revenue INT
);
-- 2. Insert Sample Data
INSERT INTO sales (employee_name, region, month, revenue) VALUES
('Amit', 'North', 'January', 5000),
('Amit', 'North', 'February', 6000),
('Riya', 'South', 'January', 4000),
('Riya', 'South', 'February', 4500),
('Raj', 'North', 'January', 5500),
('Raj', 'North', 'February', 5200),
('Sneha', 'West', 'January', 3000),
('Sneha', 'West', 'February', 3500);

SELECT * FROM SALES;

-- 3. Practice CTEs
-- A. Total Revenue per Employee
WITH EMPLOYEE_REVENUE AS(
SELECT employee_name , SUM(revenue) AS TOTAL_REVENUE
FROM SALES
GROUP BY EMPLOYEE_NAME
)
SELECT * 
FROM SALES
ORDER BY REVENUE DESC;

-- B. Top Performer per Region (Using Window Function in CTE)
WITH SALES_RANK AS (
SELECT employee_name , region , sum(revenue) as total_revenue,
rank() over (partition by region order by sum(revenue) desc) as rank_in_region
from sales
group by employee_name , region
)
select *
from sales_rank
where rank_in_region = 1;

-- C. Monthly Average Revenue and Compare Employee Revenue
WITH monthly_avg AS (
    SELECT month, AVG(revenue) AS avg_revenue
    FROM sales
    GROUP BY month
)
SELECT s.employee_name, s.month, s.revenue, m.avg_revenue
FROM sales s
JOIN monthly_avg m ON s.month = m.month
WHERE s.revenue > m.avg_revenue;


