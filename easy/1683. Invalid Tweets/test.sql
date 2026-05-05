-- 1683. Invalid Tweets

DROP TABLE IF EXISTS tweets;

CREATE TABLE tweets
(
    tweet_id BIGSERIAL PRIMARY KEY,
    content  VARCHAR
);

INSERT INTO tweets (content)
VALUES ('Let us Code'),
       ('More than fifteen chars are here!');

SELECT tweet_id
FROM tweets
WHERE LENGTH(content) > 15;
