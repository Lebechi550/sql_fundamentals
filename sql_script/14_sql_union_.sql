
-- UNION Operator
-- In SQL, the UNION operator is used to combine result-set  of two or more SELECT statement
-- The UNION operator automatically removes duplicate rows from the result-set
-- Requirement for UNION
--  Every SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in every SELECT statement must also be in the same order
-- UNION Syntax
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
-- The column_names in the result-set are usually equal to the column_names in the first SELECT statement

-- Basic examples of UNION with 'actor' and 'staff' tables in the sakila database
SELECT first_name, last_name FROM actor
UNION
SELECT first_name, last_name FROM staff;
-- Explanation:
-- The query retrieves the first_name and last_name of all acotrs and all staff members removing duplicate rows from the result set. 

-- UNION ALL
-- The UNION ALL operator is similar to UNION operator, but it allows duplicate rows in the result set
-- Example
SELECT first_name, last_name FROM actor
UNION ALL
SELECT first_name, last_name FROM staff;
-- The query retrieves the first_name and last_name of all acotrs and all staff members including duplicates. 

-- Write a query to retrieve the titles of all films and the names of all categories
SELECT title AS name FROM film
UNION
SELECT name FROM category;
-- Explanation:
-- The query retrieves a distinct list of film title and category names

-- Write a query to retrieve the first names of actors and customers with duplicates
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer;
-- Explanation:
-- The query retrieves first names from both tables including their duplicate rows;

-- Write a query to find all uniqe cities from the 'address' table and the 'city' table
 SELECT address AS city FROM address
 UNION
 SELECT city FROM city;
 -- Explanation:
 -- The query retrieves all the unique addresses from the address table as city combined with the unique city names in the city table. 
 
