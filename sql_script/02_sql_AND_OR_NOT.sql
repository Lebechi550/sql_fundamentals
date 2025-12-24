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

