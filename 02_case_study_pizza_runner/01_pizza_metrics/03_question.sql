-- How many successful orders were delivered by each runner?
-- Quantas entregas foram realizadas com sucesso por cada entregador?

SELECT
    runner_id,
    COUNT(*) AS succesful_orders 
FROM runner_orders

WHERE duration IS NOT NULL

GROUP BY runner_id