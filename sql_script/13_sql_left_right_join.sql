-- In SQL, a JOIN clause is used to combine rows from two or tables based on a related column between them.
-- LEFT JOIN and RIGHT JOIN are types of OUTER JOINS.
-- LEFT JOIN returns all records from the left table (table1), and the matched records from the right table (table2). 
-- The result is NULL from the right side if there is no match.
-- RIGHT JOIN returns all records from the right table (table2), and the matched records from the left table (table1).
-- The result is NULL from the left side if there is no match.
LEFT JOIN Syntax:
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

-- For this practice, I will be making use of the 'sakila' database
USE sakila;
-- Basic LEFT JOIN example

SELECT customer.customer_id, customer.first_name, customer.last_name, rental.rental_id, rental.return_date
FROM customer
LEFT JOIN rental
ON customer.customer_id = rental.customer_id;
-- Explanation:
-- The query retrieves all customers and their rental information if available
-- If a customer has not rented any films, the rental information will be NULL

SELECT customer.customer_id, customer.first_name, customer.last_name, rental.rental_id
FROM customer
LEFT JOIN rental
ON customer.customer_id = rental.customer_id
WHERE rental.rental_id IS NULL;
-- Explanation:
-- This query returns record of customers who haven't rented any movie

-- RIGHT JOIN using the same tables
SELECT customer.customer_id, customer.first_name, customer.last_name, rental.rental_id, rental.return_date
FROM customer
RIGHT JOIN rental
ON customer.customer_id = rental.customer_id;
-- Explanation:
-- This query retrieves all rentals and the customer information for each rental

-- Retrieve the description of all films, along with the return date
 SELECT film.title, film.description
 FROM film
 LEFT JOIN inventory ON film.film_id = inventory.film_id
 LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id; 
 -- Explanation:
 -- The query retrieves a list of all movie titles and description with their rental history. 
 
-- Write a query to select the store ID, and address of all stores, along with the staff first name and last name
SELECT store.store_id, address.address, staff.first_name, staff.last_name
FROM store
LEFT JOIN address ON store.address_id = address.address_id
LEFT JOIN staff ON staff.store_id = staff.store_id;
-- Explanation: The query retrieves the store_id, the full address of the store, and the names of the staff members assigned to those store

-- Using write a query to retrieve the first name, last name of all customers who have rented a film and the title of the film
SELECT c.first_name, c.last_name, f.title
FROM customer c
RIGHT JOIN rental r ON c.customer_id = r.customer_id
RIGHT JOIN inventory i ON i.inventory_id = r.inventory_id
RIGHT JOIN film f ON f.film_id = i.inventory_id;
-- Explanation:
-- The query retrieves the first name and last name of customers and the title of film they have rented

-- Write a query to retrieve the first name, last name, and email of all customers, along with the payment amount (if any).
SELECT c.first_name, c.last_name, c.email, p.amount
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id;
-- Explanation: The query retrieves customers' first_name, last_name and email along with their payment details
-- If a customer has not made any payment, the amount will be NULL, priority is given to the customer table, hence the use of LEFT JOIN
