-- 1075. Project Employees I

DROP TABLE IF EXISTS bonus;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    employee_id      BIGSERIAL UNIQUE NOT NULL,
    name             VARCHAR(255),
    experience_years INT
);

CREATE TABLE project
(
    project_id  BIGINT NOT NULL,
    employee_id BIGINT REFERENCES employee (employee_id)
);

INSERT INTO employee (name, experience_years)
VALUES ('Khaled', 3),
       ('Ali', 2),
       ('John', 1),
       ('Doe', 2);

INSERT INTO project (project_id, employee_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 4);

SELECT project.project_id,
       (SUM(experience_years) / COUNT(*)::NUMERIC)::NUMERIC(10, 2) AS average_years
FROM employee
         JOIN project ON employee.employee_id = project.employee_id
GROUP BY project.project_id;
