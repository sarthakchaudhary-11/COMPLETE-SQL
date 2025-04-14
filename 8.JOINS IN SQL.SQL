use join_practice;

select * from customers;
select * from orders;

-- Inner Join
-- Returns only the matching rows from both tables.
-- Shows only customers who placed orders.
SELECT 
    customers.name,
    customers.city,
    orders.AMOUNT
FROM customers
INNER JOIN orders
 ON customers.customer_id = orders.customer_id;

-- 🔙 2. LEFT JOIN (or LEFT OUTER JOIN)
-- Returns all rows from the left table (Customers), and matched rows from the right table (Orders). If no match, returns NULL.
SELECT 
   customers.name,
   customers.city,
   orders.AMOUNT
FROM customers
   left join orders 
   on customers.CUSTOMER_ID= orders.CUSTOMER_ID;
   
-- 🔜 3. RIGHT JOIN (or RIGHT OUTER JOIN)
-- Returns all rows from the right table (Orders), and matched rows from the left table (Customers). If no match, returns NULL.
select 
   customers.name,
   customers.city,
   orders.ORDER_DATE,
   orders.amount
from customers
   right join orders 
   on customers.customer_id  = orders.customer_id;
   
-- 🌐 4. FULL OUTER JOIN (MySQL doesn’t support it directly)
-- Returns all rows from both tables. If there is no match, NULLs are returned.
SELECT Customers.name, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id

UNION

SELECT Customers.name, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 🎲 5. CROSS JOIN
-- Returns every combination of rows from both tables (cartesian product).
SELECT Customers.name,
customers.city,
Orders.order_id
FROM Customers
CROSS JOIN Orders;


   

