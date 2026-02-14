-- DATE EXPLORATION

SELECT TOP 3 * FROM gold.dim_customers;
SELECT TOP 3 * FROM gold.dim_products;
SELECT TOP 3 * FROM gold.fact_sales;

-- Find the date of the first and last order.
-- How many years of sales are available.
SELECT 
MIN(order_date) as first_order_date,
MAX(order_date) as last_order_date,
DATEDIFF(year, MIN(order_date), MAX(order_date)) as order_range_years
FROM gold.fact_sales;

-- Find the youngest and the oldest customer
SELECT
MIN(birthdate) as oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) as oldest_age,
MAX(birthdate) as youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) as oldest_age
FROM gold.dim_customers;


