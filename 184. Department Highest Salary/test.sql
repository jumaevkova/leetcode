-- 184. Department Highest Salary

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
VALUES ('Joe', 70000, 1),
       ('Jim', 90000, 1),
       ('Henry', 80000, 2),
       ('Sam', 60000, 1),
       ('Max', 90000, 1);

SELECT department.name AS department,
       employee.name   AS employee,
       employee.salary AS salary
FROM employee
         JOIN department ON department.id = employee.departmentId
WHERE employee.salary = (SELECT MAX(salary)
                         FROM employee e
                         WHERE e.departmentId = employee.departmentId);
