-- 1204. Last Person to Fit in the Bus

DROP TABLE IF EXISTS queue;

CREATE TABLE queue
(
    person_id   BIGINT UNIQUE NOT NULL,
    person_name VARCHAR(255),
    weight      INT,
    turn        INT
);

INSERT INTO queue (person_id, person_name, weight, turn)
VALUES (5, 'Alice', 250, 1),
       (4, 'Bob', 175, 5),
       (3, 'Alex', 350, 2),
       (6, 'John Cena', 400, 3),
       (1, 'Winston', 500, 6),
       (2, 'Marie', 200, 4);

SELECT person_name
FROM (SELECT person_name,
             SUM(weight) OVER (ORDER BY turn) AS total_weight
      FROM queue) t
WHERE total_weight <= 1000
ORDER BY total_weight DESC LIMIT 1;
