-- 3421. Find Students Who Improved

DROP TABLE IF EXISTS scores;

CREATE TABLE scores
(
    student_id BIGINT,
    subject    VARCHAR,
    score      INT,
    exam_date  VARCHAR,

    UNIQUE (student_id, subject, exam_date)
);

INSERT INTO scores (student_id, subject, score, exam_date)
VALUES (101, 'Math', 70, '2023-01-15'),
       (101, 'Math', 85, '2023-02-15'),
       (101, 'Physics', 65, '2023-01-15'),
       (101, 'Physics', 60, '2023-02-15'),
       (102, 'Math', 80, '2023-01-15'),
       (102, 'Math', 85, '2023-02-15'),
       (103, 'Math', 90, '2023-01-15'),
       (104, 'Physics', 75, '2023-01-15'),
       (104, 'Physics', 85, '2023-02-15');

SELECT *
FROM (SELECT student_id AS student_id,
             subject    AS subject,
             (SELECT score
              FROM scores s2
              WHERE s2.student_id = scores.student_id
                AND s2.subject = scores.subject
              ORDER BY exam_date ASC
              LIMIT 1)  AS first_score,
             (SELECT score
              FROM scores s2
              WHERE s2.student_id = scores.student_id
                AND s2.subject = scores.subject
              ORDER BY exam_date DESC
              LIMIT 1)  AS latest_score
      FROM scores
      GROUP BY student_id, subject) t
WHERE latest_score > first_score
ORDER BY student_id, subject;
