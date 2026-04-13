-- 1084. Sales Analysis III

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS product;

CREATE TABLE product
(
    product_id   BIGSERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price   INT
);

CREATE TABLE sales
(
    seller_id  BIGINT,
    product_id BIGINT REFERENCES product (product_id),
    buyer_id   BIGINT,
    sale_date  DATE,
    quantity   INT,
    price      INT
);

INSERT INTO product (product_name, unit_price)
VALUES ('S8', 1000),
       ('G4', 800),
       ('iPhone', 1400);

INSERT INTO sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES (1, 1, 1, '2019-01-21', 2, 2000),
       (1, 2, 2, '2019-02-17', 1, 800),
       (2, 2, 3, '2019-06-02', 1, 800),
       (3, 3, 4, '2019-05-13', 2, 2800);

SELECT product.product_id, product.product_name
FROM sales
         JOIN product ON product.product_id = sales.product_id
WHERE sales.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
  AND sales.product_id NOT IN (SELECT product_id
                               FROM sales
                               WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
GROUP BY product.product_id, product.product_name;

-- SELECT product.product_id, product.product_name
-- FROM product
--          JOIN sales ON product.product_id = sales.product_id
-- WHERE sales.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
--   AND sales.product_id NOT IN (SELECT product_id
--                                FROM sales
--                                WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
-- GROUP BY product.product_id, product.product_name;
--
-- SELECT p.product_id, p.product_name
-- FROM product p
--          JOIN sales s ON p.product_id = s.product_id
-- GROUP BY p.product_id, p.product_name
-- HAVING MIN(s.sale_date) >= '2019-01-01'
--    AND MAX(s.sale_date) <= '2019-03-31';
