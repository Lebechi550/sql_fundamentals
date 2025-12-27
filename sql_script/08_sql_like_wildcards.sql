 -- LIKE operator
--  In SQL, LIKE is used with WHERE clause to search for a specified pattern in a column
-- There are 2 wildcards often paired with the LIKE operator
-- The percent sign (%): represents zero, one or multiple characters
-- The underscore sign (_): represents a single character
-- % and _ can also be used together
-- LIKE Syntax:
-- SELECT column(s)
-- FROM table
-- WHERE column LIKE pattern;

 SELECT * 
 FROM donation_data
 WHERE email LIKE '%edu';
 -- Explanation: The query returns all the columns for the donors whose email address ends with 'edu'

-- Find all the donors whose first name has the word 'nan'
SELECT *
FROM donation_data
WHERE first_name LIKE "%nan%";
-- Explanation: The query filters the table to return all the columns where the first_name contains 'nan'

-- Write a query to find donors whose first name starts with the letter K
SELECT *
FROM donation_data
WHERE first_name LIKE "k%";
 -- Explanation: The query filters the record to retrieve all the columns where the first name begins with 'K'
 
 -- Write a query to find donors whose last name starts with 'The'
 SELECT * 
 FROM donation_data
 WHERE last_name LIKE 'The%';
 -- Explanation: The query returns all the columns for the donors whose 'last_name' starts with 'The'
 
  SELECT * 
 FROM donation_data
 WHERE last_name LIKE '%T';
 -- Explanation: The query filters the table to returns donors whose last_name ends with t. 
 
 -- Write a query to find all donors whose first name starts with 'H' and ends with 'T'
 SELECT * 
 FROM donation_data
 WHERE first_name LIKE 'H%E';
 -- The query retrieves all the columns of the table for donors whose first_name starts with 'H' and ends with 'E'
 
 -- Using Wildcards with LIKE operator
   SELECT * 
 FROM donation_data
 WHERE last_name LIKE '_e%';
 -- The _ wildcard represent a single character
 -- The % wildcard represent zero or more characters
 -- Explanation: The query returns all the columns for the donors whose second letter of their last_name is 'e'
 
 SELECT *
 FROM donation_data
 WHERE first_name LIKE '%V_';
 -- Explanation:
 -- The % wildcard represents zero or more characters
 -- The _ wildcard represent a single character
 -- The query filters the records to retrieve only donors whose first name contains 'v' followed by any single character

