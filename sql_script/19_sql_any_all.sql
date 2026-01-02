-- ANY and ALL operators
-- ANY and ALL operators are known as "multi-row comparison operators." They allow you to compare a single value (from your main query) against a range of values returned by a subquery.
ANY Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);
-- The operator must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).

-- Find donors whose donation is more than any single donation from Georgia
SELECT * 
FROM donation_data
WHERE donation > ANY (
	SELECT donation 
    FROM donation_data
    WHERE state = 'Georgia'
)
ORDER BY donation;  
-- Explanation
-- The query returns all donation records that are  greater than at least one (minimum) donation found in Georgia. 

-- ALL Syntax:
SELECT ALL column_name(s)
FROM table_name;

-- Example:
SELECT ALL university
FROM donor_data2;
-- Explanation: SELECT ALL is the invissible default for all queries
-- The 'SELECT ALL university will retrieve every row in the university column. It is the opposite of 'DISTINCT'

-- ALL Syntax With WHERE or HAVING
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);

-- Find donors whose donation is more than all donation from Georgia
SELECT * 
FROM donation_data
WHERE donation > ALL (
	SELECT donation 
    FROM donation_data
    WHERE state = 'Georgia'
)
ORDER BY donation;  
-- Explanation
-- The query returns every column from the donation_data where the record has a donation greater than the highest donation in Georgia. 

-- Find donors whose job field matches any of the job fields represented at 'Harvard university'
SELECT * 
FROM donation_data
WHERE job_field = ANY (
	SELECT d.job_field
    FROM donation_data d
    JOIN donor_data2 dd
    ON d.id = dd. id
	WHERE dd.university = 'Harvard'
)
ORDER BY donation;
-- Explanation:
-- The query retrieves all donation records from individuals whose job field is represented among the Harvard University donor base. 
-- It effectively identifies every donor in the system who shares a professional background with at least one Harvard alumnus.

-- Find donors whose donation is lower than every donor in 'Michigan'
SELECT * 
FROM donation_data
WHERE donation < ALL (
	SELECT donation 
    FROM donation_data
    WHERE state = 'Michigan'
)
ORDER BY donation; 
-- Explanation:
-- The query returns records where the donation is lower than every single donation in Michigan, effectively finding only those amounts that are lower than Michigan's absolute minimum.
