 -- INSERT INTO 
 -- In SQL, INSERT INTO statement is used to add new records into an existing table
 
 -- Write a query to insert a new record into the supplier table
 INSERT INTO supplier (supplier_id, supplier_name, supplier_address, city, region, quantity)
 VALUES(14, "Pine n' Juice", "23 Genesis", "Awada", "East", 40);
 -- Explanation: The supplier table has columns named 'supplier_id', 'supplier_name', 'supplier_address', 'city', 'region', 'quantity'
 -- The query adds a single new record into the supplier table
 
 -- Write a query to add 3 new records to the supplier table
 INSERT INTO supplier (supplier_id, supplier_name, supplier_address, city, region, quantity)
 VALUES (15, "Queen-Digit", "4 Kuka Drive", "Fegge", "East", 70), (16, "Flushy", "Rd 203 New Era", "Festac", "West", 180),
		(17,"High-Taste", "12 Kanu Lane", "Duma", "North", 30);
 -- Explanation:  -- The supplier table has columns named 'supplier_id', 'supplier_name', 'supplier_address', 'city', 'region', 'quantity'
 -- The query adds 3 new records into the supplier table
 
 -- Write a query to insert specified columns
 INSERT INTO supplier (supplier_name, supplier_address, city, region)
 VALUE ("Sodft", "13 Lumac", "Satellite", "South");
 INSERT INTO supplier (supplier_name, supplier_address, region)
 VALUES ("Wak", " 11 New Rd", "South");
 -- The above queries insert values to the specified columns
 
 -- NULL
 -- In SQL, NULL represents missing or undefined value. NULL is different from zero, an empty string or any other default value
 -- A field with a NULL value is one that has been left blank during record creation
 -- If a field in a table is optional, then you can insert a new record or update a record without adding a value to this field and the field will be saved with a NULL as value 
 -- To test for NULL value, we use 'IS NULL' and 'IS NOT NULL' operators
 
 -- Select all records from the supplier where the city column is empty
 SELECT * 
 FROM supplier
 WHERE city IS NULL;
 -- Explanation: The query retrieves all the columns for the records where city IS NULL
 
 -- Write a query to find record of suppliers where city is not null
 SELECT * 
 FROM supplier
 WHERE city IS NOT NULL;
  -- Explanation: The query retrieves all the columns for the records where city IS NOT NULL

