-- 626. Exchange Seats

DROP TABLE IF EXISTS seat;

CREATE TABLE seat
(
    id      BIGSERIAL UNIQUE NOT NULL,
    student VARCHAR(255)
);

INSERT INTO seat (student)
VALUES ('Abbot'),
       ('Doris'),
       ('Emerson'),
       ('Green'),
       ('Jeames');

SELECT id,
       CASE
           WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM seat)
               THEN (SELECT student FROM seat WHERE id = s1.id + 1)
           WHEN id % 2 = 0
               THEN (SELECT student FROM seat WHERE id = s1.id - 1)
           ELSE student
           END AS student
FROM seat s1;
