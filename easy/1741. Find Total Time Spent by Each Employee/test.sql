-- 1741. Find Total Time Spent by Each Employee

DROP TABLE IF EXISTS employees;

CREATE TABLE employees
(
    emp_id    BIGINT,
    event_day DATE,
    in_time   BIGINT,
    out_time  BIGINT,

    UNIQUE (emp_id, event_day, in_time)
);

INSERT INTO employees (emp_id, event_day, in_time, out_time)
VALUES (1, '2020-11-28', 4, 32),
       (1, '2020-11-28', 55, 200),
       (1, '2020-12-03', 1, 42),
       (2, '2020-11-28', 3, 33),
       (2, '2020-12-09', 47, 74);

SELECT event_day                    AS day,
       emp_id                       AS emp_id,
       SUM(out_time) - SUM(in_time) AS total_time
FROM employees
GROUP BY event_day, emp_id
ORDER BY day;
