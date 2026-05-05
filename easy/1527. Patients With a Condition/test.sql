-- 1527. Patients With a Condition

DROP TABLE IF EXISTS patients;

CREATE TABLE patients
(
    patient_id   BIGSERIAL PRIMARY KEY,
    patient_name VARCHAR,
    conditions   VARCHAR
);

INSERT INTO patients (patient_name, conditions)
VALUES ('Daniel', 'YFEV COUGH'),
       ('Alice', ''),
       ('Bob', 'DIAB100 MYOP'),
       ('George', 'ACNE DIAB100'),
       ('Alain', 'DIAB201');

SELECT *
FROM patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';
