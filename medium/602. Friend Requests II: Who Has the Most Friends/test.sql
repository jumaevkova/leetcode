-- 602. Friend Requests II: Who Has the Most Friends

DROP TABLE IF EXISTS requestAccepted;

CREATE TABLE requestAccepted
(
    requester_id BIGINT,
    accepter_id  BIGINT,
    accept_date  DATE,

    UNIQUE (requester_id, accepter_id)
);

INSERT INTO requestAccepted (requester_id, accepter_id, accept_date)
VALUES ('1', '2', '2016-06-03'),
       ('1', '3', '2016-06-08'),
       ('2', '3', '2016-06-08'),
       ('3', '4', '2016-06-09');

-- SELECT DISTINCT(r1.requester_id)                        AS id,
--                (SELECT COUNT(*)
--                 FROM requestAccepted r2
--                 WHERE r2.requester_id = r1.requester_id
--                    OR r2.accepter_id = r1.requester_id) AS num
-- FROM requestAccepted r1
-- ORDER BY num DESC
-- LIMIT 1;

SELECT id, COUNT(*) AS num
FROM (SELECT requester_id AS id
      FROM requestAccepted
      UNION ALL
      SELECT accepter_id AS id
      FROM requestAccepted) t
GROUP BY id
ORDER BY num DESC LIMIT 1;
