-- 1. View all records in the `supermarket_sales` table
SELECT *
FROM supermarket_sales;

-- Which product line gives highest profit margin?
SELECT 
    `Product line`, 
    ROUND(((SUM(Sales) - SUM(cogs)) / SUM(Sales) * 100), 2) AS Gross_Profit_Margin
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY Gross_Profit_Margin DESC
LIMIT 1;
-- Which branch has most loyal customers?
SELECT 
    Branch, 
    COUNT(Invoice_ID) AS Member_Transactions
FROM supermarket_sales
WHERE `Customer type` = 'Member'
GROUP BY Branch
ORDER BY Member_Transactions DESC
LIMIT 1;
-- What time of day sees most footfall?
SELECT 
    CASE 
        WHEN `hour` < 12 THEN 'Morning'
        WHEN `hour` >= 12 AND `hour` < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Time_Slot, 
    COUNT(*) AS Transaction_Count
FROM supermarket_sales
GROUP BY Time_Slot
ORDER BY Transaction_Count DESC
LIMIT 1;
-- Are members more profitable than non-members?
SELECT 
    `Customer type`, 
    ROUND(AVG(`gross income`), 2) AS Avg_Gross_Income
FROM supermarket_sales
GROUP BY `Customer type`
ORDER BY Avg_Gross_Income DESC;