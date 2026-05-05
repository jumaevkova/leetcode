-- 1581. Customer Who Visited but Did Not Make Any Transactions

DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS transactions;

CREATE TABLE visits
(
    visit_id    BIGINT PRIMARY KEY,
    customer_id BIGINT
);

CREATE TABLE transactions
(
    transaction_id BIGINT PRIMARY KEY,
    visit_id       BIGINT REFERENCES visits (visit_id),
    amount         BIGINT
);

INSERT INTO visits (visit_id, customer_id)
VALUES (1, 23),
       (2, 9),
       (4, 30),
       (5, 54),
       (6, 96),
       (7, 54),
       (8, 54);

INSERT INTO transactions (transaction_id, visit_id, amount)
VALUES (2, 5, 310),
       (3, 5, 300),
       (9, 5, 200),
       (12, 1, 910),
       (13, 2, 970);

SELECT visits.customer_id AS customer_id,
       COUNT(*)           AS count_no_trans
FROM visits
WHERE visit_id NOT IN (SELECT visit_id FROM transactions)
GROUP BY visits.customer_id;
