# Mini-Proyecto 03: Análisis Avanzado de Ventas Retail (Modelo de 4 Tablas)

## 📌 Contexto del Negocio
Una plataforma de comercio electrónico necesita evaluar el rendimiento de sus productos e identificar los artículos más vendidos dentro de cada categoría para optimizar el inventario y las estrategias de marketing regional.

## 🛠️ Estructura de la Base de Datos
El análisis se apoya en un esquema relacional transaccional compuesto por 4 tablas relacionadas mediante claves primarias y foráneas:
- `customers`: Registro de clientes y país de origen.
- `products`: Catálogo de productos, categorías y precios unitarios.
- `orders`: Cabecera de órdenes de compra.
- `order_items`: Detalle transaccional de productos e ítems vendidos por orden.

## 🎯 Objetivos Analíticos
1. Consolidar el volumen total de unidades vendidas por cada producto (`SUM` y manejo de nulos con `COALESCE`).
2. Agrupar los datos de forma limpia utilizando **Common Table Expressions (CTEs)** para separar la lógica de agregación del reporte final.
3. Clasificar la jerarquía de ventas por categoría utilizando la función de ventana **`RANK() OVER (PARTITION BY ... ORDER BY ...)`**.

## 💡 Conceptos Técnicos Aplicados
- **CTEs (`WITH`)**: Modularización de consultas para evitar subconsultas anidadas y mejorar la mantenibilidad del código.
- **Funciones de Ventana (`RANK`)**: Cálculo de métricas avanzadas y posicionamiento sin colapsar las filas de la tabla de resultados.
- **Modelado Relacional**: Uniones multitabla (`LEFT JOIN`) garantizando la integridad de productos sin ventas registradas.