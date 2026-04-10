-- 620. Not Boring Movies

DROP TABLE IF EXISTS cinema;

CREATE TABLE cinema
(
    id          BIGSERIAL UNIQUE NOT NULL,
    movie       VARCHAR(255),
    description VARCHAR(255),
    rating      FLOAT
);

INSERT INTO cinema (movie, description, rating)
VALUES ('War', 'great 3D', 8.9),
       ('Science', 'fiction', 8.5),
       ('irish', 'boring', 6.2),
       ('Ice song', 'Fantacy', 8.6),
       ('House card', 'Interesting', 9.1);

SELECT *
FROM cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;
