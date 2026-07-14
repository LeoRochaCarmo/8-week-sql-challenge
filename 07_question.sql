-- Which item was purchased just before the customer became a member?
-- Qual item foi comprado logo antes de o cliente se tornar membro?

WITH tb_rn_sales AS (
    SELECT
        t1.*,
        join_date,
        product_name,
        ROW_NUMBER() OVER(PARTITION BY t1.customer_id ORDER BY order_date DESC) AS rn_orders
    FROM sales AS t1

    LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id

    LEFT JOIN members AS t3
    ON t1.customer_id = t3.customer_id

    WHERE order_date < join_date
)

SELECT
    customer_id,
    product_name AS last_item_before_membership
FROM tb_rn_sales

WHERE rn_orders = 1