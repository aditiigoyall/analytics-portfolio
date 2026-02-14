-- RANKING ANALYSIS

SELECT TOP 3 * FROM gold.dim_customers;
SELECT TOP 3 * FROM gold.dim_products;
SELECT TOP 3 * FROM gold.fact_sales;

-- Which 5 products generate the highest revenue?
SELECT TOP 5
p.product_name,
SUM(s.sales_amount) as total_revenue
FROM gold.dim_products p
JOIN gold.fact_sales s
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue desc;

-- What are the 5 worst-performing products in terms of sales?	
SELECT TOP 5
p.product_name,
SUM(s.sales_amount) as total_revenue
FROM gold.dim_products p
JOIN gold.fact_sales s
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-- Find the top 10 customers who have generated the highest revenue.
SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name, 
SUM(s.sales_amount) as total_revenue
FROM gold.dim_customers c
JOIN gold.fact_sales s
ON c.customer_key = s.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue desc;

-- The 3 customers with the fewest orders placed
SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name, 
COUNT(DISTINCT s.order_number) as total_orders
FROM gold.dim_customers c
JOIN gold.fact_sales s
ON c.customer_key = s.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders;
