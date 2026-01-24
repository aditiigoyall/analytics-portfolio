-- =====================================
-- SELECT / WHERE / ORDER BY
-- =====================================

-- Display only the first name and country of all customers.
SELECT first_name,
country
FROM Customers;

-- Find customers whose age is less than 30.
SELECT *
FROM Customers
WHERE age < 30;

-- Display customers whose country is either USA or UK.
SELECT *
FROM Customers 
WHERE country IN ('USA', 'UK');

-- Show all customers ordered by first name alphabetically.
SELECT *
FROM Customers 
ORDER BY first_name ASC;

-- Display customers whose age is NOT NULL.
SELECT * 
FROM Customers
WHERE age IS NOT NULL;

-- Display the first name, last name, and country of all customers who live in the USA.
SELECT first_name,
last_name,
country
FROM Customers
WHERE country = 'USA';

-- Find all customers whose age is greater than 25.
SELECT customer_id,
first_name,
age
FROM Customers
WHERE age > 25;

-- List all customers ordered by age in descending order.
SELECT customer_id,
first_name,
age
FROM Customers
ORDER BY age desc;
