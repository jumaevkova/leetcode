-- 1633. Percentage of Users Attended a Contest

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS register;

CREATE TABLE users
(
    user_id   BIGSERIAL PRIMARY KEY,
    user_name VARCHAR
);

CREATE TABLE register
(
    contest_id BIGINT,
    user_id    BIGINT REFERENCES users (user_id),

    UNIQUE (contest_id, user_id)
);

INSERT INTO users (user_id, user_name)
VALUES (6, 'Alice'),
       (2, 'Bob'),
       (7, 'Alex');

INSERT INTO register (contest_id, user_id)
VALUES (215, 6),
       (209, 2),
       (208, 2),
       (210, 6),
       (208, 6),
       (209, 7),
       (209, 6),
       (215, 7),
       (208, 7),
       (210, 2),
       (207, 2),
       (210, 7);

SELECT contest_id                                                      AS contest_id,
       ROUND(COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM users), 2) AS percentage
FROM register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
