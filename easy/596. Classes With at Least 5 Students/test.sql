-- 596. Classes With at Least 5 Students

DROP TABLE IF EXISTS courses;

CREATE TABLE courses
(
    student VARCHAR(255),
    class   VARCHAR(255),

    UNIQUE (student, class)
);

INSERT INTO courses (student, class)
VALUES ('A', 'Math'),
       ('B', 'English'),
       ('C', 'Math'),
       ('D', 'Biology'),
       ('E', 'Math'),
       ('F', 'Biology'),
       ('G', 'Math'),
       ('H', 'Math'),
       ('I', 'Math');

SELECT class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5;
