-- INNER JOIN
-- In SQL, INNER JOIN selects records that have matching values in two or more tables
-- INNER JOIN Syntax:
SELECT column_name(s)
FROM tabl1
INNER JOIN table2
ON table1.column_name = table2.column_nam;

-- let's start by making use of 'donation_data' and 'donor_data2' in the hng database
 USE hng; 
 -- Basic INNER JOIN example
SELECT donation_data.id, donor_data2.id, donation_data.first_name
FROM donation_data
INNER JOIN donor_data2
ON donation_data.id = donor_data2.id;
 -- Explanation: The query retrieves 'id', 'first_name' from donation table and 'id' from donor_data2 with matching id from both tables
 
 -- Write a query to find the second language and favourite colour of each donor
 SELECT donation_data.first_name, donation_data.last_name, donor_data2.second_language, donor_data2.favourite_colour
 FROM donation_data
 INNER JOIN donor_data2
 ON donation_data.id  = donor_data2.id;
--  SELECT donation_data.first_name, donation_data.last_name, donor_data2.second_language, donor_data2.favourite_colour: Specifies the columns to select
--  FROM donation_data: Specifies the first table to select from.
--  INNER JOIN donor_data2: Specifies the second table to select from.
--  ON donation_data.id  = donor_data2.id: specifies the condition for the join
  
 
 -- Write a query to find the first name, state, and University of each donor
 SELECT donation_data.first_name, state, donor_data2.university
 FROM donation_data
 INNER JOIN donor_data2
 ON donation_data.id = donor_data2.id;
 -- Explanation:
 --  SELECT donation_data.first_name, state, donor_data2.university: Specifies the columns to retrieve
 -- FROM donation_data: Specifies the first table to select from
  -- INNER JOIN donor_data2: Specifies the second table to select from
  --  ON donation_data.id = donor_data2.id: Specifies the condition for the join
  
 -- Write a query to find the names, job field donation and frequency of each donor
 SELECT CONCAT_WS(' ', donation_data.first_name, donation_data.last_name) AS donor, donation_data.job_field, donor_data2.donation_frequency AS frequency
 FROM donation_data
 INNER JOIN donor_data2
 ON donation_data.id = donor_data2.id;
 -- Explanation:
 --  The above query selects and concatenates first_name and last_name giving it an alias - 'donor', selects job_field and donation_frequency giving it 'frequency' and then retrieves the records that meet the criteria

