-- 1484. Group Sold Products By The Date

DROP TABLE IF EXISTS activities;

CREATE TABLE activities
(
    sell_date DATE,
    product   VARCHAR
);

INSERT INTO activities (sell_date, product)
VALUES ('2020-05-30', 'Headphone'),
       ('2020-06-01', 'Pencil'),
       ('2020-06-02', 'Mask'),
       ('2020-05-30', 'Basketball'),
       ('2020-06-01', 'Bible'),
       ('2020-06-02', 'Mask'),
       ('2020-05-30', 'T-Shirt');

SELECT sell_date                         AS sell_date,
       COUNT(DISTINCT product)           AS num_sold,
       STRING_AGG(DISTINCT product, ',') AS products
FROM activities
GROUP BY sell_date
ORDER BY sell_date;
