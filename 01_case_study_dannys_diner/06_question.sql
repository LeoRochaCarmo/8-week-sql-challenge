-- Which item was purchased first by the customer after they became a member?
-- Qual foi o primeiro item comprado pelo cliente depois que se tornaram membros?

WITH tb_sales_after_member AS (
    SELECT
        t1.*,
        order_date,
        product_name,
        join_date,
        ROW_NUMBER() OVER(PARTITION BY t1.customer_id ORDER BY order_date) AS rn_order

    FROM sales AS t1

    LEFT JOIN members AS t2
    ON t1.customer_id = t2.customer_id

    LEFT JOIN menu AS t3
    ON t1.product_id = t3.product_id

    WHERE order_date >= join_date

)

SELECT
    customer_id,
    product_name AS first_item_after_membership
FROM tb_sales_after_member

WHERE rn_order = 1