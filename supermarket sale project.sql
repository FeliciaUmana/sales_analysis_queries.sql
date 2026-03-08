A supermarket manager wants to know:

Which products sell the most?

Which branch makes the most revenue?

What day has the highest sales?

Which product category performs best?

What time of day customers buy the most?



CREATE TABLE supermarket_sales (
    invoice_id TEXT,
    branch TEXT,
    city TEXT,
    customer_type TEXT,
    gender TEXT,
    product_line TEXT,
    unit_price NUMERIC,
    quantity INT,
    tax NUMERIC,
    sales NUMERIC,
    date DATE,
    time TIME,
    payment TEXT,
    cogs NUMERIC,
    gross_margin_percentage NUMERIC,
    gross_income NUMERIC,
    rating NUMERIC
);

select * from supermarket_sales
limit 10

Que:calculate the total renvenue(how much money the supermarket made)
SELECT SUM(sales) AS total_revenue
FROM supermarket_sales;

SELECT COUNT(*)
FROM supermarket_sales;

que:calculate the renvenue by branch(which branch performs best)
SELECT branch,SUM(sales) AS revenue
FROM supermarket_sales
GROUP BY branch
ORDER BY revenue DESC;

SELECT DISTINCT branch
FROM supermarket_sales;

SELECT DISTINCT city
FROM supermarket_sales;

SELECT DISTINCT product_line
FROM supermarket_sales;

SELECT DISTINCT payment
FROM supermarket_sales;

SELECT 
MIN(date) AS first_sale,
MAX(date) AS last_sale
FROM supermarket_sales;

que:calculate the best selling product line(which product category customers buy most)
SELECT product_line,SUM(quantity) AS items_sold
FROM supermarket_sales
GROUP BY product_line
ORDER BY items_sold DESC;

SELECT product_line, SUM(sales) AS total_sales
FROM supermarket_sales
GROUP BY product_line
ORDER BY total_sales DESC;

SELECT city, SUM(sales) AS city_sales
FROM supermarket_sales
GROUP BY city
ORDER BY city_sales DESC;

que:calculate the average customer rating per product(customer satisfaction per category)
SELECT product_line,ROUND(AVG(rating),2) AS avg_rating
FROM supermarket_sales
GROUP BY product_line
ORDER BY avg_rating DESC;

SELECT AVG(sales) AS avg_customer_spend
FROM supermarket_sales;

que:calculate the most popular payment method
SELECT payment, COUNT(*) AS total_transactions
FROM supermarket_sales
GROUP BY payment
ORDER BY total_transactions DESC;

SELECT customer_type, SUM(sales) AS revenue
FROM supermarket_sales
GROUP BY customer_type
ORDER BY revenue DESC;

SELECT DATE_TRUNC('month', date) AS month,
SUM(sales) AS monthly_sales
FROM supermarket_sales
GROUP BY month
ORDER BY month DESC;

que:calculate sales by day of week(busiest shopping days)
SELECT TO_CHAR(date, 'Day') AS day,
SUM(sales) AS revenue
FROM supermarket_sales
GROUP BY day
ORDER BY revenue DESC;


SELECT *,
CASE
WHEN EXTRACT(HOUR FROM time) < 12 THEN 'Morning'
WHEN EXTRACT(HOUR FROM time) < 18 THEN 'Afternoon'
ELSE 'Evening'
END AS time_of_day
FROM supermarket_sales;


peak or busiest shopping hours
SELECT EXTRACT(HOUR FROM time) AS hour,
SUM(sales) AS hourly_sales
FROM supermarket_sales
GROUP BY hour
ORDER BY hourly_sales DESC;


showing sql window
SELECT date,
SUM(sales) OVER (ORDER BY date) AS running_revenue
FROM supermarket_sales;

