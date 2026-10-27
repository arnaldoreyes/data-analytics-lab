/* 
===============================================================================
Proyecto 01: Análisis de Actividad de Clientes en E-commerce
Objetivo: Obtener el resumen de compras completadas para clientes registrados 
          en el primer semestre de 2026, incluyendo aquellos con 0 compras.
===============================================================================
*/

SELECT 
    c.customer_id, 
    c.country, 
    -- Contamos order_id de la tabla orders para que los clientes sin pedidos arrojen 0 y no 1
    COUNT(o.order_id) AS num_orders, 
    -- COALESCE reemplaza los valores NULL resultantes del LEFT JOIN por un monto 0.00 de dinero
    COALESCE(SUM(o.order_amount), 0) AS total_amount
FROM customers c
-- LEFT JOIN conservando todos los clientes, filtrando el estado del pedido directo en el ON
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id 
    AND o.status = 'completed'
WHERE c.signup_date BETWEEN '2026-01-01' AND '2026-06-30'
GROUP BY c.customer_id, c.country;