-- Which item was the most popular for each customer?
-- Qual item foi o mais popular para cada cliente?

-- RANK() retorna todos os itens (até os empatados)
-- ROW_NUMBER() retorna apenas uma linha, descartando os empates

WITH tb_rank_popular_items AS ( 
    SELECT
        customer_id,
        product_name,
        count(*) AS qtde
    FROM sales AS t1

    LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id

    GROUP BY customer_id, product_name

),

tb_ranking AS (
    SELECT 
        *,
        RANK() OVER(PARTITION BY customer_id ORDER BY qtde DESC) AS ranking
    FROM tb_rank_popular_items

)

SELECT
    customer_id,
    product_name
FROM tb_ranking

WHERE ranking = 1








