-- =====================================
-- SUBQUERIES
-- =====================================

-- Find customers whose age is less than the maximum age.
SELECT customer_id,
first_name,
age
FROM Customers 
WHERE age < (SELECT MAX(age) FROM Customers);

-- Find orders whose amount is less than the highest order amount.
SELECT order_id,
item,
amount
FROM Orders
WHERE amount < (SELECT MAX(amount) FROM Orders);

-- Find customers whose order amount is higher than the average order amount.
SELECT c.customer_id,
c.first_name,
o.amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
WHERE amount > (SELECT AVG(amount) FROM Orders);
