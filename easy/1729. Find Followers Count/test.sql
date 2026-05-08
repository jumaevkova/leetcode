-- 1729. Find Followers Count

DROP TABLE IF EXISTS followers;

CREATE TABLE followers
(
    user_id     BIGINT,
    follower_id BIGINT,

    UNIQUE (user_id, follower_id)
);

INSERT INTO followers (user_id, follower_id)
VALUES (0, 1),
       (1, 0),
       (2, 0),
       (2, 1);

SELECT user_id            AS user_id,
       COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id;
