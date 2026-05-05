-- 1667. Fix Names in a Table

DROP TABLE IF EXISTS register;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    user_id BIGSERIAL PRIMARY KEY,
    name    VARCHAR
);

INSERT INTO users (name)
VALUES ('aLice'),
       ('bOB');

INSERT INTO users (name)
VALUES ('Marry Ann'),
       ('Marry Ann PAN');

-- SELECT user_id       AS user_id,
--        INITCAP(name) AS name
-- FROM users
-- ORDER BY user_id;

SELECT user_id                       AS user_id,
       UPPER(SUBSTRING(name FROM 1 FOR 1)) ||
       LOWER(SUBSTRING(name FROM 2)) AS name
FROM users
ORDER BY user_id;
