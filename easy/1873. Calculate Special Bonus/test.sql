-- 1873. Calculate Special Bonus

DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id BIGSERIAL PRIMARY KEY,
    name        VARCHAR,
    salary      BIGINT
);

INSERT INTO employees (employee_id, name, salary)
VALUES (2, 'Meir', 3000),
       (3, 'Michael', 3800),
       (7, 'Addilyn', 7400),
       (8, 'Juan', 6100),
       (9, 'Kannon', 7700);

SELECT employee_id AS employee_id,
       CASE
           WHEN employee_id % 2 <> 0 AND
                LEFT(name, 1) <> 'M' THEN salary
           ELSE 0
           END     AS bonus
FROM employees
ORDER BY employee_id;
