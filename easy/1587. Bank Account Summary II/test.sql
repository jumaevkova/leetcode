-- 1587. Bank Account Summary II

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;

CREATE TABLE users
(
    account BIGINT PRIMARY KEY,
    name    VARCHAR
);

CREATE TABLE transactions
(
    trans_id      BIGSERIAL PRIMARY KEY,
    account       BIGINT REFERENCES users (account),
    amount        BIGINT,
    transacted_on DATE
);

INSERT INTO users (account, name)
VALUES (900001, 'Alice'),
       (900002, 'Bob'),
       (900003, 'Charlie');

INSERT INTO transactions (trans_id, account, amount, transacted_on)
VALUES (1, 900001, 7000, '2020-08-01'),
       (2, 900001, 7000, '2020-09-01'),
       (3, 900001, -3000, '2020-09-02'),
       (4, 900002, 1000, '2020-09-12'),
       (5, 900003, 6000, '2020-08-07'),
       (6, 900003, 6000, '2020-09-07'),
       (7, 900003, -4000, '2020-09-11');

SELECT users.name               AS name,
       SUM(transactions.amount) AS balance
FROM users
         JOIN transactions ON transactions.account = users.account
GROUP BY users.name
HAVING SUM(transactions.amount) > 10000;
