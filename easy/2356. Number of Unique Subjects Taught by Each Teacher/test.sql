-- 2356. Number of Unique Subjects Taught by Each Teacher

DROP TABLE IF EXISTS teacher;

CREATE TABLE teacher
(
    teacher_id BIGINT,
    subject_id BIGINT,
    dept_id    BIGINT,

    UNIQUE (subject_id, dept_id)
);

INSERT INTO teacher (teacher_id, subject_id, dept_id)
VALUES (1, 2, 3),
       (1, 2, 4),
       (1, 3, 3),
       (2, 1, 1),
       (2, 2, 1),
       (2, 3, 1),
       (2, 4, 1);

SELECT teacher_id                 AS teacher_id,
       COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;
