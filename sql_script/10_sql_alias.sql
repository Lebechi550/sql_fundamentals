-- Aliases
-- In SQL, Aliases are used to give a table or a column in a table a temporary name.
-- Aliases are used to make column names more readable
-- An alias only exist for the duration of that query. 
-- It is created with the AS keyword

-- Alias column syntax:
-- SELECT column_name AS alias_name
-- FROM table_name;

-- Alias table syntax
-- SELECT column_name
-- FROM table_name AS alias_name;

SELECT DISTINCT job_field AS department
FROM donation_data;
-- Explanation:
-- The query retrieves the unique list of all job_field and renames it 'department'for the purpose of this query. 

SELECT CONCAT_WS(' ' , first_name, last_name) AS donor
FROM donation_data;
-- Explanation:
-- The query retrieves the first_name and last_name joined together, renames them 'donor'

-- ALIAS in table

SELECT d.first_name, d.gender, d.job_field, dd.university
FROM donation_data d, donor_data2 dd
WHERE d.state = 'Georgia'AND d.id = dd.id;
-- Explanation:
-- The query gives the 2 tables aliases and retrieves specified columns for records from georgia using id as a common to extract data from both tables. 
