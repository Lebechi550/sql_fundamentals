-- The AND operator is used to filter records that meet multiple conditions simultaneously

-- Write a query to retrieve first name, and last name of male donors from Florida 
SELECT first_name, last_name
FROM donation_data
WHERE gender = "Male" AND state = "Florida";
-- Explanation: The donation_data table containns columns named 'first_name', 'last_name'
-- The query retrieves record only for male donors who are from Florida

-- Write a query to select first name, last name, and state of female donors whose donation is above 300
SELECT first_name, last_name, state, donation
FROM donation_data
WHERE gender = "Female" AND donation > 300
ORDER BY donation DESC;
-- Explanation: The donation_data table containns columns named 'first_name', 'last_name', and ' donation'
-- The query filter the table to retrieve only  record of female who has donation 300+

-- Write a qury to select a donor with the first name 'Eda' and last name' 'Jude'
SELECT first_name, last_name
FROM donation_data
WHERE first_name = "Eda" AND last_name = "Jude";
-- Explanation: The donation_table has columns named 'first_name', last_name'
-- The query filters the record to include donors with the first name 'Eda' and last name 'Jude'

-- OR Operator
-- The OR operator is used in SQL to filter records that satisfy at least one of multiple conditions

-- Write a query to find all Female donors or donors from 'Georgia'
SELECT *
FROM donation_data
WHERE gender = "Female" OR state = "Georgia";
-- Explanation:
-- The query filters the record to include donors Female or from Georgia

-- Write a query to find donors with last name 'Habgood' or job field 'Sales
SELECT * 
FROM donation_data
WHERE last_name = "Habgood" OR job_field = "Sales";
-- Explanation
-- The query retrieves all columns for the records that meet the condition(last_name = Habgood or job_field is Sales)

-- Write a query to find donors who are male or with shirt size 2CXL
SELECT * 
FROM donation_data
WHERE gender = "Male" OR shirt_size = "2XL"
ORDER BY shirt_size;
 -- Explanation
 -- The query retrieves all columns for the records that match the specified condion (either male or shirt_size 2XL) and then orders it by the shirt_size
 
 -- Write a query to find donors with the last_name Padwick or donation less than 50
 SELECT *
 FROM donation_data
 WHERE last_name = "Padwick" OR donation < 50
 ORDER BY donation DESC;
 -- Explanation
 -- The query retrieves all the columns for the records that match the specified condition and then orders it by donation from largest to smallest


-- NOT operator is used in sql to filter records that do no match a specified condition

-- Write a query to find all the donors who are not in Accounting job_field
SELECT *
FROM donation_data
WHERE NOT job_field = "Accounting"
ORDER BY job_field;
-- Explanation
-- The query retrieves all the columns for the records that match the specified condition and then order it by their job_field

-- Write a query select the first name and last name for all the donors who are not from Nevada
SELECT first_name, last_name
FROM donation_data
WHERE NOT state = "Nevada";
-- Explanation: The table contains columns named 'first_name' and 'last_name'
-- The query retrieves the first_name and last_name of only donors who are not from 

-- Write a query select the first name and last name for all the donors whose shirt_size is not XS
SELECT first_name, last_name
FROM donation_data
WHERE NOT shirt_size = "XS";
-- Explanation: The table contains columns named 'first_name' and 'last_name'
-- The query retrieves the first_name and last_name of only donors sho meet the specified condition (shirt_size not XS)

-- Combining NOT and AND 
-- NOT & AND operators are used together to create complexexclusion filters.
-- When combined, SQL typically evaluate NOT before AND unless parentheses are used to change the order

-- Write a query to find donors who are not Males and whose donation is above 350 (that is females whose donation is more than 350)
SELECT * 
FROM donation_data
WHERE NOT gender = "Male" AND NOT donation <350
ORDER BY donation;
-- Explanation: 
-- The query retrieves all the columns for females whose donation is more than 350 ordered by their donation from the lowest to highest

 -- Write a query to finder donors who are not in Product Management and Oklahoma
 SELECT * 
 FROM donation_data
 WHERE NOT job_field = "Product Management" AND NOT state = "Oklahoma"
 ORDER BY job_field, state;
 -- Explanation
 -- The query retrieves all the columns for the records that meet the specified condition
 
 -- Combining NOT and OR operator
 -- In SQL, NOT operator can be used with OR operator to negate a single part of an OR condition or to negate an entire group of a conditions enclosed in parentheses
 -- NOT operator has a higher precedence than OR, it only applies to the condition directly following it
 
 -- Find donors who are not in accounting or have donation greater than 400 - Negating a single condition
 SELECT * 
 FROM donation_data
 WHERE NOT job_field = "Accounting" OR donation >400
 ORDER BY job_field, donation;
 -- Explanation: 
 -- The query retrieves all the columns for donor who are in other job_fields but not accounting and also donors from accounting whose donation is above 400
 -- The query is ordered by job_field, then donation. 
  
  -- Find donors who are not in accounting or have donation greater than 400 - Negating the entire group
  SELECT * 
 FROM donation_data
 WHERE NOT (job_field = "Accounting" OR donation >400)
 ORDER BY job_field, donation;
 -- The query retrieves all the columns for donors in other job_field other than Accounting and whose donation is 400 or less
  -- The query is ordered by job_field, then donation.
