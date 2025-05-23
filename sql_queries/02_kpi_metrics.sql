-- 1. View all records in the `supermarket_sales` table
SELECT *
FROM supermarket_sales;

-- 2. Calculate Total Revenue
SELECT
    SUM(sales) AS total_revenue
FROM supermarket_sales;

-- 3. Calculate Total Quantity Sold
SELECT
    SUM(quantity) AS total_quantity_sold
FROM supermarket_sales;

-- 4. Calculate Gross Margin (Total tax collected)
SELECT 
    (SUM(`Tax 5%`) * SUM(Quantity)) AS total_gross_margin
FROM supermarket_sales;

-- 5. Show the columns in the `supermarket_sales` table
SHOW COLUMNS FROM supermarket_sales;

-- 6. Rename the column `ï»¿Invoice ID` to `Invoice_ID`
ALTER TABLE supermarket_sales
CHANGE COLUMN `ï»¿Invoice ID` `Invoice_ID` VARCHAR(20);

-- 7. Calculate Average Sales per Transaction
SELECT 
    ROUND(SUM(Sales) / COUNT(DISTINCT invoice_id), 2) AS avg_sales_per_transaction
FROM supermarket_sales;

-- 8. Calculate Revenue by Branch
SELECT Branch, 
       SUM(Sales) AS Branch_Revenue
FROM supermarket_sales
GROUP BY Branch;

-- 9. Calculate Revenue by Product Line
SELECT `product line`, 
       SUM(sales)
FROM supermarket_sales
GROUP BY `product line`;

-- 10. Calculate Payment Method Share
SELECT Payment, 
       COUNT(Payment) AS Payment_Method_Count,
       (COUNT(Payment) / (SELECT COUNT(*) FROM supermarket_sales)) * 100 AS Payment_Method_Share_Percentage
FROM supermarket_sales
GROUP BY Payment;