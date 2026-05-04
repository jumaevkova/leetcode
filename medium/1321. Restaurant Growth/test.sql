-- 1321. Restaurant Growth

DROP TABLE IF EXISTS customer;

CREATE TABLE customer
(
    customer_id BIGINT,
    name        VARCHAR,
    visited_on  DATE,
    amount      INT,

    UNIQUE (customer_id, visited_on)
);

INSERT INTO customer (customer_id, name, visited_on, amount)
VALUES (1, 'Jhon', '2019-01-01', 100),
       (2, 'Daniel', '2019-01-02', 110),
       (3, 'Jade', '2019-01-03', 120),
       (4, 'Khaled', '2019-01-04', 130),
       (5, 'Winston', '2019-01-05', 110),
       (6, 'Elvis', '2019-01-06', 140),
       (7, 'Anna', '2019-01-07', 150),
       (8, 'Maria', '2019-01-08', 80),
       (9, 'Jaze', '2019-01-09', 110),
       (1, 'Jhon', '2019-01-10', 130),
       (3, 'Jade', '2019-01-10', 150);

WITH daily AS (SELECT visited_on,
                      SUM(amount) AS amount
               FROM customer
               GROUP BY visited_on),
     rolling AS (SELECT visited_on,
                        SUM(amount) OVER (
                            ORDER BY visited_on
                            RANGE BETWEEN INTERVAL '6 days' PRECEDING AND CURRENT ROW
                            ) AS sum_7_days
                 FROM daily)
SELECT visited_on,
       sum_7_days                 AS amount,
       ROUND(sum_7_days / 7.0, 2) AS average_amount
FROM rolling
WHERE visited_on >= (SELECT MIN(visited_on) + INTERVAL '6 days'
FROM daily)
ORDER BY visited_on;
