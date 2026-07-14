-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- Se cada $1 gasto equivale a 10 pontos e sushi multiplica os pontos por 2, quantos pontos cada cliente tem?

SELECT
    t1.customer_id,
    SUM(CASE WHEN product_name = 'sushi' THEN price * 20 ELSE price * 10 END) AS points
    
FROM sales AS t1

LEFT JOIN menu AS t2
ON t1.product_id = t2.product_id

GROUP BY t1.customer_id