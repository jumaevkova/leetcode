-- 610. Triangle Judgement

DROP TABLE IF EXISTS triangle;

CREATE TABLE triangle
(
    x INT,
    y INT,
    z INT
);

INSERT INTO triangle (x, y, z)
VALUES (13, 15, 30),
       (10, 20, 20),
       (10, 20, 15);

SELECT *,
       CASE
           WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
           ELSE 'No'
           END AS triangle
FROM triangle;
