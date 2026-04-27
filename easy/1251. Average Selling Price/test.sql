-- 1251. Average Selling Price

DROP TABLE IF EXISTS prices;
DROP TABLE IF EXISTS unitsSold;

CREATE TABLE prices
(
    product_id BIGINT,
    start_date DATE,
    end_date   DATE,
    price      INT,

    UNIQUE (product_id, start_date, end_date)
);

CREATE TABLE unitsSold
(
    product_id    BIGINT,
    purchase_date DATE,
    units         INT
);

INSERT INTO prices (product_id, start_date, end_date, price)
VALUES (1, '2019-02-17', '2019-02-28', 5),
       (1, '2019-03-01', '2019-03-22', 20),
       (2, '2019-02-01', '2019-02-20', 15),
       (2, '2019-02-21', '2019-03-31', 30);

INSERT INTO unitsSold (product_id, purchase_date, units)
VALUES (1, '2019-02-25', 100),
       (1, '2019-03-01', 15),
       (2, '2019-02-10', 200),
       (2, '2019-03-22', 30);

SELECT prices.product_id                                           AS product_id,
       COALESCE((SUM(unitsSold.units * prices.price * 1.0) /
                 SUM(unitsSold.units) * 1.0) ::NUMERIC (10, 2), 0) AS average_price
FROM prices
         LEFT JOIN unitsSold
                   ON unitsSold.product_id = prices.product_id AND
                      unitsSold.purchase_date BETWEEN prices.start_date AND prices.end_date
GROUP BY prices.product_id;

-- SELECT p.product_id,
--        COALESCE(
--                ROUND(SUM(u.units * p.price)::numeric / NULLIF(SUM(u.units), 0), 2),
--                0
--        ) AS average_price
-- FROM prices p
--          LEFT JOIN unitsSold u
--                    ON u.product_id = p.product_id
--                        AND u.purchase_date BETWEEN p.start_date AND p.end_date
-- GROUP BY p.product_id;
