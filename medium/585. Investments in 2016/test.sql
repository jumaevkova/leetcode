-- 585. Investments in 2016

DROP TABLE IF EXISTS insurance;

CREATE TABLE insurance
(
    pid      BIGSERIAL UNIQUE NOT NULL,
    tiv_2015 FLOAT,
    tiv_2016 FLOAT,
    lat      FLOAT,
    lon      FLOAT
);

INSERT INTO insurance (tiv_2015, tiv_2016, lat, lon)
VALUES (10, 5, 10, 10),
       (20, 20, 20, 20),
       (10, 30, 20, 20),
       (10, 40, 40, 40);

SELECT SUM(tiv_2016)::NUMERIC(10, 2) AS tiv_2016
FROM insurance
WHERE tiv_2015 IN (SELECT tiv_2015
                   FROM insurance
                   GROUP BY tiv_2015
                   HAVING COUNT(*) > 1)
  AND (lat, lon) IN (SELECT lat, lon
                     FROM insurance
                     GROUP BY lat, lon
                     HAVING COUNT(*) = 1);
