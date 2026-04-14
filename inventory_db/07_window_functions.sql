-- Q1: Rank all products by price within each category
SELECT name,category,price,
RANK() 
OVER(PARTITION BY category ORDER BY price DESC)
FROM products;

-- Q2: Assign a row number to each order per user ordered by created_at
SELECT *,
ROW_NUMBER() OVER(PARTITION BY user_id)
FROM orders;

-- Q3: Show each product name, price and running total of price within its category
SELECT name,price,category,
SUM(price) OVER w AS running_total
FROM products
WINDOW w AS 
(PARTITION BY category ORDER BY price  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) ;

-- Q4: Show each product name, its price and the average price of its category side by side
SELECT name,category,price,
AVG(price) OVER(PARTITION BY Category) AS average_price_of_category
FROM products;

-- Q5: Show each order along with the previous order amount of the same user
SELECT *,
LAG(total_amount)
OVER(PARTITION BY user_id) AS prevoius_order_amount_by_user
FROM orders;

-- Q6: Show each order along with the next order amount of the same user
SELECT *,
LEAD(total_amount)
OVER(PARTITION BY user_id) AS next_order_amount_by_user
FROM orders;

-- Q7: Show the name of the cheapest product in every row within each category
SELECT * ,
LAST_VALUE(name) OVER(PARTITION BY category ORDER BY price DESC
					  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM products;

-- Q8: Show the name of the most expensive product in every row within each category
SELECT * ,
FIRST_VALUE(name) OVER(PARTITION BY category ORDER BY price DESC
					  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM products;


-- Q9: Find top 2 customers spendings most per month
SELECT * FROM
(SELECT user_id,
SUM(total_amount)AS total_spent,
TO_CHAR(created_at,'Month') AS month,
RANK() OVER(ORDER BY SUM(total_amount) DESC) 
FROM orders
GROUP BY user_id,month) t1
WHERE t1.rank<=2;

-- Q10: Find top 3 products in each category along with their price and name
SELECT * FROM 
(SELECT *,
FIRST_VALUE(price) OVER(PARTITION BY category ORDER BY price DESC 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS expensive_product_price,
FIRST_VALUE(name) OVER(PARTITION BY category ORDER BY price DESC 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS expensive_product_name
FROM products) t
WHERE t.name=t.expensive_product_name AND t.price=t.expensive_product_price;