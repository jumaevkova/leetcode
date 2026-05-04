-- 1517. Find Users With Valid E-Mails

DROP TABLE IF EXISTS rides;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    user_id BIGSERIAL PRIMARY KEY,
    name    VARCHAR,
    mail    VARCHAR UNIQUE
);

INSERT INTO users (user_id, name, mail)
VALUES (1, 'Winston', 'winston@leetcode.com'),
       (2, 'Jonathan', 'jonathanisgreat'),
       (3, 'Annabelle', 'bella-@leetcode.com'),
       (4, 'Sally', 'sally.come@leetcode.com'),
       (5, 'Marwan', 'quarz#2020@leetcode.com'),
       (6, 'David', 'david69@gmail.com'),
       (7, 'Shapiro', '.shapo@leetcode.com');

-- SELECT *
-- FROM users
-- WHERE mail LIKE '%@leetcode.com'
--   AND mail ~ '^[A-Za-z][A-Za-z0-9._-]*@';

SELECT *
FROM users
WHERE mail ~ '^[A-Za-z][A-Za-z0-9._-]*@leetcode\.com$';
