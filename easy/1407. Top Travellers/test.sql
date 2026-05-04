-- 1407. Top Travellers

DROP TABLE IF EXISTS movierating;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rides;

CREATE TABLE users
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE rides
(
    id       BIGSERIAL PRIMARY KEY,
    user_id  BIGINT REFERENCES users (id),
    distance BIGINT
);

INSERT INTO users (id, name)
VALUES (1, 'Alice'),
       (2, 'Bob'),
       (3, 'Alex'),
       (4, 'Donald'),
       (7, 'Lee'),
       (13, 'Jonathan'),
       (19, 'Elvis');

INSERT INTO rides (id, user_id, distance)
VALUES (1, 1, 120),
       (2, 2, 317),
       (3, 3, 222),
       (4, 7, 100),
       (5, 13, 312),
       (6, 19, 50),
       (7, 7, 120),
       (8, 19, 400),
       (9, 7, 230);

SELECT users.name                       AS name,
       COALESCE(SUM(rides.distance), 0) AS travelled_distance
FROM users
         LEFT JOIN rides ON users.id = rides.user_id
GROUP BY users.name, users.id
ORDER BY travelled_distance DESC, users.name;
