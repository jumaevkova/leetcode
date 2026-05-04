-- 1327. List the Products Ordered in a Period

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

CREATE TABLE products
(
    product_id       BIGSERIAL PRIMARY KEY,
    product_name     VARCHAR,
    product_category VARCHAR
);

CREATE TABLE orders
(
    product_id BIGINT REFERENCES products (product_id),
    order_date DATE,
    unit       BIGINT
);


INSERT INTO products (product_name, product_category)
VALUES ('Leetcode Solutions', 'Book'),
       ('Jewels of Stringology', 'Book'),
       ('HP', 'Laptop'),
       ('Lenovo', 'Laptop'),
       ('Leetcode Kit', 'T-shirt');

INSERT INTO orders (product_id, order_date, unit)
VALUES (1, '2020-02-05', 60),
       (1, '2020-02-10', 70),
       (2, '2020-01-18', 30),
       (2, '2020-02-11', 80),
       (3, '2020-02-17', 2),
       (3, '2020-02-24', 3),
       (4, '2020-03-01', 20),
       (4, '2020-03-04', 30),
       (4, '2020-03-04', 60),
       (5, '2020-02-25', 50),
       (5, '2020-02-27', 50),
       (5, '2020-03-01', 50);

-- SELECT *
-- FROM (SELECT products.product_name,
--              SUM(orders.unit) AS unit
--       FROM products
--                JOIN orders on products.product_id = orders.product_id
--           AND orders.order_date >= DATE '2020-02-01'
--           AND orders.order_date < DATE '2020-03-01'
--       GROUP BY products.product_name) t
-- WHERE t.unit >= 100;

SELECT products.product_name,
       SUM(orders.unit) AS unit
FROM products
         JOIN orders
              ON products.product_id = orders.product_id
WHERE orders.order_date >= DATE '2020-02-01'
  AND orders.order_date < DATE '2020-03-01'
GROUP BY products.product_name
HAVING SUM(orders.unit) >= 100;
