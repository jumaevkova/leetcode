-- 619. Biggest Single Number

DROP TABLE IF EXISTS myNumbers;

CREATE TABLE myNumbers
(
    num INT
);

INSERT INTO myNumbers (num)
VALUES (8),
       (8),
       (3),
       (3),
       (1),
       (4),
       (5),
       (6);

SELECT MAX(t.num) AS num
FROM (SELECT num
      FROM myNumbers
      GROUP BY num
      HAVING COUNT(*) = 1) t;

-- SELECT MAX(num) AS num
-- FROM myNumbers
-- GROUP BY num
-- HAVING COUNT(*) = 1
-- ORDER BY num DESC
-- LIMIT 1;
--
-- SELECT MAX(num) AS num
-- FROM myNumbers
-- WHERE num NOT IN (SELECT num FROM myNumbers GROUP BY num HAVING COUNT(*) > 1);
