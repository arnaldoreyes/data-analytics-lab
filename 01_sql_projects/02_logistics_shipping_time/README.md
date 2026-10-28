# Mini-Proyecto 02: Análisis de Eficiencia Operativa y Tiempos de Despacho (Supply Chain)

## 📌 Descripción del Caso de Negocio
El área de operaciones requiere analizar los tiempos de procesamiento interno (desde que se registra una orden hasta su despacho) para identificar cuellos de botella, medir el rendimiento por centro de distribución y clasificar el estado de las entregas.

## 🛠️ Entorno y Tecnologías
* **Motor de Base de Datos:** PostgreSQL
* **Herramientas:** pgAdmin / Cliente SQL compatible con SQL estándar.

## 📂 Estructura de Archivos
* **`01_schema_setup.sql`**: Script de creación de la tabla `shipments` y carga de datos de prueba con casos borde (despachos rápidos, retrasos y órdenes pendientes).
* **`02_solution_query.sql`**: Consultas SQL orientadas al cálculo de métricas logísticas a nivel de detalle y agregadas por almacén.

## 💡 Conceptos Técnicos Aplicados
* **Aritmética de Fechas:** Cálculo de días transcurridos mediante la diferencia directa de fechas en PostgreSQL.
* **Manejo de Nulos:** Uso de `COALESCE` para prevenir fallos en operaciones con fechas faltantes.
* **Lógica Condicional:** Implementación de expresiones `CASE` para clasificar estados (`Pendiente`, `A Tiempo`, `Con Retraso`).
* **Agregaciones Avanzadas:** Uso de la cláusula `FILTER` en funciones de agregación (`AVG`) para aislar cálculos sin alterar el universo total de registros, y conteos condicionales con `CASE` / `NULL`.