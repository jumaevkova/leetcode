-- 1193. Monthly Transactions I

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions
(
    id         BIGSERIAL PRIMARY KEY,
    country    VARCHAR(2),
    state      VARCHAR(8),
    amount     BIGINT,
    trans_date DATE
);

INSERT INTO transactions (id, country, state, amount, trans_date)
VALUES (121, 'US', 'approved', 1000, '2018-12-18'),
       (122, 'US', 'declined', 2000, '2018-12-19'),
       (123, 'US', 'approved', 2000, '2019-01-01'),
       (124, 'DE', 'approved', 2000, '2019-01-07');

SELECT TO_CHAR(trans_date, 'YYYY-MM')                               AS month,
       country                                                      AS country,
       COUNT(*)                                                     AS trans_count,
       COUNT(*) FILTER (WHERE state = 'approved')                   AS approved_count,
       COALESCE(SUM(amount), 0)                                     AS trans_total_amount,
       COALESCE(SUM(amount) FILTER ( WHERE state = 'approved' ), 0) AS approved_total_amount
FROM transactions
GROUP BY country, TO_CHAR(trans_date, 'YYYY-MM');
