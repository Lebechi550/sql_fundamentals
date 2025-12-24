USE hng;
-- Explanation:
-- USE keyword activates the database (hng) to use
SELECT * 
FROM donation_data;
-- Explanation: 
-- selects all the columns from donation_data table

SELECT first_name, last_name, email
FROM donation_data;
-- Explanation: The donation_data has columns named 'first_name', 'last_name', and 'email'
-- The query filters the record to retrieve only the specified columns from doanation_data table


-- DISTINCT: Retrieves unique values in a column


SELECT DISTINCT state
FROM donation_data;
-- Explanation: The donation_data has a column named state 
-- SELECT DISTINCT retrieves only distinct (difeerent) state

-- WHERE clause: it is used to filter records based on condition
SELECT first_name, last_name
FROM donation_data
WHERE state = "California";
-- Explanation: The donation_data has columns named 'first_name', 'last_name'
-- The WHERE clause filters the records to only include the first name and last name of donors from California

SELECT gender, donation
FROM donation_data
WHERE shirt_size = "3XL";
-- Explanation: The donation_data has columns named gender, donation
-- The WHERE  clause filters the record to only include donors whose shirt_size is 3XL

-- ORDER BY
-- ORDER BY is used to sort the result-set in a particular order
-- ORDER BY sorts record in ascending order by default, to sort in descinding order, use the keyword DESC. 
-- ORDER BY can sort records base any data type
SELECT first_name, email, shirt_size
FROM donation_data
ORDER BY donation;        
-- Explanation: The donation_data has columns named 'first_name', 'email', 'shirt_size
-- By using ORDER BY, it sorts donation_data by their donation in default order

SELECT first_name, email, shirt_size
FROM donation_data
ORDER BY donation DESC;
-- Explanation:
-- By using ORDER BY with DESC keyword, we sort the donation_data by their donation from highest to lowest

SELECT * 
FROM donation_data
ORDER BY first_name DESC;
-- Explanation:
-- This query selects all the columns and sorts the result-set by their first name (from Z to A)

