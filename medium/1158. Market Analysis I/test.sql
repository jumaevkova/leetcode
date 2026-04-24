-- 1158. Market Analysis I

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS orders;

CREATE TABLE users
(
    user_id        BIGSERIAL PRIMARY KEY,
    join_date      DATE,
    favorite_brand VARCHAR
);

CREATE TABLE items
(
    item_id    BIGSERIAL PRIMARY KEY,
    item_brand VARCHAR
);

CREATE TABLE orders
(
    order_id   BIGSERIAL PRIMARY KEY,
    order_date DATE,
    item_id    INTEGER REFERENCES items (item_id),
    buyer_id   INTEGER REFERENCES users (user_id),
    seller_id  INTEGER REFERENCES users (user_id)
);

INSERT INTO users (join_date, favorite_brand)
VALUES ('2018-01-01', 'Lenovo'),
       ('2018-02-09', 'Samsung'),
       ('2019-01-19', 'LG'),
       ('2018-05-21', 'HP');

INSERT INTO items (item_brand)
VALUES ('Samsung'),
       ('Lenovo'),
       ('LG'),
       ('HP');

INSERT INTO orders (order_date, item_id, buyer_id, seller_id)
VALUES ('2019-08-01', 4, 1, 2),
       ('2018-08-02', 2, 1, 3),
       ('2019-08-03', 3, 2, 3),
       ('2018-08-04', 1, 4, 2),
       ('2018-08-04', 1, 3, 4),
       ('2019-08-05', 2, 2, 4);

-- SELECT users.user_id   AS buyer_id,
--        users.join_date AS join_date,
--        COUNT(*) FILTER (
--            WHERE DATE_PART('year', order_date) = 2019
--            )           AS orders_in_2019
-- FROM users
--          LEFT JOIN orders ON orders.buyer_id = users.user_id
-- GROUP BY users.user_id, users.join_date
-- ORDER BY users.user_id;

SELECT users.user_id   AS buyer_id,
       users.join_date AS join_date,
       COUNT(*)           FILTER (
           WHERE orders.order_date >= DATE '2019-01-01'
               AND orders.order_date < DATE '2020-01-01'
           )           AS orders_in_2019
FROM users
         LEFT JOIN orders ON orders.buyer_id = users.user_id
GROUP BY users.user_id, users.join_date
ORDER BY users.user_id;
