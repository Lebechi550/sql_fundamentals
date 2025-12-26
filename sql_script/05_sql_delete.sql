-- DELETE Statement is used to remove existing records from a table 
-- the syntax is:
-- DELETE FROM table WHERE condition
-- the WHERE condition specifies which record to be deleted. If you omit the WHERE clause, all the records in the table will be deleted.

-- Write a query to remove supplier_id 19 from the record. 
DELETE FROM supplier
WHERE supplier_id = 19;
-- Explanation:
-- The supplier table has a column named 'supplier_id
-- The query removes only the supplier whose id is 19

-- Write a query to remove supplier_id 2
DELETE FROM supplier
WHERE supplier_id = 2;
-- The supplier table has a column named 'supplier_id
-- The query removes only the supplier whose id is 2. 

-- Deleting all records
-- It is possible to delete all rows in a table without deleting the table itself. This means that the table structure, attributes, and indexes will be intact
-- Syntax:
-- DELETE FROM table_name

-- Write a query to delete records of supplier
DELETE FROM supplier;
-- Explanation:
-- The query removes every record from the supplier table.



