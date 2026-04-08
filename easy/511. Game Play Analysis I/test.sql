-- 511. Game Play Analysis I

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
       (1, 2, '2016-05-02', 6),
       (2, 3, '2017-06-25', 1),
       (3, 1, '2016-03-02', 0),
       (3, 4, '2018-07-03', 5);

SELECT player_id,
       (SELECT a.event_date
        FROM activity a
        WHERE a.player_id = activity.player_id
        ORDER BY event_date ASC
        LIMIT 1) AS first_login
FROM activity
GROUP BY player_id;
