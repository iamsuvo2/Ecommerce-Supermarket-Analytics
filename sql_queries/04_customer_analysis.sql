-- 1. View all records in the `supermarket_sales` table
SELECT *
FROM supermarket_sales;

-- Gender-based purchase trends
-- 1. Total Sales by Gender
select gender, round(sum(Sales), 2) as Total_sales
from supermarket_sales
group by Gender;
-- 2. Average Purchase Amount per Transaction by Gender
select gender,  round(avg(sales), 2) as AVG_Purchase_Amount
from supermarket_sales
group by gender;
-- 3. Total Quantity Purchased by Gender
select gender, sum(quantity) as Total_Quantity
from supermarket_sales
group by gender;
-- 4. Product Line Preferences by Gender
select gender, `product line`, round(sum(sales), 2) as Total_Sales
from supermarket_sales
group by Gender, `Product line`
order by Gender desc;
-- 5. Average Rating by Gender
select gender, avg(rating) as AVG_Rating
from supermarket_sales
group by gender ;
-- 6. Payment Method Preferences by Gender
SELECT Gender, Payment, COUNT(*) AS Transaction_Count
FROM supermarket_sales
GROUP BY Gender, Payment
ORDER BY Gender, Transaction_Count DESC;
-- 7. Purchase Trends by City and Gender
SELECT City, Gender, ROUND(SUM(Sales), 2) AS Total_Sales, COUNT(*) AS Transaction_Count
FROM supermarket_sales
GROUP BY City, Gender
ORDER BY City, Gender;
-- 8. High-Value Purchases by Gender
SELECT Gender, COUNT(*) AS High_Value_Transactions
FROM supermarket_sales
WHERE Sales > 500
GROUP BY Gender;
-- 9. Monthly Purchase Trends by Gender
SELECT Gender, DATE_FORMAT(Date, '%Y/%m') AS Month, ROUND(SUM(Sales), 2) AS Total_Sales
FROM supermarket_sales
GROUP BY Gender, DATE_FORMAT(Date, '%Y/%m')
ORDER BY Gender, Month;
-- 10. Customer Type Breakdown by Gender
SELECT Gender, `Customer type`, COUNT(*) AS Transaction_Count
FROM supermarket_sales
GROUP BY Gender, `Customer type`
ORDER BY Gender, `Customer type`;
