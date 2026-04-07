--262. Trips and Users

CREATE TABLE trips
(
    id         BIGSERIAL UNIQUE NOT NULL,
    client_id  BIGINT,
    driver_id  BIGINT,
    city_id    BIGINT,
    status     VARCHAR,
    request_at VARCHAR
);

CREATE TABLE users
(
    users_id BIGSERIAL UNIQUE NOT NULL,
    banned   VARCHAR,
    role     VARCHAR
);

INSERT INTO trips (client_id, driver_id, city_id, status, request_at)
VALUES (1, 10, 1, 'completed', '2013-10-01'),
       (2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
       (3, 12, 6, 'completed', '2013-10-01'),
       (4, 13, 6, 'cancelled_by_client', '2013-10-01'),
       (1, 10, 1, 'completed', '2013-10-02'),
       (2, 11, 6, 'completed', '2013-10-02'),
       (3, 12, 6, 'completed', '2013-10-02'),
       (2, 12, 12, 'completed', '2013-10-03'),
       (3, 10, 12, 'completed', '2013-10-03'),
       (4, 13, 12, 'cancelled_by_driver', '2013-10-03');

INSERT INTO users (users_id, banned, role)
VALUES (1, 'No', 'client'),
       (2, 'Yes', 'client'),
       (3, 'No', 'client'),
       (4, 'No', 'client'),
       (10, 'No', 'driver'),
       (11, 'No', 'driver'),
       (12, 'No', 'driver'),
       (13, 'No', 'driver');

-- SLOWER BUT CLEAR AND EASY TO UNDERSTAND
-- SELECT t.day                                                              AS "Day",
--        (t.cancellation_count::NUMERIC / t.unbanned_count)::NUMERIC(10, 2) AS "Cancellation Rate"
-- FROM (SELECT trips.request_at                            AS day,
--              COUNT(*) FILTER (WHERE trips.status IN ('cancelled_by_driver', 'cancelled_by_client')
--                  AND users.banned = 'No')                AS cancellation_count,
--              COUNT(*) FILTER (WHERE users.banned = 'No') AS unbanned_count
--       FROM trips
--                JOIN users ON users.users_id = trips.client_id
--       WHERE trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
--       GROUP BY trips.request_at
--       ORDER BY trips.request_at) t;

SELECT t.day AS "Day",
       ROUND(t.cancellation_count::NUMERIC / NULLIF(t.total_count, 0), 2) ::NUMERIC(10, 2) AS "Cancellation Rate"
FROM (SELECT trips.request_at AS day,
             COUNT(*) FILTER (
                 WHERE trips.status IN ('cancelled_by_driver', 'cancelled_by_client')) AS cancellation_count,
             COUNT(*)                                                                  AS total_count
      FROM trips
          JOIN users client
      ON client.users_id = trips.client_id
          JOIN users driver ON driver.users_id = trips.driver_id
      WHERE client.banned = 'No'
        AND driver.banned = 'No'
        AND trips.request_at BETWEEN '2013-10-01'
        AND '2013-10-03'
      GROUP BY trips.request_at) t;


-- FASTER BUT HARD TO UNDERSTAND
SELECT trips.request_at AS "Day",
       (COUNT(*) FILTER (WHERE trips.status IN ('cancelled_by_driver', 'cancelled_by_client')
           AND users.banned = 'No')::NUMERIC /
        COUNT(*) FILTER (WHERE users.banned = 'No')::NUMERIC) ::NUMERIC(10, 2) AS "Cancellation Rate"
FROM trips
         JOIN users ON users.users_id = trips.client_id
WHERE trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY trips.request_at
ORDER BY trips.request_at;