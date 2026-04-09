-- 584. Find Customer Referee

DROP TABLE IF EXISTS customer;

CREATE TABLE customer
(
    id         BIGSERIAL UNIQUE NOT NULL,
    name       VARCHAR          NOT NULL,
    referee_id BIGINT           NULL
);

INSERT INTO customer (name, referee_id)
VALUES ('Will', NULL),
       ('Jane', NULL),
       ('Alex', 2),
       ('Bill', NULl),
       ('Zack', 1),
       ('Mark', 2);

SELECT name
FROM customer
WHERE referee_id <> 2
   OR referee_id IS NULL;
