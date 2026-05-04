-- 1341. Movie Rating

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movieRating;

CREATE TABLE movies
(
    movie_id BIGSERIAL PRIMARY KEY,
    title    VARCHAR UNIQUE
);

CREATE TABLE users
(
    user_id BIGSERIAL PRIMARY KEY,
    name    VARCHAR UNIQUE
);

CREATE TABLE movieRating
(
    movie_id   BIGINT REFERENCES movies (movie_id),
    user_id    BIGINT REFERENCES users (user_id),
    rating     INT,
    created_at DATE,

    UNIQUE (movie_id, user_id)
);

INSERT INTO movies (title)
VALUES ('Avengers'),
       ('Frozen 2'),
       ('Joker');

INSERT INTO users (name)
VALUES ('Daniel'),
       ('Monica'),
       ('Maria'),
       ('James');

INSERT INTO movieRating (movie_id, user_id, rating, created_at)
VALUES (1, 1, 3, '2020-01-12'),
       (1, 2, 4, '2020-02-11'),
       (1, 3, 2, '2020-02-12'),
       (1, 4, 1, '2020-01-01'),
       (2, 1, 5, '2020-02-17'),
       (2, 2, 2, '2020-02-01'),
       (2, 3, 2, '2020-03-01'),
       (3, 1, 3, '2020-02-22'),
       (3, 2, 4, '2020-02-25');

(SELECT users.name AS results
 FROM movieRating
          JOIN users on users.user_id = movieRating.user_id
 GROUP BY users.name
 ORDER BY COUNT(*) DESC, users.name LIMIT 1)
UNION ALL
(SELECT movies.title AS results
 FROM movieRating
          JOIN movies on movies.movie_id = movieRating.movie_id
 WHERE movieRating.created_at >= DATE '2020-02-01'
   AND movieRating.created_at < DATE '2020-03-01'
 GROUP BY movieRating.movie_id, movies.title
 ORDER BY AVG(rating) DESC, movies.title LIMIT 1);
