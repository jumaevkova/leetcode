-- 178. Rank Scores

CREATE TABLE scores
(
    id    BIGSERIAL UNIQUE NOT NULL,
    score NUMERIC(10, 2)
);

DROP TABLE scores;

INSERT INTO scores (score)
VALUES (3.50),
       (3.65),
       (4.00),
       (3.85),
       (4.00),
       (3.65);

SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM scores;