-- How many unique customer orders were made?
-- Quantos pedidos únicos de clientes foram feitos?

SELECT COUNT(DISTINCT order_id) AS total_unique_orders FROM customer_orders