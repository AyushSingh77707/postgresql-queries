-- Q1: calculate no of products per category
SELECT category,COUNT(*)
AS no_of_products
FROM products
GROUP BY category;

-- Q2: Find average price of each category
SELECT category,ROUND(AVG(price),2)
AS average_price
FROM products
GROUP BY category;

-- Q3: Find number of orders placed by each user id
SELECT user_id,COUNT(id)
FROM orders
GROUP BY user_id;

-- Q4: Fetch only those categories having more than 4 products
SELECT category,COUNT(*)
AS no_of_products
FROM products
GROUP BY category
HAVING COUNT(*)>4;

-- Q5: find number of users in each role
SELECT role,COUNT(*) AS "no of users"
FROM users
GROUP BY role;

-- Q6: find no of quantity of items in each order id
SELECT order_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY order_id;

-- Q7: Fetch those orders having quantity greater than 5
SELECT order_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY order_id
HAVING SUM(quantity) > 5;