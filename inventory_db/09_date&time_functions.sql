-- Q1: Fetch all orders showing only the date part — without time
SELECT * ,
created_at::date FROM orders;

-- Q2: Show how many days ago each order was placed
SELECT *,
AGE(NOW(),created_at) AS order_placed_days_ago
FROM orders;

-- Q3: Fetch all orders placed in the month of April
SELECT *,
EXTRACT(MONTH FROM created_at)
FROM orders
WHERE EXTRACT(MONTH FROM created_at)=4;

-- Q4: Fetch all orders and show only the hour they were placed
SELECT *,
EXTRACT(HOUR FROM created_at) AS hours
FROM orders;

-- Q5: Show each product's name and how many days since it was last updated
SELECT name,
AGE(NOW(),updated_at)
FROM products;

-- Q6: Fetch all users grouped by the month they registered — show month and user count
SELECT 
DATE_TRUNC('Month',created_at),
COUNT(*)
FROM users
GROUP BY 1;

-- Q7: Show each order's created_at in YYYY-MM-DD HH:MM format
SELECT *,
TO_CHAR(created_at,'YYYY-MM-DD HH24:MI')
FROM orders;