-- Q1: Fetch all products whose price is greater than the average price of all products
SELECT * FROM products
WHERE price >(SELECT AVG(price) FROM products);

-- Q2: Fetch all users who have placed at least one order
SELECT * FROM users
WHERE id IN (SELECT user_id FROM orders);

-- Q3: Fetch all users who have never placed any order
SELECT * FROM users
WHERE id NOT IN (SELECT user_id FROM orders);

-- Q4: Fetch the order details which contains the most expensive product
SELECT * FROM order_items
WHERE product_id=(SELECT id FROM products 
 				  WHERE price=(SELECT MAX(price) FROM products));

-- Q5: Fetch the most expensive product from each category
SELECT category,name,price FROM products t1
WHERE price = (
    SELECT MAX(price) FROM products 
    WHERE category = t1.category
);

