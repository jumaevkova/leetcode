-- 1280. Students and Examinations

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS examinations;

CREATE TABLE students
(
    student_id   BIGINT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE TABLE subjects
(
    subject_name VARCHAR UNIQUE NOT NULL
);

CREATE TABLE examinations
(
    student_id   BIGINT REFERENCES students (student_id),
    subject_name VARCHAR
);

INSERT INTO students (student_id, student_name)
VALUES (1, 'Alice'),
       (2, 'Bob'),
       (13, 'John'),
       (6, 'Alex');

INSERT INTO subjects (subject_name)
VALUES ('Math'),
       ('Physics'),
       ('Programming');

INSERT INTO examinations (student_id, subject_name)
VALUES (1, 'Math'),
       (1, 'Physics'),
       (1, 'Programming'),
       (2, 'Programming'),
       (1, 'Physics'),
       (1, 'Math'),
       (13, 'Math'),
       (13, 'Programming'),
       (13, 'Physics'),
       (2, 'Math'),
       (1, 'Math');

SELECT students.student_id,
       students.student_name,
       subjects.subject_name,
       COUNT(examinations.subject_name) AS attended_exams
FROM students
         CROSS JOIN subjects
         LEFT JOIN examinations
                   ON examinations.student_id = students.student_id
                       AND examinations.subject_name = subjects.subject_name
GROUP BY students.student_id, students.student_name, subjects.subject_name
ORDER BY students.student_id, subjects.subject_name;
