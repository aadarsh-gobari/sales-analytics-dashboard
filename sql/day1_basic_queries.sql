-- Total orders
SELECT COUNT(order_id) AS total_orders
FROM sales;

-- Total sales
SELECT ROUND(SUM(sales), 2) AS total_sales
FROM sales;

-- Total profit
SELECT ROUND(SUM(profit), 2) AS total_profit
FROM sales;

-- Sales by region
SELECT region, ROUND(SUM(sales), 2) AS sales
FROM sales
GROUP BY region
ORDER BY sales DESC;

-- Profit by category
SELECT product_category, ROUND(SUM(profit), 2) AS profit
FROM sales
GROUP BY product_category
ORDER BY profit DESC;
