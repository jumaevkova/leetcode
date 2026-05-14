-- 3220. Odd and Even Transactions

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions
(
    transaction_id   BIGSERIAL PRIMARY KEY,
    amount           BIGINT,
    transaction_date DATE
);

INSERT INTO transactions (amount, transaction_date)
VALUES (150, '2024-07-01'),
       (200, '2024-07-01'),
       (75, '2024-07-01'),
       (300, '2024-07-02'),
       (50, '2024-07-02'),
       (120, '2024-07-03');

SELECT transaction_date                                         AS transaction_date,
       COALESCE(SUM(amount) FILTER ( WHERE amount % 2 <> 0), 0) AS odd_sum,
       COALESCE(SUM(amount) FILTER ( WHERE amount % 2 = 0), 0)  AS even_sum
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;
