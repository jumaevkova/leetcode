-- 570. Managers with at Least 5 Direct Reports

DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    id         BIGSERIAL UNIQUE NOT NULL,
    name       VARCHAR(255)     NOT NULL,
    department VARCHAR(255)     NOT NULL,
    managerId  BIGINT           NULL
);

INSERT INTO employee (id, name, department, managerId)
VALUES (101, 'John', 'A', NULL),
       (102, 'Dan', 'A', 101),
       (103, 'James', 'A', 101),
       (104, 'Amy', 'A', 101),
       (105, 'Anne', 'A', 101),
       (106, 'Ron', 'B', 101);

SELECT name
FROM employee
WHERE id IN (SELECT managerId
             FROM employee
             GROUP BY managerId
             HAVING COUNT(managerId) >= 5);
