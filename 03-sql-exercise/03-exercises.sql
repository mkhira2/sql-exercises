-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- Select all warehouses.
SELECT * FROM warehouses;

-- Select all boxes with a value larger than $150.
SELECT * FROM boxes WHERE value > 150;

-- Select all distinct contents in all the boxes.
SELECT DISTINCT contents FROM boxes;

-- Select the average value of all the boxes.
SELECT AVG(value) FROM boxes;

-- Select the warehouse code and the average value of the boxes in each warehouse.
SELECT warehouse, AVG(value) FROM boxes GROUP BY warehouse;

-- Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT warehouse, AVG(value) FROM boxes GROUP BY warehouse HAVING AVG(value) > 150;

-- Select the code of each box, along with the name of the city the box is located in.
SELECT boxes.code, location FROM warehouses INNER JOIN boxes ON boxes.warehouse = warehouses.code;

-- Select the warehouse codes, along with the number of boxes in each warehouse. Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT warehouse, COUNT(warehouse) FROM boxes GROUP BY warehouse;

-- Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT code FROM warehouses WHERE capacity < (SELECT COUNT(warehouse) FROM boxes WHERE warehouse = warehouses.code);

-- Select the codes of all the boxes located in Chicago.
SELECT boxes.code FROM warehouses LEFT JOIN boxes ON warehouses.code = boxes.warehouse WHERE location = 'Chicago';

-- Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO warehouses (code, location, capacity) VALUES (6, 'New York', 3);

-- Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO boxes (code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 200, 2);

-- Reduce the value of all boxes by 15%.
UPDATE boxes SET value = value * .85;

-- Remove all boxes with a value lower than $100.
DELETE FROM boxes WHERE value < 100;

-- Remove all boxes from saturated warehouses.
DELETE FROM boxes WHERE warehouse IN (SELECT code FROM warehouses WHERE capacity < (SELECT COUNT(*) FROM boxes WHERE warehouse = warehouses.code));
