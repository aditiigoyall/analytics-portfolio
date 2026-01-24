-- =====================================
-- GROUP BY / AGGREGATES
-- =====================================

-- Find the total number of orders in the Orders table.
SELECT
COUNT(*) as total_orders
FROM Orders;

-- Find the average order amount.
SELECT 
AVG(amount) as avg_amount
FROM Orders;

-- Display each country and the number of customers in that country.
SELECT country,
COUNT(customer_id) as total_customers
FROM Customers
GROUP BY country;

-- Find the minimum order amount placed by any customer.
SELECT 
MIN(amount) as min_amount
FROM Orders;

-- Display customer ID and the sum of all their order amounts (no filtering).
SELECT customer_id,
SUM(amount) as total_amount 
FROM Orders
GROUP BY Customer_id;

-- Find the total order amount spent by each customer.
SELECT c.customer_id,
c.first_name,
c.last_name,
SUM(o.amount) as total_amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Display customers whose total order amount is greater than 500.	
SELECT c.customer_id,
c.first_name,
c.last_name,
SUM(o.amount) as total_amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(o.amount) > 500;
