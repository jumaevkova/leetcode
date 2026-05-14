-- 1965. Employees With Missing Information

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;

CREATE TABLE employees
(
    employee_id BIGINT UNIQUE,
    name        VARCHAR
);

CREATE TABLE salaries
(
    employee_id BIGINT UNIQUE,
    salary      BIGINT
);

INSERT INTO employees (employee_id, name)
VALUES (2, 'Crew'),
       (4, 'Haven'),
       (5, 'Kristian');

INSERT INTO salaries (employee_id, salary)
VALUES (5, 76071),
       (1, 22517),
       (4, 63539);

SELECT COALESCE(employees.employee_id, salaries.employee_id) AS employee_id
FROM employees
         FULL OUTER JOIN salaries
                         ON employees.employee_id = salaries.employee_id
WHERE employees.employee_id IS NULL
   OR salaries.employee_id IS NULL
ORDER BY employee_id;
