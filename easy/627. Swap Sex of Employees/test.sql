-- 627. Swap Sex of Employees

DROP TABLE IF EXISTS salary;

CREATE TABLE salary
(
    id     BIGSERIAL UNIQUE NOT NULL,
    name   VARCHAR(255),
    sex    VARCHAR(1),
    salary INT
);

INSERT INTO salary (name, sex, salary)
VALUES ('A', 'm', 2500),
       ('B', 'f', 1500),
       ('C', 'm', 5500),
       ('D', 'f', 500);

SELECT *
FROM salary;

UPDATE salary
SET sex = CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END
WHERE sex <> '';

SELECT *
FROM salary;

-- SELECT id,
--        name,
--        CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END AS sex,
--        salary
-- FROM salary;
