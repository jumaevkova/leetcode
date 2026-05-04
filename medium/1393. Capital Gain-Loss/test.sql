-- 1393. Capital Gain/Loss

DROP TABLE IF EXISTS stocks;

CREATE TABLE stocks
(
    stock_name    VARCHAR,
    operation     VARCHAR(4),
    operation_day INT,
    price         INT,

    UNIQUE (stock_name, operation_day)
);

INSERT INTO stocks (stock_name, operation, operation_day, price)
VALUES ('Leetcode', 'Buy', 1, 1000),
       ('Corona Masks', 'Buy', 2, 10),
       ('Leetcode', 'Sell', 5, 9000),
       ('Handbags', 'Buy', 17, 30000),
       ('Corona Masks', 'Sell', 3, 1010),
       ('Corona Masks', 'Buy', 4, 1000),
       ('Corona Masks', 'Sell', 5, 500),
       ('Corona Masks', 'Buy', 6, 1000),
       ('Handbags', 'Sell', 29, 7000),
       ('Corona Masks', 'Sell', 10, 10000);

SELECT stock_name,
       COALESCE(SUM(price) FILTER(WHERE operation = 'Sell' ), 0) -
       COALESCE(SUM(price) FILTER(WHERE operation = 'Buy' ), 0) AS capital_gain_loss
FROM stocks
GROUP BY stock_name;
