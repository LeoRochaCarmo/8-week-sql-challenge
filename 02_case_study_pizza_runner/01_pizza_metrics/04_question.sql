-- How many of each type of pizza was delivered?
-- Quantas pizzas de cada tipo foram entregues?

SELECT
    t1.pizza_id,
    COUNT(*) AS total_delivered
FROM customer_orders AS t1

LEFT JOIN runner_orders AS t2
ON t1.order_id = t2.order_id

WHERE duration IS NOT NULL

GROUP BY t1.pizza_id
 