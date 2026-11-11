SELECT first_name,last_name, email
FROM customers;

SELECT product_name, price
FROM products
ORDER BY product_name ASC;


SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 20;

SELECT c.first_name,c.last_name, o.status
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

SELECT
    SUM(quantity * unit_price) AS total_order_value
FROM order_items; 

SELECT
    AVG(price) AS average_product_price
FROM products;


