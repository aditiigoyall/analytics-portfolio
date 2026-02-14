-- DIMENSION EXPLORATION

SELECT TOP 3 * FROM gold.dim_customers;
SELECT TOP 3 * FROM gold.dim_products;
SELECT TOP 3 * FROM gold.fact_sales;

-- Explore all Countries our customers come from.
SELECT DISTINCT country FROM gold.dim_customers;

-- Explore all Categories "The major Divisions"
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3
