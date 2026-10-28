# Mini-Proyecto 01: Análisis de Actividad de Clientes (E-commerce)

## 📌 Contexto de Negocio
El departamento de ventas solicita identificar el rendimiento de los clientes registrados durante el primer semestre de 2026. Se requiere conocer la cantidad total de pedidos completados y el gasto acumulado por usuario, garantizando la visibilidad de aquellos clientes que no han realizado compras exitosas hasta la fecha.

## 🎯 Requerimientos
1. Filtrar únicamente clientes cuyo registro ocurrió en los últimos 6 meses (01-Ene-2026 a 30-Jun-2026).
2. Considerar exclusivamente pedidos con estado `completed`.
3. Incluir clientes sin compras completadas con valores en cero (`0` pedidos, `$0.00` gastado).

## 💡 Aspectos Técnicos Destacados
* Uso de **`LEFT JOIN`** estratégico para no excluir registros sin coincidencia en la tabla secundaria.
* Condición de estado (`status = 'completed'`) dentro del **`ON`** para preservar las filas de la tabla izquierda (`customers`).
* Implementación de **`COALESCE`** para el manejo de valores nulos en el cálculo de métricas financieras.