DROP TABLE IF EXISTS shipments;

-- Creación de tabla para el análisis logístico
CREATE TABLE IF NOT EXISTS shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    warehouse_id VARCHAR(10),
    order_date DATE,
    shipping_date DATE
);

-- Inserción de datos de prueba con casos borde (despachos rápidos, retrasos y pendientes)
INSERT INTO shipments (shipment_id, order_id, warehouse_id, order_date, shipping_date) VALUES
(1, 5001, 'WH-A', '2026-10-01', '2026-10-02'), -- 1 día (A Tiempo)
(2, 5002, 'WH-A', '2026-10-01', '2026-10-05'), -- 4 días (Con Retraso)
(3, 5003, 'WH-B', '2026-10-02', '2026-10-03'), -- 1 día (A Tiempo)
(4, 5004, 'WH-B', '2026-10-03', NULL),         -- En proceso (Pendiente)
(5, 5005, 'WH-A', '2026-10-04', '2026-10-06'), -- 2 días (A Tiempo)
(6, 5006, 'WH-C', '2026-10-05', '2026-10-09'), -- 4 días (Con Retraso)
(7, 5007, 'WH-C', '2026-10-06', NULL);         -- En proceso (Pendiente)