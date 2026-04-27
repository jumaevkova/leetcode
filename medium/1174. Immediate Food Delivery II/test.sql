-- 1174. Immediate Food Delivery II

DROP TABLE IF EXISTS delivery;

CREATE TABLE delivery
(
    delivery_id                 BIGSERIAL PRIMARY KEY,
    customer_id                 BIGINT,
    order_date                  DATE,
    customer_pref_delivery_date DATE
);

INSERT INTO delivery (customer_id, order_date, customer_pref_delivery_date)
VALUES (1, '2019-08-01', '2019-08-02'),
       (2, '2019-08-02', '2019-08-02'),
       (1, '2019-08-11', '2019-08-12'),
       (3, '2019-08-24', '2019-08-24'),
       (3, '2019-08-21', '2019-08-22'),
       (2, '2019-08-11', '2019-08-13'),
       (4, '2019-08-09', '2019-08-09');

SELECT (100 * COUNT(*) FILTER (
    WHERE order_date = customer_pref_delivery_date
    )::NUMERIC / COUNT(*)) ::NUMERIC(10, 2) AS immediate_percentage
FROM (SELECT DISTINCT
      ON (customer_id) *
      FROM delivery
      ORDER BY customer_id, order_date) t;
