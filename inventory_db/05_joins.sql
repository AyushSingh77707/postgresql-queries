-- Q1: Fetch all orders along with the name of the user who placed them
SELECT t1.id,t2.name
FROM orders t1
INNER JOIN
users t2 
ON t1.user_id=t2.id;

-- Q2: Fetch all order items along with the product name and category
SELECT t1.id,t2.name,t2.category
FROM order_items t1 
INNER JOIN products t2 
ON t1.product_id=t2.id;

-- Q3: Fetch all users and their orders — including users who have placed no orders

SELECT t1.name,t2.id
FROM users t1 
LEFT JOIN 
orders t2 
ON t1.id=t2.user_id;

-- Q4:  Fetch complete order details — user name, order id, product name, quantity, price
SELECT
t1.name AS "user name",
t2.id AS "order id",
t4.name AS "product name",
t3.quantity,t3.price 
FROM users t1 INNER JOIN orders t2 
ON t1.id=t2.user_id 
INNER JOIN order_items t3
ON t2.id=t3.order_id
INNER JOIN products t4
ON t4.id=t3.product_id;

-- Q5:  Find total amount spent by each user — show user name and total spend
SELECT t1.name AS "user name",
SUM(t2.total_amount) AS "total amount"
FROM users t1 
INNER JOIN orders t2 
ON t1.id=t2.user_id
GROUP BY t1.name;

-- Q6:  Find how many distinct products are in each order — show order id and product count
SELECT 
t1.id AS order_id,
COUNT(t2.product_id) AS product_count
FROM orders t1
INNER JOIN order_items t2 ON t1.id = t2.order_id
GROUP BY t1.id;

-- Q7 Find all products that have never been ordered
SELECT t1.id, t1.name
FROM products t1
LEFT JOIN order_items t2 ON t1.id = t2.product_id
WHERE t2.product_id IS NULL;


