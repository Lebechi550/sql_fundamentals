-- MySQL AUTO_INCREMENT
CREATE TABLE orders(
orders_id BIGINT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
item_id BIGINT NOT NULL,
quantity INT NOT NULL,
unit_price DECIMAL (10,2) NOT NULL,
CONSTRAINT FK_CUST FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
CONSTRAINT FK_ITEM FOREIGN KEY (item_id) REFERENCES phone_accessories (item_id),
CONSTRAINT CK_ORDER_PRICE CHECK (unit_price>0)
); -- implementing AUTO_INCREMENT on orders_id column. 

-- To let the AUTO_INCREMENT start with another value - 100
ALTER TABLE orders AUTO_INCREMENT = 100;


-- MySQL DATE Data Type
/*
The following are the data types for storing a date or a date/time value in the database
- DATE: format YYYY-MM-DD
DATETIME: format YYYY-MM-DD HH:MM:SS
TIMESTAMP: format YYYY-MM-DD HH:MM:SS
YEAR: format YYYY or YY
*/
-- Date values are enclosed in quotes - preferably single quotes to ensure cross-database compatibility

-- DROP orders table to practice DATE data type
DROP TABLE IF EXISTS orders;

-- Recreate the table to implement DATE data type
CREATE TABLE orders(
orders_id BIGINT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
item_id BIGINT NOT NULL,
orders_date DATE DEFAULT (CURRENT_DATE),
payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
quantity INT NOT NULL,
unit_price DECIMAL (10,2) NOT NULL,
CONSTRAINT FK_CUST FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
CONSTRAINT FK_ITEM FOREIGN KEY (item_id) REFERENCES phone_accessories (item_id),
CONSTRAINT CK_ORDER_PRICE CHECK (unit_price>0)
); 
-- The orders_date is set to a default value of current_date to simplify calendar-based reporting, 
-- and the payment_date to current_timestamp to ensure a precise timestamp for financial reconciliation and fraud prevention.

DESCRIBE orders; -- To see the structure of the table



-- MySQL VIEWS
-- In SQL, a view is a virtual table based on the result-set of an SQL statement. 
-- A view always shows up-to-date data and this is because the database engine recreates the result every time the view is queried. 
CREATE VIEW march_orders AS
SELECT * 
FROM orders
WHERE orders_date BETWEEN '2026-03-01' AND '2026-03-31';
-- To use this view, simply run: SELECT * FROM march_orders. 
 
-- Updating a VIEW
CREATE OR REPLACE VIEW march_orders AS
SELECT orders_id, customer_id, item_id, orders_date, payment_date, quantity, unit_price, (quantity*unit_price) AS total_order_value -- Added calculation
FROM orders
WHERE orders_date BETWEEN '2026-03-01' AND '2026-03-31'
ORDER BY orders_date DESC;
-- To use this view, simply run: SELECT * FROM march_orders. 

CREATE OR REPLACE VIEW middle_range_orders AS
SELECT orders_id, customer_id, item_id, orders_date, quantity, unit_price, (quantity*unit_price) AS total_order_value -- Added calculation
FROM orders
WHERE quantity*unit_price BETWEEN 5000000 and 10000000
ORDER BY total_order_value ASC;
-- To use this view, simply run: SELECT * FROM middle_range_orders

-- Dropping a view
DROP VIEW middle_range_orders;

