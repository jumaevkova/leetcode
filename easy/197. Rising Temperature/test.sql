-- 197. Rising Temperature

CREATE TABLE weather
(
    id          BIGSERIAL UNIQUE NOT NULL,
    recordDate  DATE,
    temperature INT
);

INSERT INTO weather (recordDate, temperature)
VALUES ('2015-01-01', 10),
       ('2015-01-02', 25),
       ('2015-01-03', 20),
       ('2015-01-04', 30);

SELECT id
FROM weather w1
WHERE w1.temperature > (SELECT temperature
                        FROM weather w2
                        WHERE w2.recordDate = w1.recordDate - INTERVAL '1 day');
