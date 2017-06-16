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
SELECT warehouse, avg(value) FROM boxes GROUP BY warehouse;

-- Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.


-- Select the code of each box, along with the name of the city the box is located in.


-- Select the warehouse codes, along with the number of boxes in each warehouse. Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).


-- Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).


-- Select the codes of all the boxes located in Chicago.


-- Create a new warehouse in New York with a capacity for 3 boxes.


-- Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.


-- Reduce the value of all boxes by 15%.


-- Remove all boxes with a value lower than $100.


-- Remove all boxes from saturated warehouses.
