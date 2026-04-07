-- Q1: Count total users of our inventory_management_api
SELECT COUNT(id)
AS total_users
FROM users;

-- Q2: Count number of products which are currently not active
SELECT COUNT(id)
AS Total_inactive_products
FROM products
WHERE is_active=false;

-- Q3: Find the most costly product in our database
SELECT name,price
FROM products
WHERE price=(SELECT MAX(price) FROM products);

-- Q4: Find the least costly product in our database
SELECT name,price
FROM products
WHERE price=(SELECT MIN(price) FROM products);

-- Q5: Find the average price of electronic category products
SELECT category, ROUND(AVG(price), 2) AS average_price
FROM products
WHERE category = 'electronics'
GROUP BY category;

-- Q6: Find total revenue driven by orders of all product
SELECT SUM(total_amount)
AS total_revenue FROM orders;

-- Q7: Find total number of items sold in order_items data
SELECT SUM(quantity) 
AS total_items_sold FROM order_items;



