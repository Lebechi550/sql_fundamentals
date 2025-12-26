-- LIMIT Statement:
--  In SQL, LIMIT is used to specify the number of records to retrieve
-- In SQL Server, you use SELECT TOP
-- In MySQL and PostgreSQL, you use LIMIT
-- In Oracle, you use ROWNUM
-- Syntax:
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condtiton
-- LIMIT number;
-- I will be making use of hng Database and donation table
USE hng;
-- Write a query to select the top 5 donors
SELECT * 
FROM donation_data
LIMIT 5;
-- Explanation:
-- The query retrieves all the columns for the first 5 donors in the table

-- LIMIT with WHERE clause: These are used together to add condition to the records to retrieve
-- Write a query to find first 5 donors from Michigan
SELECT * 
FROM donation_data
WHERE state = "Michigan"
LIMIT 5;
-- Explanation
-- The query retrieves all the columns for the first 5 donor from Michigan in the table

-- Using LIMIT with ORDER BY
-- Write a query to select frist name, last name and donation of the top 5 donors 
SELECT id, first_name, last_name, donation
FROM donation_data
ORDER BY donation DESC
LIMIT 5;
-- Explanation: The table contains columns named id, first_name, last_name, and donation
-- The query Retrieves the specified columns for the records that meet the condition

-- Find the 10 highest donors whose job_field is 'Legal' 
SELECT * 
FROM donation_data
WHERE job_field = "Legal"
ORDER BY donation DESC
LIMIT 10;
-- Explanation:
-- The query retrieves all columns for the top 10 donors in 'Legal' job_field
