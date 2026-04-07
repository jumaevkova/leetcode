-- 176. Second Highest Salary

CREATE TABLE employee
(
    id     BIGSERIAL UNIQUE NOT NULL,
    salary INT
);

INSERT INTO employee (salary)
VALUES (100),
       (200),
       (300);

-- SELECT (SELECT DISTINCT(salary) AS SecondHighestSalary
--         FROM employee
--         ORDER BY salary
--         OFFSET 1 LIMIT 1);

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
