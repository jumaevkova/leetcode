-- 1907. Count Salary Categories

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts
(
    account_id BIGSERIAL PRIMARY KEY,
    income     BIGINT
);

INSERT INTO accounts (account_id, income)
VALUES (3, 108939),
       (2, 12747),
       (8, 87709),
       (6, 91796);

SELECT 'Low Salary' AS category,
       COUNT(*)     AS accounts_count
FROM accounts
WHERE income < 20000
UNION ALL
SELECT 'Average Salary' AS category,
       COUNT(*)         AS accounts_count
FROM accounts
WHERE income >= 20000
  AND income <= 50000
UNION ALL
SELECT 'High Salary' AS category,
       COUNT(*)      AS accounts_count
FROM accounts
WHERE income > 50000;
