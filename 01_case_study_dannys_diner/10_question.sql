-- In the first week after a customer joins the program (including their join date) 
-- they earn 2x points on all items, not just sushi - how many points do customers 
-- A and B have at the end of January?

-- Na primeira semana depois que um cliente vira membro (incluir a data de inscrição)
-- eles ganham 2x pontos em todos os itens, não apenas sushi. Quantos pontos os clientes A e B no fim de January?

SELECT
    t1.customer_id,
        SUM(CASE
                WHEN t1.order_date BETWEEN t3.join_date AND DATE(join_date, '+6 days') THEN price * 20
                WHEN t2.product_name = 'sushi' THEN price * 20
                ELSE price * 10
            END) AS january_points
FROM sales AS t1

LEFT JOIN menu AS t2
ON t1.product_id = t2.product_id

LEFT JOIN members AS t3
ON t1.customer_id = t3.customer_id

WHERE t3.join_date IS NOT NULL
    AND STRFTIME('%m', t1.order_date) = '01'

GROUP BY t1.customer_id
