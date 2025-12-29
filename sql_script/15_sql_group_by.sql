-- GROUP BY
-- The GROUP BY statement groups rows that have the same values into summary rows, like "finding donors from the same job_field, the same state or even donor from the same university".
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns. 
-- In Sstandard SQL, if you use a GROUP BY clause, the very column(s) in your SELECT list must either be: 
-- Included in the GROUP BY clause or contained within an aggregate function (like COUNT, SUM, MAX, or MIN)
-- GROUP BY Synta:
SELECT column_name(s)
FROM table_name
GROUP BY column_name(s);

-- Using donation_data and donor_data2 in the hng database, let's see some examples of GROUP BY

-- Write a query to find the number of donors from each job_field
SELECT COUNT(id), job_field
FROM donation_data
GROUP BY  job_field;
-- Explanation:
-- The query returns the number of donors from each job field

-- Write a query to find the number of donors from each state ordered by the state. 
SELECT COUNT(id), state
FROM donation_data
GROUP BY state;
-- Explanation:
-- The query returns the number of donors from each state

-- Write a query to find the number of donors from each job_field in every state. 
SELECT COUNT(id), job_field, state
FROM donation_data
GROUP BY  job_field, state
ORDER BY job_field, state;
-- Explanation:
-- For every job_field, the query returns the number of donors from each job field in each state

-- Write a query to find the minimum donation in each state
SELECT MIN(donation) AS 'least Donation Amount', state
FROM donation_data
GROUP BY  state
ORDER BY  MIN(donation);
-- The query returns a list of the lowest donation in each state

-- Write a query to find the maximum donation in each state
SELECT MAX(donation) AS "least Donation Amount", state
FROM donation_data
GROUP BY  state
ORDER BY  MAX(donation) DESC;
-- The query returns a list of the highest donation in each state

-- Write a query to find the number of donors from each university
SELECT COUNT(DISTINCT d.id) AS "number of donors", dd.university
FROM donation_data d
LEFT JOIN donor_data2 dd
ON d.id = dd.id 
GROUP BY dd.university
ORDER BY dd.university DESC;
-- Explanation:
-- The query returns the number of donors in each university and null value for donors with no university
