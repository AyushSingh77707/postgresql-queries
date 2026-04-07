-- Q1: Fetch distinct categories in product
SELECT DISTINCT category FROM products;

-- Q2: Fetch every product and their prices and keep alias of price as "Product Price" and name as "Product Name"
SELECT name AS "Product Name",
price AS "Product Price" 
FROM products;

-- Q3: Fetch distinct roles exists in user table
SELECT DISTINCT role FROM users;

-- Q4: Fetch those products details whose description is null
SELECT * from products
WHERE description IS NULL;

-- Q5: Show no description using COALESCE of those product whose description is empty
SELECT name,
COALESCE(description,'No description available')
FROM products;
 
