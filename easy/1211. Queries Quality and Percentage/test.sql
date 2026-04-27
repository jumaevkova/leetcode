-- 1211. Queries Quality and Percentage

DROP TABLE IF EXISTS queries;

CREATE TABLE queries
(
    query_name VARCHAR,
    result     VARCHAR,
    position   INT,
    rating     INT
);


INSERT INTO queries (query_name, result, position, rating)
VALUES ('Dog', 'Golden Retriever', 1, 5),
       ('Dog', 'German Shepherd', 2, 5),
       ('Dog', 'Mule', 200, 1),
       ('Cat', 'Shirazi', 5, 2),
       ('Cat', 'Siamese', 3, 3),
       ('Cat', 'Sphynx', 7, 4);

SELECT query_name                                                                        AS query_name,
       ((SUM(rating::NUMERIC / position::NUMERIC)) / COUNT(*))::NUMERIC(10, 2)           AS quality,
       (COUNT(*) FILTER ( WHERE rating < 3 )::NUMERIC / COUNT(*) * 100) ::NUMERIC(10, 2) AS poor_query_percentage
FROM queries
GROUP BY query_name;
