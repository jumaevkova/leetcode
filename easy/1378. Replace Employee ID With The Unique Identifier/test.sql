-- 1378. Replace Employee ID With The Unique Identifier

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS employeeUNI;

CREATE TABLE employees
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE employeeUNI
(
    id        BIGINT,
    unique_id BIGINT,

    UNIQUE (id, unique_id)
);

INSERT INTO employees (id, name)
VALUES (1, 'Alice'),
       (7, 'Bob'),
       (11, 'Meir'),
       (90, 'Winston'),
       (3, 'Jonathan');

INSERT INTO employeeUNI (id, unique_id)
VALUES (3, 1),
       (11, 2),
       (90, 3);

SELECT employeeUNI.unique_id,
       employees.name
FROM employees
         LEFT JOIN employeeUNI ON employeeUNI.id = employees.id;
