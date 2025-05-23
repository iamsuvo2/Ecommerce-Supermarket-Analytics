-- 1. View all records in the `supermarket_sales` table
SELECT *
FROM supermarket_sales;

-- 2. Best-selling product lines by revenue
SELECT 
    `Product line`, 
    SUM(Sales) AS total_revenue
FROM 
    supermarket_sales
GROUP BY 
    `Product line`
ORDER BY 
    total_revenue DESC;

-- 3. Quantity sold per product line
SELECT `product line`, 
       SUM(Quantity) AS total_quantity_sold
FROM supermarket_sales
GROUP BY `product line`
ORDER BY total_quantity_sold DESC;

-- 4. Gross margin per product
SELECT `product line`,
       (SUM(sales) - SUM(cogs)) AS Gross_Margin
FROM supermarket_sales
GROUP BY `Product line`;

-- 5. Price sensitivity (avg unit price vs quantity sold)
SELECT 
    ROUND(AVG(`unit price`), 2) AS avg_unit_price,
    SUM(quantity) AS total_quantity_sold
FROM supermarket_sales;
