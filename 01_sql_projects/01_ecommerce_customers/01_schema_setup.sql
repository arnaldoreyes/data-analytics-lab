-- Creación de la base de datos y estructura de tablas
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Inserción de datos de prueba con casos borde (clientes sin pedidos, pedidos cancelados, etc.)
INSERT INTO customers (customer_id, signup_date, country) VALUES
(1, '2026-05-10', 'Venezuela'),
(2, '2026-04-15', 'Colombia'),
(3, '2026-06-01', 'Argentina'),
(4, '2025-11-20', 'Chile'),
(5, '2026-05-25', 'Venezuela');

INSERT INTO orders (order_id, customer_id, order_date, order_amount, status) VALUES
(101, 1, '2026-05-12', 45.50, 'completed'),
(102, 1, '2026-05-20', 120.00, 'completed'),
(103, 2, '2026-04-18', 85.00, 'completed'),
(104, 2, '2026-04-22', 30.00, 'cancelled'),
(105, 4, '2026-01-10', 500.00, 'completed'),
(106, 5, '2026-05-28', 60.00, 'cancelled'),
(107, 1, '2026-06-05', 200.00, 'completed');