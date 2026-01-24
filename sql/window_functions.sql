-- =====================================
-- WINDOW FUNCTIONS 
-- =====================================

-- Assign a row number to customers ordered by age.
SELECT customer_id,
first_name,
age,
ROW_NUMBER() OVER (ORDER BY age) as row_number
FROM Customers;

-- Rank orders based on order amount (highest first).
SELECT order_id,
item,
amount,
RANK() OVER (ORDER BY amount desc) as rank
FROM Orders;

-- Display each order with its rank based on amount.
SELECT order_id,
item,
amount,
DENSE_RANK() OVER (ORDER BY amount desc) as dense_rank
FROM Orders;

-- Assign row numbers to orders partitioned by customer_id.
SELECT *,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY amount desc) as row_number
FROM Orders;

-- Show each order and the highest order amount overall using a window function.
SELECT order_id,
item,
amount,
MAX(amount) OVER () as highest_order_amount
FROM Orders;

-- Find the highest order for each customer.
SELECT c.customer_id,
c.first_name,
o.amount,
MAX(amount) OVER (PARTITION BY c.customer_id) as highest_order
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

-- Rank customers based on total order amount.
SELECT c.customer_id,
c.first_name,
SUM(o.amount) as total_amount,
RANK() OVER (ORDER BY SUM(o.amount) desc) as rank
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name;

-- Show each order with the average order amount.
SELECT order_id,
item,
amount,
AVG(amount) OVER () as avg_amount
FROM Orders;

-- Rank customers based on their total order amount (highest spender gets rank 1).
SELECT c.customer_id,
c.first_name,
SUM(o.amount) as total_amount,
RANK() OVER (ORDER BY SUM(o.amount) desc) as rank
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
