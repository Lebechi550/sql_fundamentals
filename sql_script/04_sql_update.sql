-- UPDATE Statement 
-- In SQL, UPDATE statement is used to modify existing record in a table

-- UPDATE syntax:
-- UPDATE table_name
-- SET column1 = value1, column2 = value2...
-- WHERE condition;
-- The WHERE clause specifies which record(s) to be updated, if omitted, all records in the table will be updated. 

-- write a query to update the city of suppliers with null value to unknown
UPDATE supplier
SET city = "unknown"
WHERE city = "NULL";
-- Explanation:
-- The above query will update the supplier table by inserting 'Unknown' whereever the city is NULL in the table. 
-- To achieve that without using a KEY column, you have to run this command "SET SQL_SAFE_UPDATES =0", to enable 'Safe update mode' and "SET SQL_SAFE_UPDATES =1" to enable

UPDATE supplier
SET city = "unknown"
WHERE supplier_id = 19;
-- Explanation:-- The query will update the supplier table by inserting 'Unknown' only where the supplier_id = 19.
-- With the use of a KEY column in the WHERE clause, there won't be any need to disable 'Safe Update Mode' 

-- Write a query to update the supplier name with id 18 to Soft
UPDATE supplier
SET supplier_name = "Soft"
WHERE supplier_id = 18;
-- Explanation: 
-- The query changed the supplier name to Soft

-- Write a query to update the quantity of supplier_id 18  to 20
UPDATE supplier
SET quantity = 20
WHERE supplier_id = 18;
-- Explanation-- The query updates the supplier with ID 18

