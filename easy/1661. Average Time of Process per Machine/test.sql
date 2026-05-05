-- 1661. Average Time of Process per Machine

DROP TABLE IF EXISTS activity;

CREATE TYPE activity_type AS ENUM ('start', 'end');

CREATE TABLE activity
(
    machine_id    BIGINT,
    process_id    BIGINT,
    activity_type activity_type,
    timestamp     FLOAT,

    UNIQUE (machine_id, process_id, activity_type)
);

INSERT INTO activity (machine_id, process_id, activity_type, timestamp)
VALUES (0, 0, 'start', 0.712),
       (0, 0, 'end', 1.520),
       (0, 1, 'start', 3.140),
       (0, 1, 'end', 4.120),
       (1, 0, 'start', 0.550),
       (1, 0, 'end', 1.550),
       (1, 1, 'start', 0.430),
       (1, 1, 'end', 1.420),
       (2, 0, 'start', 4.100),
       (2, 0, 'end', 4.512),
       (2, 1, 'start', 2.500),
       (2, 1, 'end', 5.000);

-- SELECT machine_id                                                                                  AS machine_id,
--        ((SUM(timestamp) FILTER ( WHERE activity_type = 'end') -
--          SUM(timestamp) FILTER ( WHERE activity_type = 'start')) / COUNT(*) * 2.0)::NUMERIC(10, 3) AS processing_time
-- FROM activity
-- GROUP BY machine_id;

SELECT machine_id,
       AVG(end_time - start_time) ::NUMERIC(10, 3) AS processing_time
FROM (SELECT machine_id,
             SUM(timestamp) FILTER ( WHERE activity_type = 'end')   AS end_time,
             SUM(timestamp) FILTER ( WHERE activity_type = 'start') AS start_time
      FROM activity
      GROUP BY machine_id, process_id) t
GROUP BY machine_id;
