-- HAVING clause
-- The HAVING clause was added in SQL because the WHERE keyword cannot be used with aggregate functions
-- HAVING Syntax
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

-- Find the states where there are 5 or more donors who each gave 400 or more
SELECT COUNT(id), state
FROM donation_data
WHERE donation >= 400
GROUP BY state
HAVING COUNT(id) >= 5
ORDER BY COUNT(id);
-- The query retrieves a list of states that have 5 or more high-value donors, specifically counting those individual donors whose individual donation is 400 and more.

-- Find the states where the total number of donors is 50 and above
SELECT COUNT(id), state
FROM donation_data
GROUP BY state 
HAVING COUNT(id) >= 50
ORDER BY COUNT(id);
-- Explanation:
-- The query returns the number of donors in each state, filtering for only those states that have a total of 50 or more donors. 

-- Find the university where the total number of donors is more than 1
SELECT COUNT(d.id), dd.university
FROM donation_data d
INNER JOIN donor_data2 dd
ON d.id = dd.id
GROUP BY university
HAVING COUNT(d.id) > 1;
-- Explanation:
-- The query returns all universities with more than one donation record, including a count for donors with matching IDs but no university name provided in the records. 

-- Find the job_field where the total donation wis more than 20000
SELECT SUM(donation), job_field
FROM donation_data
GROUP BY job_field
HAVING SUM(donation) > 20000
ORDER BY job_field;
-- Explanation:
-- The query retrieves job_fields where the sum of donation is more than 20,000. 

-- Find the states where the average donation is between 200 and 300
SELECT AVG(donation), state
FROM donation_data
GROUP BY state
HAVING AVG(donation) BETWEEN 200 AND 300
ORDER BY AVG(donation);
-- Explanation:
-- The query returns states where the average donation is between 200 and 300

-- Find university where the maximum donation is not above 50
SELECT MAX(d.donation), dd.university
FROM donation_data d
INNER JOIN donor_data2 dd
ON d.id = dd.id
GROUP BY university
HAVING MAX(donation) < 50
ORDER BY dd.university DESC;
-- Explanation:
-- The query returns all the university that has a donation not greater than 50
