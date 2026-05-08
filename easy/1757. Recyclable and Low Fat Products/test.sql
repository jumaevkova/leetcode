-- 1757. Recyclable and Low Fat Products

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;

CREATE TYPE category AS ENUM ('Y', 'N');

CREATE TABLE products
(
    product_id BIGSERIAL PRIMARY KEY,
    low_fats   CATEGORY,
    recyclable CATEGORY
);

INSERT INTO products (product_id, low_fats, recyclable)
VALUES (0, 'Y', 'N'),
       (1, 'Y', 'Y'),
       (2, 'N', 'Y'),
       (3, 'Y', 'Y'),
       (4, 'N', 'N');

SELECT product_id
FROM products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
