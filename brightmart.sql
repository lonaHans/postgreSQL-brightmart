CREATE TABLE customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT chk_orders_status
        CHECK (status IN ('PENDING', 'PAID', 'SHIPPED', 'CANCELLED'))
);

CREATE TABLE order_items (
    order_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0),

    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT uq_order_product
        UNIQUE (order_id, product_id)
);

INSERT INTO customers (first_name, last_name, email, phone)
VALUES
    ('Lona', 'Hans', 'lona@example.com', '0764849123'),
    ('Daniel', 'Mokoena', 'daniel@example.com', '0764849133'),
	('Siya', 'Ngobeni', 'siya03@example.com', '0764849132'),
	('Makwa', 'Kraft', 'makwa@example.com', '0764849144'),
	('Ntyiso', 'Khumalo', 'ntyiso@example.com', '0764848921'),
	('Sunflower', 'Seed', 'flower12@example.com', '0764849166');
	
SELECT * FROM customers;

INSERT INTO products (product_name, description, price, stock_quantity)
VALUES
    ('Wireless Mouse', 'Wireless computer mouse', 249.99, 30),
    ('Mechanical Keyboard', 'USB mechanical keyboard', 899.00, 15),
    ('USB-C Cable', 'One metre USB-C cable', 99.50, 50),
	('USB-C Cable', 'two metre USB-C cable', 149.50, 50),
	('USB-B Cable', 'One metre USB-C cable', 99.50, 50),
	('Monitor', 'Dell version 5', 999.50, 50);

SELECT * FROM products;

INSERT INTO orders (customer_id, status)
VALUES
    (1, 'PAID'),
    (2, 'PENDING'),
	(3, 'SHIPPED'),
	(4, 'PAID'),
	(5, 'PENDING'),
	(6, 'CANCELLED');

SELECT order_id, customer_id, status FROM orders;
SELECT product_id, product_name, price FROM products;

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
    (4, 1, 2, 249.99),
    (5, 3, 1, 99.50),
    (6, 2, 1, 899.00);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT first_name, last_name, email
FROM customers;

SELECT
    product_name AS product,
    price AS selling_price
FROM products;

SELECT product_name, price
FROM products
WHERE price > 200;

SELECT product_name, price
FROM products
WHERE price < 300;

SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity = 15;

SELECT customer_id, status
FROM orders
WHERE status = 'PENDING';

SELECT product_name, price, stock_quantity
FROM products
WHERE price > 100
  AND stock_quantity >= 20;

SELECT product_name
FROM products
WHERE product_name LIKE '%USB%';

SELECT product_name
FROM products
WHERE product_name ILIKE '%keyboard%';

SELECT order_id, status
FROM orders
WHERE status IN ('PAID', 'SHIPPED');

SELECT product_name, price
FROM products
WHERE price BETWEEN 100 AND 500;

SELECT product_name, price
FROM products
ORDER BY price DESC;

SELECT product_name, price
FROM products
ORDER BY product_name ASC;

SELECT product_name, stock_quantity, price
FROM products
ORDER BY stock_quantity ASC, price DESC;