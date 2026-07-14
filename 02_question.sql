-- How many days has each customer visited the restaurant?
-- Quantos dias cada cliente visitou o restaurant?

SELECT
    customer_id,
    COUNT(DISTINCT order_date) AS total_days_visited
FROM sales

GROUP BY customer_id