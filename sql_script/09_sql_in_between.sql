-- IN Operator
-- The IN operator allows you to specify multiple values in a WHERE clause
-- The IN operator is a shorthand for multiple OR conditions
-- The Syntax
-- SELECT column(s)
-- FROM table_name
-- WHERE column IN (Value1, value2, value3...);
-- OR
-- SELECT column(s)
-- FROM table_name
-- WHERE column IN (SELECT statement);

-- Write a query to find donor in these Legal, Human Resources and Sales job_field
SELECT first_name, last_name 
FROM donation_data
WHERE job_field IN ('Legal', 'Human Resources', 'Sales');
-- Explanation:
-- The query retrieves only the first_name and last_name of donors who meet the specified conditions.

-- Write a query to find all donors who are from New York, Florida or Louisiana
SELECT * 
FROM donation_data
WHERE state IN ('New York', 'Florida', 'Louisiana');
-- Explanation
-- The query returns all columns for donors who are from 'New York', 'Florida',  'Louisiana'

-- Write a query to find all donors who are not from New York, Florida or Louisiana
SELECT * 
FROM donation_data
WHERE state NOT IN ('New York', 'Florida', 'Louisiana');
-- Explanation
-- The query returns all columns for donors who are not from 'New York', 'Florida',  'Louisiana'


-- BETWEEN Operator
-- The BETWEEN operator selects values within a specifies range. The values can be numbers, texts or dates
-- In BETWEEN operator, the range is inclusive
-- Syntax
-- SELECT column(s)
-- FROM table_name
-- WHERE column BETWEEN value1 AND value2;

-- Write a query to find donations between 490 and 500
SELECT * 
FROM donation_data
WHERE donation BETWEEN 490 AND 500;
-- Explanation:
-- The query retrieves all columns where the donation is between 490 and 500. 

-- Find all donors whose last_name is between 'A' and 'J'
SELECT *
FROM donation_data
WHERE last_name BETWEEN 'A' AND 'J';
-- Explanation:
-- The query retrieves all columns for donors whose last_name is alphabetically between A and J

-- Find donors whose shirt_size is between L and XS
SELECT * 
FROM donation_data
WHERE shirt_size BETWEEN 'L' AND 'XS';
-- Explanation:
-- The query retrieves all columns of the records where shirt_size is between L and XS
