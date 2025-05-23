-- 1. View all records in the `supermarket_sales` table
SELECT *
FROM supermarket_sales;

-- 2. Convert Date to proper DATE format
SELECT `date`,
       STR_TO_DATE(`date`, '%c/%e/%Y')
FROM supermarket_sales;

UPDATE supermarket_sales
SET `date` = STR_TO_DATE(`date`, '%c/%e/%Y');

ALTER TABLE supermarket_sales
MODIFY COLUMN `date` DATE;

-- 3. Convert Time to proper TIME format
SELECT `time`,
       STR_TO_DATE(`time`, '%h:%i:%s %p')
FROM supermarket_sales;

UPDATE supermarket_sales
SET `time` = STR_TO_DATE(`time`, '%h:%i:%s %p');

ALTER TABLE supermarket_sales
MODIFY COLUMN `time` TIME;

-- 4. Add new columns for day, month, hour, week, and weekday
ALTER TABLE supermarket_sales
ADD COLUMN day INT,
ADD COLUMN month INT,
ADD COLUMN hour INT,
ADD COLUMN week INT,
ADD COLUMN weekday VARCHAR(10);

-- 5. Update new columns with extracted values from Date and Time
UPDATE supermarket_sales
SET
    day = DAY(`date`),
    month = MONTH(`date`),
    hour = HOUR(`time`),
    week = WEEK(`date`),
    weekday = DAYNAME(`date`);

-- 6. View first 10 records after the updates
SELECT *
FROM supermarket_sales
LIMIT 10;
