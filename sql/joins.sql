-- =====================================
-- JOINs
-- =====================================

-- Display customer name along with order amount only.
SELECT c.first_name,
c.last_name,
o.amount
FROM Customers as c
INNER JOIN Orders as o
ON c.customer_id = o.customer_id;

-- Show order item and amount along with the customer’s country.
SELECT o.item,
o.amount,
c.country
FROM Orders o
INNER JOIN Customers c
ON o.customer_id = c.customer_id;

-- Display all orders and the customer name who placed them.
SELECT c.first_name,
c.last_name,
o.item,
o.amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

-- Show customers and their shipping status, including customers who don’t have shipping records.
SELECT c.customer_id,
c.first_name,
s.status
FROM Customers c
LEFT JOIN Shippings s
ON c.customer_id = s.customer;

-- Display customer name and item only for customers whose shipping status is Delivered.
SELECT c.first_name,
c.last_name,
o.item
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Shippings s
ON c.customer_id = s.customer
WHERE s.status = 'Delivered';

-- Display customer first name, item, and amount for all customers who have placed an order.
SELECT c.first_name,
o.item,
o.amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

-- Show all customers and their order items, including customers who have not placed any orders.
SELECT c.first_name,
o.item
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;

-- List the names of customers whose shipping status is 'Pending'.
SELECT c.customer_id,
c.first_name
FROM Customers c
INNER JOIN Shippings s
ON c.customer_id = s.customer
WHERE s.status = 'Pending';

-- Find customers who have placed an order for an item priced above 300.
SELECT c.customer_id,
c.first_name,
o.amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 300;

-- Find customers whose customer_id appears in the Orders table.
SELECT DISTINCT c.customer_id,
c.first_name
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Find customers whose customer_id does NOT appear in the Orders table.
SELECT c.customer_id,
c.first_name
FROM Customers c
LEFT JOIN Orders o 
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
