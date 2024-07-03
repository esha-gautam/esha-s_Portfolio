-- Data cleaning
select * from sales

-- Since we created table with Not Null constraint, it filters out the data
-- so the data doesn't have any null value

-- Adding Time_of_day column

SELECT 
time, (case 
	when `time` BETWEEN "00:00:00" and "12:01:00" THEN 'Morning' 
	when `time` BETWEEN "12:01:00" and "16:00:00" THEN 'Afternoon'
    else 'Evening'
    end)as time_of_day
 FROM sales
 
 -- Adding a new empty column
 ALTER TABLE sales
 ADD COLUMN time_of_day varchar(20)
 
 -- inserting the values into the column
 UPDATE sales
 SET time_of_day = (case 
	when `time` BETWEEN "00:00:00" and "12:01:00" THEN 'Morning' 
	when `time` BETWEEN "12:01:00" and "16:00:00" THEN 'Afternoon'
    else 'Evening'
    end)
 
 -- ADD day_name_column
 SELECT
 date, DAYNAME(date) as `day` from sales
 
 ALTER TABLE sales
 ADD COLUMN day_name VARCHAR(10)
 
 UPDATE sales
 SET day_name = DAYNAME(date) 
 
-- Adding month column
SELECT
date, MONTHNAME(date) from sales

UPDATE sales
SET month_name = MONTHNAME(date)

------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- BUSINESS QUESTIONS TO ANSWER

-- --------------------------------------------- GENERIC ---------------------------------------------------------------------------------------------
--  How many unique cities does the data have?
SELECT DISTINCT city from sales

-- In which city is each branch?
SELECT DISTINCT city, branch from sales

-- --------------------------------------------- PRODUCT ----------------------------------------------------------------------------------------------
-- How many unique product lines does the data have?
SELECT COUNT(DISTINCT product_line) from sales

-- What is the most selling product line?
SELECT product_line, SUM(quantity) as qty 
from sales
GROUP BY product_line
ORDER BY SUM(quantity) DESC 

-- What is the total revenue by month?
SELECT month_name, SUM(total) AS 'Total_Revenue' 
FROM sales
GROUP BY month_name
ORDER BY SUM(total) DESC

-- What month had the largest COGS?
SELECT month_name, SUM(COGS) AS 'cogs' 
FROM sales
GROUP BY month_name
ORDER BY SUM(COGS) DESC

-- What product line had the largest revenue?
SELECT product_line, SUM(total) AS 'Total_Revenue' 
FROM sales
GROUP BY product_line
ORDER BY  SUM(total) DESC

-- What is the city with the largest revenue?
SELECT city, SUM(total) AS 'Total_Revenue' 
FROM sales
GROUP BY city
ORDER BY  SUM(total) DESC

-- What product line had the largest VAT?
SELECT product_line, SUM(tax_pct) AS 'tax' 
FROM sales
GROUP BY product_line
ORDER BY   SUM(tax_pct) DESC

-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales
SELECT AVG(quantity) FROM sales

SELECT product_line, quantity,
(CASE 
	WHEN quantity>6 THEN 'Good' 
    ELSE 'Bad'
END) as remark
FROM sales
GROUP BY product_line, remark, quantity

-- Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) as qty 
FROM sales
GROUP BY branch
HAVING SUM(quantity)> AVG(quantity)
ORDER BY SUM(quantity) DESC

-- What is the most common product line by gender?
SELECT gender, product_line, count(*) AS Total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY count(*) DESC

-- What is the average rating of each product line?
SELECT ROUND(AVG(rating),2) as avg_rating, product_line
FROM sales
GROUP BY product_line
ORDER BY AVG(rating)

-- ------------------------------------------------------ CUSTOMERS ---------------------------------------------------------------------------------------
-- How many unique customer types does the data have?
SELECT DISTINCT customer_type
FROM sales

-- How many unique payment methods does the data have?
SELECT DISTINCT payment
FROM sales

-- What is the most common customer type?
SELECT customer_type, COUNT(*) AS Total_cnt
FROM sales
GROUP BY customer_type
ORDER BY COUNT(*) DESC

-- Which customer type buys the most?
SELECT customer_type, COUNT(*) AS Total_cnt
FROM sales
GROUP BY customer_type 
ORDER BY COUNT(*) DESC 

-- What is the gender of most of the customers?
SELECT gender, COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY COUNT(*) DESC

-- What is the gender distribution per branch?
 SELECT branch, gender, COUNT(*) AS gender_cnt
 FROM sales
 GROUP BY branch, gender
 ORDER BY branch, gender_cnt 
 
 -- Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC

-- Which time of the day do customers give most ratings per branch?
SELECT time_of_day, branch,  AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day, branch
ORDER BY avg_rating DESC
-- branch A and C is doing well as compare to branch B 


-- Which day fo the week has the best avg ratings?
SELECT day_name, ROUND(AVG(rating),2) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC
-- Monday, Friday and Tuesday has the best avg rating


-- Which day of the week has the best average ratings per branch?
SELECT day_name, branch, ROUND(AVG(rating),2) AS avg_rating
FROM sales
GROUP BY day_name, branch
ORDER BY avg_rating DESC
-- On Friday, branch A has the best rating

-- --------------------------------------------------------- SALES ---------------------------------------------------------------------------------------
--  Number of sales made in each time of the day per weekday
SELECT time_of_day, COUNT(*) AS Total_Sales
FROM sales
GROUP BY time_of_day
ORDER BY Total_Sales DESC
-- Evening time experiences the most sales

-- Which of the customer types brings the most revenue?
SELECT customer_type, SUM(total) AS Total_Revenue
FROM sales
GROUP BY customer_type
ORDER BY Total_Revenue
-- Normal customer creates the most revenue


-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, AVG(tax_pct) AS avg_tax_pct
FROM sales
GROUP BY city
ORDER BY avg_tax_pct DESC

-- Which customer type pays the most in VAT?
SELECT customer_type, ROUND(AVG(tax_pct),2) AS avg_tax_pct
FROM sales
GROUP BY customer_type
ORDER BY avg_tax_pct DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------
 



