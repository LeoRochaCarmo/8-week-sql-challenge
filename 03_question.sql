-- What was the first item from the menu purchased by each customer?
-- Qual foi o primeiro item do menu comprado por cada cliente?
WITH tb_rn_orders_by_customer AS (
    SELECT *,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn_order
    FROM sales AS t1

    LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id
)

SELECT
    customer_id,
    product_name AS first_product
FROM tb_rn_orders_by_customer

WHERE rn_order = 1
