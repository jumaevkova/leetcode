-- 185. Department Top Three Salaries

DROP TABLE IF EXISTS employee;

CREATE TABLE department
(
    id   BIGSERIAL UNIQUE NOT NULL,
    name VARCHAR
);

INSERT INTO department (name)
VALUES ('IT'),
       ('Sales');

CREATE TABLE employee
(
    id           BIGSERIAL UNIQUE NOT NULL,
    name         VARCHAR,
    salary       INT,
    departmentId BIGINT REFERENCES department (id) ON DELETE CASCADE
);

INSERT INTO employee (name, salary, departmentId)
VALUES ('Joe', 85000, 1),
       ('Henry', 80000, 2),
       ('Sam', 60000, 2),
       ('Max', 90000, 1),
       ('Janet', 69000, 1),
       ('Randy', 85000, 1),
       ('Will', 70000, 1);

-- SELECT *
-- FROM (SELECT *,
--              ROW_NUMBER() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rn
--       FROM employee) t
-- WHERE rn <= 3;

SELECT t.department,
       t.employee,
       t.salary
FROM (SELECT department.name AS department,
             employee.name   AS employee,
             employee.salary AS salary,
             DENSE_RANK()       OVER (
                 PARTITION BY departmentId
                 ORDER BY salary DESC
                 )           AS rnk
      FROM employee
               JOIN department ON department.id = employee.departmentId) t
WHERE rnk <= 3;
