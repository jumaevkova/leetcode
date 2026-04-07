-- 196. Delete Duplicate Emails

CREATE TABLE person
(
    id    BIGSERIAL UNIQUE NOT NULL,
    email VARCHAR
);

INSERT INTO person (email)
VALUES ('john@example.com'),
       ('bob@example.com'),
       ('john@example.com');

SELECT *
FROM person;

DELETE
FROM person
WHERE id NOT IN (SELECT MIN(id)
                 FROM person
                 GROUP BY email);

SELECT *
FROM person;
