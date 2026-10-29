-- 1. Tabla de Clientes
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);

-- 2. Tabla de Productos
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- 3. Tabla de Órdenes (Cabecera)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Tabla de Detalle de Órdenes (Ítems)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserción de datos de prueba
INSERT INTO customers VALUES 
(1, 'Ana Pérez', 'España'),
(2, 'Carlos Gómez', 'México'),
(3, 'Sofía Rodríguez', 'Argentina'),
(4, 'Mateo Silva', 'Colombia');

INSERT INTO products VALUES 
(101, 'Laptop Pro 15', 'Tecnología', 1200.00),
(102, 'Mouse Inalámbrico', 'Tecnología', 25.50),
(103, 'Silla Ergonómica', 'Muebles', 250.00),
(104, 'Escritorio Elevable', 'Muebles', 450.00),
(105, 'Monitor 27"', 'Tecnología', 300.00);

INSERT INTO orders VALUES 
(1001, 1, '2026-09-01'),
(1002, 2, '2026-09-03'),
(1003, 1, '2026-09-10'),
(1004, 3, '2026-09-12'),
(1005, 4, '2026-09-15');

INSERT INTO order_items VALUES 
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 103, 1),
(4, 1003, 105, 2),
(5, 1004, 104, 1),
(6, 1004, 102, 1),
(7, 1005, 101, 1);