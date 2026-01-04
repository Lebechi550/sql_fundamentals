SQL JOINS
A join is a clause used to combine rows from two or more tables in a relational database based on a related column between them 
  (e.g, a primary key and foreign key relationship). This allows you to retrieve data that is logically separated into different table into a single, unified result set.
  
Types of joins supported in MySQL are:
  * INNER JOIN: Returns records that have matching values in both tables
  * LEFT JOIN: Returns all records from the left table, and the matched records from the right table
  * RIGHT JOIN: Returns all records from the right table, and the matched records from the left table.
  * CROSS JOIN: Returns all records from both tables
  * SELF JOIN: Joins a table to itself using table aliases to treat it as two distinct tables (e.d finding donors who are from the same state)
