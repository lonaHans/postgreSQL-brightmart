SELECT
    SUM(quantity * unit_price) AS total_order_value
FROM order_items;

SELECT
    AVG(price) AS average_product_price
FROM products;

SELECT
    ROUND(AVG(price), 2) AS average_product_price
FROM products;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT
    MIN(price) AS cheapest_price,
    MAX(price) AS most_expensive_price
FROM products;

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
ORDER BY order_id;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
HAVING SUM(quantity * unit_price) > 500;

SELECT COUNT(*) AS total_items
FROM order_items;

