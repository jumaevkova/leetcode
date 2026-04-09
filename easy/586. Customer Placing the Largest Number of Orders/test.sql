-- 586. Customer Placing the Largest Number of Orders

DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
    order_number    BIGSERIAL UNIQUE NOT NULL,
    customer_number BIGINT           NOT NULL
);

INSERT INTO orders (customer_number)
VALUES (1),
       (2),
       (3),
       (3);

SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;
