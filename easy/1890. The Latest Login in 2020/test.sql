-- 1890. The Latest Login in 2020

DROP TABLE IF EXISTS logins;

CREATE TABLE logins
(
    user_id    BIGINT,
    time_stamp TIMESTAMP,

    UNIQUE (user_id, time_stamp)
);

INSERT INTO logins (user_id, time_stamp)
VALUES (6, '2020-06-30 15:06:07'),
       (6, '2021-04-21 14:06:06'),
       (6, '2019-03-07 00:18:15'),
       (8, '2020-02-01 05:10:53'),
       (8, '2020-12-30 00:46:50'),
       (2, '2020-01-16 02:49:50'),
       (2, '2019-08-25 07:59:08'),
       (14, '2019-07-14 09:00:00'),
       (14, '2021-01-06 11:59:59');

SELECT DISTINCT ON (user_id) user_id    AS user_id,
                             time_stamp AS last_stamp
FROM logins
WHERE time_stamp > '2020-01-01'
  AND time_stamp < '2021-01-01'
ORDER BY user_id, time_stamp DESC;

-- SELECT user_id,
--        MAX(time_stamp) AS last_stamp
-- FROM Logins
-- WHERE time_stamp >= '2020-01-01'
--   AND time_stamp < '2021-01-01'
-- GROUP BY user_id;
