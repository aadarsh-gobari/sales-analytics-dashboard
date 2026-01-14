
USE sales_db;
LOAD DATA LOCAL INFILE 'C:/temp/Sample_Superstore.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
`Row ID`,
`Order ID`,
@order_date,
@ship_date,
`Ship Mode`,
`Customer ID`,
`Customer Name`,
`Segment`,
`Country`,
`City`,
`State`,
`Postal Code`,
`Region`,
`Product ID`,
`Category`,
`Sub-Category`,
`Product Name`,
`Sales`,
`Quantity`,
`Discount`,
`Profit`
)
SET
`Order Date` = STR_TO_DATE(@order_date, '%m/%d/%Y'),
`Ship Date`  = STR_TO_DATE(@ship_date, '%m/%d/%Y');


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
#Total Sales, Profit & Orders (CORE KPI)
SELECT
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales;

#Sales & Profit by Region
SELECT
    `Region`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Region`
ORDER BY total_sales DESC;

#Sales & Profit by Category
SELECT
    `Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Category`
ORDER BY total_profit DESC;

#Sales & Profit by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM sales
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;
