-- SUBQUERY
-- A subquery is a query within another query. It is an inner SQL statement nested inside an outer statement (like SELECT, INSERT, UPDATE, or DELETE) to provide data that the outer query needs to complete its task
-- Core rules for subquery:
-- 1. Parentheses: A subquery must alway be enclosed in round brackets ().
-- 2. Placement: You can place them in SELECT, FROM, WHERE or HAVING clauses
-- 3. Aliases: When used in the FROM clause, most databases require you to give the subquery an alias (a temporary name) so it can be treated like a table

-- Types of subquery:
-- Single-Row Query: Returns exactly one value (one row or one column)
-- Multi-Row Query: Returns a list of values. It makes use of set operators (IN, ANY/SOME, ALL)
-- Correlated Query: Uses values from the outer query to run; it repeats for every row of the main query
-- Nested query: A subquery inside another query

-- For the purpose of Subquery, I will be using 'donation_data' and 'donor_data2' from 'hng' database
USE hng;

-- Subquery in WHERE clause
-- Find donors whose donation is above average 
SELECT * 
FROM donation_data
WHERE donation > (SELECT AVG(donation) FROM donation_data);
-- Explanation:
-- The query retrieves all columns for the record where each donor's donation is above the average donation

-- Find the donor who gave the highest figure in the entire donation
SELECT *
FROM donation_data
WHERE donation = (SELECT MAX(donation) FROM donation_data);
-- Explanation:
-- The query returns every column for the donor(s) who gave the highest figure

-- Count the number of donors who gave the smallest amount
SELECT COUNT(*) AS number_of_lowest_donors
FROM donation_data
WHERE donation = (SELECT MIN(donation) FROM donation_data);
-- Explanation:
-- The query returns the number of donors who gave the least amount

-- Find the job_field with the lowest danation
SELECT COUNT(id) AS "total minimum donors", job_field
FROM donation_data
WHERE donation = (SELECT MIN(donation) FROM donation_data)
GROUP BY job_field;
-- Explanation:
-- The query returns the job_field(s) with the lowest donation

-- Find the state with the highest danation
SELECT MAX(donation) AS "highest donation", state
FROM donation_data
WHERE donation = (SELECT MAX(donation) FROM donation_data)
GROUP BY state;
-- Explanation:
-- The query returns the state(s) with the highest donation amount

-- Subquery in SELECT clause

-- Write a query to compare the first_name and donation of each donor against the overall average 
SELECT first_name, donation,
	(SELECT ROUND(AVG(donation),2) FROM donation_data) AS overall_average
FROM donation_data;    
-- Explanation:
-- The query returns the first name and donation side by side with the 'overall_average'

-- Write a query to compare the first_name and donation of each donor agaianst the 'total_records'
SELECT first_name, donation,
	(SELECT COUNT(*) FROM donation_data) AS total_records
FROM donation_data;
-- Explanation:
-- The query returns the first name and donation side by side with the total records in the table

-- Write a query to compare state with their donors and the overall donors
SELECT state, COUNT(*) AS "state donors", 
	(SELECT COUNT(*) FROM donation_data) AS "total donors"
FROM donation_data
GROUP BY state
ORDER BY COUNT(*) DESC;
-- Explanation:
-- The query returns the state, and the number of donors in each state side by side with the total records -'tatal donors'

-- Write a query to compare the job field wth their donors and the overall donors
SELECT job_field, COUNT(*) AS "job field donors", 
	(SELECT COUNT(*) FROM donation_data) AS "total donors"
FROM donation_data
GROUP BY job_field
ORDER BY COUNT(*) DESC;
-- The query returns the job field, and the number of donors in each job field side by side with the total records

-- Multi-row subquery

-- Write a query to find donors from universities that have at least one donor in Georgia
SELECT d.id, d.first_name, d.last_name, d.state, dd.university
FROM donation_data d 
JOIN donor_data2 dd
ON d.id = dd.id
WHERE university IN (
	SELECT DISTINCT dd.university
    FROM donor_data2 dd 
    JOIN donation_data d ON dd.id = d.id
    WHERE d.state = 'Georgia'
 )
 ORDER BY d.id;
-- The inner query identifies universities that have at leat one donorlocated in 'Georgia'
-- The outerquery then retrieves all donors whose universities appears in that list regardless of their state
