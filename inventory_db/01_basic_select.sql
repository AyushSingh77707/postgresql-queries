-- Q1: Fetch all users in database
SELECT * FROM users;

-- Q2: Fetch only name and prices of all the products
SELECT name,price FROM products;

-- Q3: Fetch only electronics category product
SELECT * FROM products
WHERE category='electronics';

-- Q4: Fetch products whose price are greater than 10000
SELECT * FROM products
WHERE price>10000;

-- Q5: Fetch only those users whose role is customer
SELECT * FROM users
WHERE role='customer';

-- Q6: Fetch those products that are not active and their stock quantity is less than 50
SELECT * FROM products
WHERE is_active=false
AND
stock_quantity<50;

-- Q7: Fetch those orders whose total amount is betwen 1000 and 100000
SELECT * FROM orders
WHERE total_amount
BETWEEN
1000 AND 100000;

-- Q8: Fetch those product details whose name starts with 's'
SELECT * FROM products
WHERE name 
ILIKE 's%';

-- Q9: Fetch those users whose email ends with '@gmail.com'
SELECT * FROM users
WHERE email LIKE 
'%@gmail.com';

-- Q10: Fetch top 5 expensive products with their prices in product data
SELECT name,price FROM products
ORDER BY price DESC
LIMIT 5;



