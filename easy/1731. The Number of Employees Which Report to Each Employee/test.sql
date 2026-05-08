-- 1731. The Number of Employees Which Report to Each Employee

DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id BIGSERIAL PRIMARY KEY,
    name        VARCHAR,
    reports_to  BIGINT NUlL,
    age         BIGINT
);

INSERT INTO employees (employee_id, name, reports_to, age)
VALUES (9, 'Hercy', NULL, 43),
       (6, 'Alice', 9, 41),
       (4, 'Bob', 9, 36),
       (2, 'Winston', NULL, 37);

SELECT e.employee_id,
       e.name,
       COUNT(r.employee_id) AS reports_count,
       ROUND(AVG(r.age))    AS average_age
FROM employees e
         JOIN employees r
              ON r.reports_to = e.employee_id
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;
