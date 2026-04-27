-- 1164. Product Price at a Given Date

DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    product_id  BIGINT,
    new_price   BIGINT,
    change_date DATE,

    UNIQUE (product_id, change_date)
);

INSERT INTO products (product_id, new_price, change_date)
VALUES (1, 20, '2019-08-14'),
       (2, 50, '2019-08-14'),
       (1, 30, '2019-08-15'),
       (1, 35, '2019-08-16'),
       (2, 65, '2019-08-17'),
       (3, 20, '2019-08-18');

SELECT p.product_id,
       COALESCE(
               (SELECT new_price
                FROM products p2
                WHERE p2.product_id = p.product_id
                  AND p2.change_date <= '2019-08-16'
                ORDER BY p2.change_date DESC
               LIMIT 1),
               10
       ) AS price
FROM (SELECT DISTINCT product_id FROM products) p;
