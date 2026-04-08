-- 577. Employee Bonus

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS bonus;

CREATE TABLE employee
(
    empId      BIGINT UNIQUE NOT NULL,
    name       VARCHAR,
    supervisor BIGINT        NULL,
    salary     INT
);

CREATE TABLE bonus
(
    empId BIGINT UNIQUE REFERENCES employee (empId),
    bonus INT
);


INSERT INTO employee (empId, name, supervisor, salary)
VALUES (3, 'Brad', NULL, 4000),
       (1, 'John', 3, 1000),
       (2, 'Dan', 3, 2000),
       (4, 'Thomas', 3, 2000);

INSERT INTO bonus (empId, bonus)
VALUES (2, 500),
       (4, 2000);

SELECT e.name  AS name,
       b.bonus AS bonus
FROM employee e
         LEFT JOIN bonus b ON b.empId = e.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;
