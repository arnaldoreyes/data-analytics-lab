/* 
===============================================================================
Proyecto 03: Análisis Avanzado de Ventas Retail (Modelo Relacional de 4 Tablas)
Objetivo: Implementar CTEs y Funciones de Ventana para obtener rankings 
          de ventas por categoría de producto.
===============================================================================
*/

WITH sales_by_product AS (
    SELECT  
        prod.product_name, 
        prod.category, 
        COALESCE(SUM(o_i.quantity), 0) AS qt
    FROM products prod 
    LEFT JOIN order_items o_i
        ON prod.product_id = o_i.product_id
    GROUP BY prod.product_name, prod.category
)
SELECT  
    category,
    product_name,
    qt,
    RANK() OVER (
        PARTITION BY category 
        ORDER BY qt DESC
    ) AS product_rank
FROM sales_by_product
ORDER BY qt DESC;