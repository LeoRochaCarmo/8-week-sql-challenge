-- What is the most purchased item on the menu and how many times was it purchased by all customers?
-- Qual é o item mais comprado e quantas vezes foi comprado por todos os clientes?

SELECT
    product_name,
    COUNT(*) AS qtd_purchases 
FROM sales AS t1

LEFT JOIN menu AS t2
ON t1.product_id = t2.product_id

GROUP BY product_name

ORDER BY qtd_purchases DESC

LIMIT 1