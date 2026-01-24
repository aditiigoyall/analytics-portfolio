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

