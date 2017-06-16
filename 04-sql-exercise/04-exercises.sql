-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- Select the title of all movies.
SELECT title FROM movies;

-- Show all the distinct ratings in the database.
SELECT DISTINCT rating FROM movies;

-- Show all unrated movies.
SELECT title FROM movies WHERE rating IS NULL;

-- Select all movie theaters that are not currently showing a movie.
SELECT name FROM movietheaters WHERE movie IS NULL;

-- Select all data from all movie theaters and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT * FROM movietheaters LEFT JOIN movies ON movietheaters.movie = movies.code;

-- Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * FROM movietheaters RIGHT JOIN movies ON movietheaters.movie = movies.code;

-- Show the titles of movies not currently being shown in any theaters.
SELECT movies.title FROM movietheaters RIGHT JOIN movies ON movietheaters.movie = movies.code WHERE movietheaters.movie IS NULL;

-- Add the unrated movie "One, Two, Three".
INSERT INTO movies (code, title, rating) VALUES (10, 'One, Two, Three', null);

-- Set the rating of all unrated movies to "G".
UPDATE movies SET rating = 'G' WHERE rating IS NULL;

-- Remove movie theaters projecting movies rated "NC-17".
DELETE FROM movietheaters WHERE movie IN (SELECT code FROM movies WHERE rating = 'NC-17');
