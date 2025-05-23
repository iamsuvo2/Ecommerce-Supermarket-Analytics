-- 1. View all records in the `supermarket_sales` table
SELECT *
FROM supermarket_sales;
-- 1. Daily Sales Trend
SELECT Date, ROUND(SUM(Sales), 2) AS Total_Sales
FROM supermarket_sales
GROUP BY Date
ORDER BY Date;
-- 2. Monthly Sales Trend
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, ROUND(SUM(Sales), 2) AS Total_Sales
FROM supermarket_sales
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY Month;
-- Revenue by Time Slot (Morning, Afternoon, Evening)
SELECT 
    CASE 
        WHEN HOUR(Time) < 12 THEN 'Morning'
        WHEN HOUR(Time) >= 12 AND HOUR(Time) < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Time_Slot, 
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM supermarket_sales
GROUP BY Time_Slot
ORDER BY Time_Slot;
-- Peak Hour of Sale
SELECT 
    `hour` AS Hour, 
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM supermarket_sales
GROUP BY `hour`
ORDER BY Total_Revenue DESC
LIMIT 5;
-- Weekday vs Weekend Revenue
SELECT 
    CASE 
        WHEN DAYOFWEEK(Date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type, 
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM supermarket_sales
GROUP BY Day_Type
ORDER BY Day_Type;
