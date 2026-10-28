/* 
===============================================================================
Proyecto 02: Análisis de Eficiencia Operativa y Tiempos de Despacho (Supply Chain)
Objetivo: Calcular los tiempos de procesamiento de órdenes y métricas de 
          eficiencia logística agrupadas por centro de distribución.
===============================================================================
*/

-- -------------------------------------------------------------------------------
-- 1. Detalle a nivel de orden: Calcula el tiempo transcurrido y clasifica el estado
-- -------------------------------------------------------------------------------
SELECT  
    -- COALESCE previene errores calculando 0 si la fecha de envío es nula
    COALESCE(shipping_date - order_date, 0) AS process_time,
    
    -- Clasificación lógica condicional del estado del envío
    CASE
        WHEN shipping_date - order_date IS NULL THEN 'Pendiente'
        WHEN shipping_date - order_date <= 2 THEN 'A Tiempo'
        ELSE 'Con Retraso'
    END AS order_status
FROM shipments;


-- -------------------------------------------------------------------------------
-- 2. Métricas agregadas por Centro de Distribución (Warehouse)
-- -------------------------------------------------------------------------------
SELECT  
    warehouse_id,  
    
    -- Total de órdenes gestionadas por almacén (incluyendo pendientes y enviadas)
    COUNT(order_id) AS num_orders,  
    
    -- Tiempo promedio de despacho (en días), redondeado a 2 decimales.
    -- FILTER se usa para excluir las órdenes pendientes ('NULL') solo de este cálculo.
    ROUND(AVG(shipping_date - order_date) FILTER(WHERE shipping_date IS NOT NULL), 2) AS avg_time,
    
    -- Conteo condicional de órdenes que superaron los 2 días de despacho.
    -- Se retorna NULL en el ELSE para que COUNT ignore inteligentemente los registros limpios.
    COUNT(
        CASE  
            WHEN shipping_date - order_date > 2 THEN 1
            ELSE NULL
        END
    ) AS delay_orders
FROM shipments
GROUP BY warehouse_id
ORDER BY warehouse_id;