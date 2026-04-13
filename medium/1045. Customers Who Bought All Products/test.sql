-- 1045. Customers Who Bought All Products

DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS customer;

CREATE TABLE product
(
    product_key BIGINT UNIQUE NOT NULL
);

CREATE TABLE customer
(
    customer_id BIGINT NOT NULL,
    product_key BIGINT REFERENCES product (product_key)
);

INSERT INTO product (product_key)
VALUES (5),
       (6);

INSERT INTO customer (customer_id, product_key)
VALUES (1, 5),
       (2, 6),
       (3, 5),
       (3, 6),
       (1, 6);

SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);
