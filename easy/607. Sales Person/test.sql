-- 607. Sales Person

DROP TABLE IF EXISTS salesPerson;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS orders;

CREATE TABLE salesPerson
(
    sales_id        BIGINT PRIMARY KEY,
    name            VARCHAR(255),
    salary          INT,
    commission_rate INT,
    hire_date       DATE
);

CREATE TABLE company
(
    com_id BIGINT PRIMARY KEY,
    name   VARCHAR(255),
    city   VARCHAR(255)
);

CREATE TABLE orders
(
    order_id   BIGINT PRIMARY KEY,
    order_date DATE,
    com_id     BIGINT REFERENCES company (com_id),
    sales_id   BIGINT REFERENCES salesPerson (sales_id),
    amount     INT
);

INSERT INTO salesPerson (sales_id, name, salary, commission_rate, hire_date)
VALUES (1, 'John', 100000, 6, '2006-04-01'),
       (2, 'Amy', 12000, 5, '2010-05-01'),
       (3, 'Mark', 65000, 12, '2008-12-25'),
       (4, 'Pem', 25000, 25, '2005-01-01'),
       (5, 'Alex', 5000, 10, '2007-02-03');

INSERT INTO company (com_id, name, city)
VALUES (1, 'RED', 'Boston'),
       (2, 'ORANGE', 'New York'),
       (3, 'YELLOW', 'Boston'),
       (4, 'GREEN', 'Austin');

INSERT INTO orders (order_id, order_date, com_id, sales_id, amount)
VALUES ('1', '2014-01-01', '3', '4', '10000'),
       ('2', '2014-01-02', '4', '5', '5000'),
       ('3', '2014-01-03', '1', '1', '50000'),
       ('4', '2014-01-04', '1', '4', '25000');

SELECT name
FROM salesPerson
WHERE sales_id
          NOT IN (SELECT sales_id
                  FROM orders
                  WHERE com_id = (SELECT com_id
                                  FROM company
                                  WHERE name = 'RED'));
