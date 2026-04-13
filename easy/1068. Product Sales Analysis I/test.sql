-- 1068. Product Sales Analysis I

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS sales;

CREATE TABLE product
(
    product_id   BIGINT UNIQUE,
    product_name VARCHAR(255)
);

CREATE TABLE sales
(
    sale_id    BIGINT,
    product_id BIGINT REFERENCES product (product_id),
    year       INT,
    quantity   INT,
    price      INT,

    UNIQUE (sale_id, year)
);

INSERT INTO product (product_id, product_name)
VALUES (100, 'Nokia'),
       (200, 'Apple'),
       (300, 'Samsung');

INSERT INTO sales (sale_id, product_id, year, quantity, price)
VALUES (1, 100, 2008, 10, 5000),
       (2, 100, 2009, 12, 5000),
       (7, 200, 2011, 15, 9000);

SELECT product.product_name AS product_name,
       sales.year AS year,
       sales.price          AS price
FROM sales
    JOIN product
ON product.product_id = sales.product_id;
