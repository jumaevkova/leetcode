-- 1789. Primary Department for Each Employee

DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employee;
DROP TYPE IF EXISTS category;

CREATE TYPE category AS ENUM ('Y', 'N');

CREATE TABLE employee
(
    employee_id   BIGINT,
    department_id BIGINT,
    primary_flag  VARCHAR,

    UNIQUE (employee_id, department_id)
);

INSERT INTO employee (employee_id, department_id, primary_flag)
VALUES (1, 1, 'N'),
       (2, 1, 'Y'),
       (2, 2, 'N'),
       (3, 3, 'N'),
       (4, 2, 'N'),
       (4, 3, 'Y'),
       (4, 4, 'N');

SELECT DISTINCT ON (employee_id) employee_id,
                                 department_id
FROM employee
ORDER BY employee_id, primary_flag DESC;
