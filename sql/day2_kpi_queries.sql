USE sales_db;

-- Total Sales, Profit & Orders (CORE KPI)
SELECT
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales;

-- Sales & Profit by Region
SELECT
    `Region`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Region`
ORDER BY total_sales DESC;

-- Sales & Profit by Category
SELECT
    `Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Category`
ORDER BY total_profit DESC;

-- Sales & Profit by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;

-- Monthly Sales & Profit Trend (POWER BI FAVORITE)
SELECT
    YEAR(`Order Date`) AS year,
    MONTH(`Order Date`) AS month,
    ROUND(SUM(`Sales`), 2) AS monthly_sales,
    ROUND(SUM(`Profit`), 2) AS monthly_profit
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- Year-Wise Sales Trend
SELECT
    YEAR(`Order Date`) AS year,
    ROUND(SUM(`Sales`), 2) AS yearly_sales,
    ROUND(SUM(`Profit`), 2) AS yearly_profit
FROM sales
GROUP BY year
ORDER BY year;

-- Top 10 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Discount Impact Analysis
SELECT
    `Discount`,
    COUNT(DISTINCT `Order ID`) AS orders,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Discount`
ORDER BY `Discount`;

-- Region & Category Performance
SELECT
    `Region`,
    `Category`,
    ROUND(SUM(`Sales`), 2) AS sales,
    ROUND(SUM(`Profit`), 2) AS profit
FROM sales
GROUP BY `Region`, `Category`
ORDER BY `Region`, profit DESC;
