-- Introduction to CROSS JOIN and SELF JOIN

-- CROSS JOIN
-- A CROSS JOIN keyword returns all records from both tables
-- This type of join does not require any condition to join the tables
-- CROSS JOIN Syntax
SELECT column_names(s)
FROM table1
CROSS JOIN table2;


-- Basic examples of CROSS JOIN using the 'actor', 'film_actor', and 'film_category' tables in sakila database
SELECT actor.first_name, actor.last_name, film_category.last_update
FROM actor
CROSS JOIN film_category;
-- Explanation:
-- The query returns the cartesian product of the actor and film_category table. 

-- You can add a WHERE clause to a CROSS JOIN if the table1 and table2 has a relationship, and the result will be same as that of an INNER JOIN 
SELECT actor.first_name, actor.last_name, film_actor.last_update, actor.actor_id, film_actor.actor_id
FROM actor
CROSS JOIN film_actor
WHERE actor.actor_id = film_actor.actor_id;

-- SELF JOIN:
-- A SELF JOIN is a regular join, but the table is joined with itself.
-- Basic SELF JOIN using donation_data table in hng database
-- SELF JOIN Syntax:
SELECT column_name(S)
FROM table1 T1, table2 T2
WHERE condition;
-- T1 and T2 are different table aliases for the same table
SELECT d.id AS donor1_id, CONCAT_WS(' ', d.first_name, d.last_name) AS donor1, dd.id AS donor2_id, CONCAT_WS(' ', dd.first_name, dd.last_name) AS donor2, d.job_field
FROM donation_data d, donation_data dd
WHERE d.id <> dd.id AND d.job_field = dd.job_field
ORDER BY d.id, dd.id;
-- Explanation:
-- The above query matches donors who are from the same job_field

SELECT CONCAT_WS(' ', d.first_name, d.last_name) AS donor1,  CONCAT_WS(' ', dd.first_name, dd.last_name) AS donor2, d.job_field, d.state
FROM donation_data d, donation_data dd
WHERE d.id <> dd.id AND d.state = dd.state
ORDER BY state;
-- Explanation:
-- The query matches donor who are from the same state. 

