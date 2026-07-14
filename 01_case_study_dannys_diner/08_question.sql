-- What is the total items and amount spent for each member before they became a member?
-- Qual é o total de itens e quantia gasta por cada membro antes de se tornarem membros?

SELECT
    t1. customer_id,
    COUNT(*) AS total_items_before_membership,
    SUM(t3.price) AS amount_spent_before_membership
FROM sales AS t1

LEFT JOIN members AS t2
ON t1.customer_id = t2.customer_id

LEFT JOIN menu AS t3
ON t1.product_id = t3.product_id

WHERE order_date < join_date

GROUP BY t1.customer_id

