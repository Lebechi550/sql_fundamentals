/*
SQL constraints are used to specify rules for data in a table
Constraints can be specified at the point of table creation with CREATE TABLE statement or 
After table creation with ALTER TABLE statement
Constraints determine the type of data that can go into a table, ensuring its accuracy and reliability. 
*/
-- Types of constraints:
-- NOT NULL: Ensures that a column cannot have a NULL value. 
-- UNIQUE: Ensures that all values in a column are different.
-- PRIMARY KEY: A combination of NOT NULL and UNIQUE. Uniquely identifies each row in a table. 
-- FOREIGN KEY: Prevents actions that would destroy links between table. 
-- CHECK: Ensures that the values in a column satisfies a specific condition.
-- DEFAULT: Sets a default value for a column if no value is specified. 


-- NOT NULL Constraint on CREATE TABLE
CREATE TABLE phone_accessories(
item_id BIGINT NOT NULL,
item_type VARCHAR(50),
item_name VARCHAR(100) NOT NULL
);

-- NOT NULL - ALTER TABLE
ALTER TABLE phone_accessories
MODIFY item_type varchar(70) NOT NULL;


-- UNIQUE Constraint - CREATE TABLE

DROP TABLE IF EXISTS phone_accessories; -- Drop phone_accessories to practice UNIQUE constraint.

CREATE TABLE phone_accessories(
item_id BIGINT NOT NULL,
item_type VARCHAR(50),
item_name VARCHAR(100) NOT NULL,
CONSTRAINT unique_id UNIQUE (item_id)
); -- Recreating the table to implement UNIQUE constraint on 'item_id'

-- verify that the new table created
SHOW TABLES; -- You will see 'phone_accossries' in the list of tables

-- 'Reset' the table to practice UNEIQUE constarint on ALTER TABLE
ALTER TABLE phone_accessories
DROP INDEX unique_id;
-- UNIQUE Constraint - ALTER TABLE
ALTER TABLE phone_accessories
ADD CONSTRAINT unique_id UNIQUE (item_id);

-- Multicolumn (Composite) UNIQUE Constraint 
ALTER TABLE phone_accessories
ADD CONSTRAINT unique_id_type UNIQUE (item_id, item_type); -- Ensures that the combination of item_id & item_type is unique

SHOW INDEX FROM phone_accessories;-- Verify the constraint


-- PRIMARY KEY Constraint - A combination of NOT NULL and UNIQUE constraints.

DROP TABLE IF EXISTS phone_accessories; -- Drop phone_accessories to practice PRIMARY KEY constraint on CREATE TABLE.

CREATE TABLE phone_accessories(
item_id BIGINT,
item_type VARCHAR(50),
item_name VARCHAR(100) NOT NULL,
CONSTRAINT PK_id PRIMARY KEY (item_id)
);-- Recreating the table to implement PRIMARY KEY on 'item_id'

describe phone_accessories; -- To see the structure of the table

-- Drop PRIMARY KEY constraint to practice it on ALTER TABLE.
ALTER TABLE phone_accessories
DROP PRIMARY KEY;

-- PRIMARY KEY on ALTER TABLE
ALTER TABLE phone_accessories
ADD CONSTRAINT PK_id PRIMARY KEY (item_id);


-- FOREIGN KEY Constraint

CREATE TABLE customers (
customer_id INT,
item_id BIGINT NOT NULL,
customer_name VARCHAR(150) NOT NULL,
business_name VARCHAR(200),
address VARCHAR(200),
city VARCHAR(90) NOT NULL,
region VARCHAR(50) NOT NULL,
CONSTRAINT PK_CUSTOMERS PRIMARY KEY (customer_id),
CONSTRAINT KF_CUSTOMERS FOREIGN KEY (item_id) REFERENCES phone_accessories(item_id)
);

DESCRIBE customers;-- To see the structure of the table
SHOW INDEX FROM customers; -- Verify the constraints

-- Rnaming a FOREIGN KEY constraint
ALTER TABLE customers
DROP FOREIGN KEY KF_CUSTOMERS,
ADD CONSTRAINT FK_CUSTOMERS FOREIGN KEY (item_id) REFERENCES phone_accessories(item_id);

-- FOREIGN KEY Constraint on ALTER TABLE
ALTER TABLE customers
ADD CONSTRAINT FK_CUSTOMERS FOREIGN KEY (item_id) REFERENCES phone_accessories(item_id);

-- Dropping a FOREIGN KEY Constraint
ALTER TABLE customers
DROP FOREIGN KEY Fk_CUSTOMERS; 

-- Verify the constraint
SHOW INDEX FROM phone_accessories;


-- CHECK Constraint

CREATE TABLE accessory_suppliers(
accessory_supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(150) NOT NULL,
quantity INT NOT NULL,
price DECIMAL (10,2),
address VARCHAR(200),
city VARCHAR(60) NOT NULL,
region VARCHAR(70) NOT NULL,
CONSTRAINT CK_PRICE CHECK (price >= 100)
); -- Created a new table to implement CHECK constraint on price - ensuring no item price below 100

-- insert values to verify the CHECK constraint
INSERT INTO accessory_suppliers(accessory_supplier_id, supplier_name, quantity, price, address, city, region)
VALUES(1, 'Ucheson', 5, 20, '21 Mercy-Merry Lane', 'Satellite', 'South-East');-- an error occurred 'CK_PRICE' is violated

-- CHECK Constraint - ALTER TABLE
ALTER TABLE accessory_suppliers
ADD CONSTRAINT CK_PRICE CHECK (price >= 100);

ALTER TABLE accessory_suppliers
ADD CONSTRAINT CK_PRICE_QTY CHECK (price >= 100 AND quantity >0); -- multiple column CHECK with a sigle query 

-- Verify the CHECK constraint
INSERT INTO accessory_suppliers(accessory_supplier_id, supplier_name, quantity, price, address, city, region)
VALUES(10, 'Vesco', 10, 50, '21 Mercy-Merry Lane', 'Satellite', 'South-East'); -- Throws an error too

-- Verify the CHECK constraint

SHOW CREATE TABLE accessory_suppliers; 

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'accessory_suppliers'
AND CONSTRAINT_TYPE = 'CHECK';

-- DROP  CHECK constraint
ALTER TABLE accessory_suppliers
DROP CHECK CK_PRICE;


-- DEFAULT Constraint

DROP TABLE IF EXISTS accessory_suppliers; -- Drop the table to practice DEFAULT Constraint

CREATE TABLE accessory_suppliers(
accessory_supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(150) NOT NULL,
quantity INT NOT NULL,
price DECIMAL (10,2) DEFAULT 1000,
address VARCHAR(200),
city VARCHAR(60) NOT NULL,
region VARCHAR(70) NOT NULL DEFAULT 'Unknown',
CONSTRAINT CK_PRICE CHECK (price >= 1000)
); -- Recreating the table to implement DEFAULT values for 'price', and 'region'columns
 
 -- DEFAULT on ALTER TABLE
 ALTER TABLE accessory_suppliers
 ALTER COLUMN city SET DEFAULT 'Unspecified',
 ALTER COLUMN quantity SET DEFAULT 1; -- Sets defualt values for 'city' and 'quantity'

DESCRIBE accessory_suppliers; -- Verify DEFAULT constraint

-- DROP a DEFAULT Constraint
ALTER TABLE accessory_suppliers
ALTER city DROP DEFAULT;




