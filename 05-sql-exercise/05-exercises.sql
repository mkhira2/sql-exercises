-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- 1. Select the name of all the pieces. (Seleccione el nombre de todas las piezas).
SELECT name FROM pieces;

-- 2. Select all the providers' data. (Seleccione todos los datos de los proveedores (providers)).
SELECT * FROM providers;

-- 3. Obtain the average price of each piece (show only the piece code and the average price).
SELECT piece, AVG(price) FROM provides GROUP BY piece;

-- 4. Obtain the names of all providers who supply piece 1.
SELECT providers.name FROM providers INNER JOIN provides ON providers.code = provides.provider AND provides.piece = 1;

-- 5. Select the name of pieces provided by provider with code "HAL".
SELECT pieces.name FROM pieces INNER JOIN provides ON pieces.code = provides.piece AND provides.provider = 'HAL';

-- 6. For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price (note that there could be two providers who supply the same piece at the most expensive price).
SELECT pieces.name, providers.name, price FROM pieces INNER JOIN provides ON pieces.code = piece INNER JOIN providers ON providers.code = provider WHERE price = (SELECT MAX(price) FROM provides WHERE piece = pieces.code);

-- 7. Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO provides (piece, provider, price) VALUES (1, 'TNBC', 7);

-- 8. Increase all prices by one cent.
UPDATE provides SET price = price + 1;

-- 9. Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE FROM provides WHERE provider = 'RBT' AND piece = 4;

-- 10. Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces (the provider should still remain in the database).
DELETE FROM provides WHERE provider = 'RBT';
