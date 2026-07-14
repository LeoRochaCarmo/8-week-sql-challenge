-- What is the total amount each customer spent at the restaurant?
-- Qual o total gasto por cada cliente no restaurante?

SELECT
    customer_id,
    SUM(price) AS total_spent
FROM sales AS t1

LEFT JOIN menu AS t2
ON t1.product_id = t2.product_id

GROUP BY customer_id
