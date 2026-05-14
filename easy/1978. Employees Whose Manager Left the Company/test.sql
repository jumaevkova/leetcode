-- 1978. Employees Whose Manager Left the Company

DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    employee_id BIGSERIAL PRIMARY KEY,
    name        VARCHAR,
    manager_id  BIGINT NULL,
    salary      BIGINT
);

INSERT INTO employees (employee_id, name, manager_id, salary)
VALUES (3, 'Mila', 9, 60301),
       (12, 'Antonella', NULL, 31000),
       (13, 'Emery', NULL, 67084),
       (1, 'Kalel', 11, 21241),
       (9, 'Mikaela', NULL, 50937),
       (11, 'Joziah', 6, 28485);

SELECT employee_id
FROM employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (SELECT employee_id
                         FROM employees)
ORDER BY employee_id;
