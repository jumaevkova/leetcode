-- 1050. Actors and Directors Who Cooperated At Least Three Times

DROP TABLE IF EXISTS actorDirector;

CREATE TABLE actorDirector
(
    actor_id    BIGINT,
    director_id BIGINT,
    timestamp   INT UNIQUE
);

INSERT INTO actorDirector (actor_id, director_id, timestamp)
VALUES (1, 1, 0),
       (1, 1, 1),
       (1, 1, 2),
       (1, 2, 3),
       (1, 2, 4),
       (2, 1, 5),
       (2, 1, 6);

SELECT actor_id, director_id
FROM actorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;
