-- 550. Game Play Analysis IV

DROP TABLE IF EXISTS activity;

CREATE TABLE activity
(
    player_id    BIGINT,
    device_id    BIGINT,
    event_date   DATE,
    games_played INT,

    UNIQUE (player_id, event_date)
);

INSERT INTO activity (player_id, device_id, event_date, games_played)
VALUES (1, 2, '2016-03-01', 5),
       (1, 2, '2016-03-02', 6),
       (2, 3, '2017-06-25', 1),
       (3, 1, '2016-03-02', 0),
       (3, 4, '2018-07-03', 5);

SELECT ROUND(COUNT(*)
             FILTER (
                 WHERE
                 event_date - (SELECT MIN(a2.event_date) FROM activity a2 WHERE a2.player_id = a1.player_id) = 1)::NUMERIC
                 / COUNT(DISTINCT a1.player_id)::NUMERIC, 2) AS fraction
FROM activity a1;
