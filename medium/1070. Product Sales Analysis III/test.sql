-- 1070. Product Sales Analysis III

DROP TABLE IF EXISTS sales;

CREATE TABLE sales
(
    sale_id    BIGINT,
    product_id BIGINT REFERENCES product (product_id),
    year       INT,
    quantity   INT,
    price      INT,

    UNIQUE (sale_id, year)
);

INSERT INTO sales (sale_id, product_id, year, quantity, price)
VALUES (1, 100, 2008, 10, 5000),
       (2, 100, 2009, 12, 5000),
       (7, 200, 2011, 15, 9000);

SELECT product_id, year AS first_year, quantity, price
FROM sales s1
WHERE year = (SELECT MIN (year)
    FROM sales s2
    WHERE s1.product_id = s2.product_id);

-- SELECT DISTINCT ON (product_id) product_id,
--                                 year AS first_year,
--                                 quantity,
--                                 price
-- FROM sales
-- ORDER BY product_id, year;
