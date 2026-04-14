-- Q1: Fetch all user names in uppercase
SELECT 
UPPER(name)
FROM users;

-- Q2: Fetch all product names in lowercase
SELECT 
LOWER(name)
FROM products;

-- Q3: Fetch the username part from email — everything before '@'
SELECT
SPLIT_PART(email,'@',1)
FROM users;

-- Q4: Show product name and category combined like "Samsung s24 (electronics)"
SELECT 
CONCAT_WS(',',name,category)
FROM products;

-- Q5: Find the product with the longest name
SELECT 
name
FROM products
ORDER BY LENGTH(name) DESC
LIMIT 1;

-- Q6: Fetch all products whose name has exactly 5 characters
SELECT * 
FROM products
WHERE LENGTH(name)=5;

-- Q8: Replace word 'popular' with 'famous' in product descriptions
SELECT description,
REPLACE(description,'popular','famous') AS replaced_description
FROM products;