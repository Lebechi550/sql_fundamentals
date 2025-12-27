-- Aggregate functions perform a calculation on a set of values and return a single value. Common aggregate functions are listed below:

-- COUNT eturns the number of rows.
-- SUM: Returns the total sum of a numeric column.
-- AVG: Returns the average value of a numeric column.
-- MAX: Returns the maximum value in a set.
-- MIN: Returns the minimum value in a set.

-- COUNT
-- Syntax:
-- SELECT COUNT(column_name)
-- FROM table_name

-- Write a query to find the total number of donors
SELECT COUNT(*)
FROM donation_data;
-- Explanation: The query returns the number of records on the table

-- Using COUNT function with DISTINCT statement will help you count unique values

SELECT COUNT(DISTINCT (state))
FROM donation_data;
-- Explanation: The retrieves the number of unique states in the table

-- Write a query to find the number of job_fields
SELECT COUNT(DISTINCT (job_field))
FROM donation_data;
-- Explanation: The query retrieves the number of unique job_fields from the table

SELECT COUNT(DISTINCT (shirt_size))
FROM donation_data;
-- Explanation: The query retrieves the number of unique shirt_size from the table

-- Using COUNT function with WHERE clause. When COUNT function is used together with WHERE clause, it returns the number of records in the Where condition
SELECT COUNT(*)
FROM donation_data
WHERE state = "Georgia";
-- Explanation: The query retrieves the number donors from Georgia

-- Find the number of donors whose shirt size is S
SELECT COUNT(*)
FROM donation_data
WHERE shirt_size = "S";
-- Explanation: The query returns the number of donors who meet the condition in the where clause


-- SUM: Returns the total sum of a numeric column.
SELECT SUM(donation)
FROM donation_data;
-- Explanation: The query retrieves the total donation from the table
 
 -- Write a query to find the total donation from Accounting job field
 SELECT SUM(donation)
 FROM donation_data
 WHERE job_field = 'Accounting';
 -- Explanation: The query returns the sum of donation from Accounting
 
 
 -- AVG: Returns the average value of a numeric column
 
 SELECT AVG(donation)
 FROM donation_data;
 -- Explanation: The query returns the average donation from the the table
 
 SELECT AVG(donation)
 FROM donation_data
 WHERE state = 'Michigan';
 -- Explanation: The query retrieves the average donation from Michigan state
 
 
 -- MAX: Returns the maximum value in a set
 
 -- Write a query to find the highest donation
 SELECT MAX(donation)
 FROM donation_data;
 -- Explanation: The query returns the maximum donation in the table.
 
 SELECT MAX(donation)
 FROM donation_data
 WHERE job_field = 'Human Resources';
 -- Explanation: The query returns the maximum donation in Human Resources job field
 
 
 -- MIN: Returns the minimum value in a set. 
 
 SELECT MIN(donation)
 FROM donation_data;
 -- Explanation: The query retrieves the minimum donation in the table
 
 SELECT MIN(donation)
 FROM donation_data
 WHERE job_field = 'Business Development';
 -- Explanation: The query returns the minimum donation in Business Development job field
