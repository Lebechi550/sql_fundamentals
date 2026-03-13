-- ALTER TABLE Statement
-- The ALLTER TABLE statement is used to add, delete, or modify an existing table. 
-- It is also used to add and drop various constraints on an existing table.

-- ALTER TABLE - ADD COLUMN
ALTER TABLE phone_accessories2
ADD COLUMN item_type VARCHAR(30);

ALTER TABLE phone_accessories2
ADD item_price decimal(10,2); 

-- Verify the table alter
DESCRIBE phone_accessories2;
-- You should see the new columns added and the data types.

-- ALTER TABLE - DROP COLUMN
ALTER TABLE phone_accessories2
DROP COLUMN item_type;
-- drops a single column

ALTER TABLE phone_accessories2
DROP COLUMN item_type,
DROP COLUMN item_price;
-- drops two columns in a single SQL statement.

-- ALTER TABLE - MODIFY COLUMN
ALTER TABLE phone_accessories2
MODIFY COLUMN item_price DECIMAL(6,2);

ALTER TABLE phone_accessories2
MODIFY COLUMN item_id BIGINT;
-- changed the data type of the specified column.

-- ALTER TABLE - RENAME COLUMN
ALTER TABLE phone_accessories
RENAME COLUMN item_price TO price;

  -- ALTER TABLE - RENAME TABLE
  ALTER TABLE phone_accessories
  RENAME TO accessories;

-- DROP Statement
-- In DROP Statement, order matters, always drop the table before you drop the database. If you drop the database first, you wipe out everything at once.

-- The DROP TABLE statement is used to delete an existing table in a database. Dropping a table will result in loss of complete information stored in the table.
DROP TABLE IF EXISTS accessories;
-- deletes the table and every data stored in it.
-- Using the 'IF EXISTS' clause allows scripts to be run multiple times without failing or throwing an error if the object has already been deleted.

-- DROP DATABASE is used to drop an SQL Database.
DROP DATABASE IF EXISTS lutech;
-- drops the database

-- TRUNCATE Statement
-- The TRUNCATE TABLE statement deletes the data inside a table, but not the table itself.
TRUNCATE TABLE phone_accessories;

