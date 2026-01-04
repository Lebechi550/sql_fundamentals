-- INSERT INTO SELECT Statement:
-- It copies data from one source table and inserts it directly into an existing target table in a single command.
-- INSERT INTO SELECT is used during:
-- Data Migration & Transformation: Moving data between different database schemas or systems.
-- Archiving: Transferring older or inactive records from operational tables to a dedicated archive table.
-- Creating Backups: Saving a snapshot of a table's current state into a backup table.
-- Reporting: Populating specialized reporting or summary tables with aggregated data for faster business intelligence queries.
-- Consolidating Data: Merging datasets from multiple sources into a single master table using JOIN or UNION logic.

-- INSERT INTO SELECT syntax: 
INSERT INTO table2 (column1, column2, column3, .....)
SELECT column1, column2, column3, .....
FROM table1
WHERE condition;

INSERT INTO Michigan_donors
SELECT *
FROM donation_data
WHERE state = 'Michigan';
-- Explanation:
-- The query creates a dedicated list of all donors from Michigan by copying their existing information into a separate table for easier access and reporting.

-- Write a query to create a list of donors who contributed a minimum of 500
INSERT INTO top_donors ( 
	first_name, last_name, state, job_field
)
    SELECT 
    first_name, last_name, state, job_field
FROM donation_data
WHERE donation >= 500;
-- Explanation:
-- The query creates a dedicated list of all donor whose donation is 500 and above by copying their existing information into a separate table for easier access and reporting,

-- WRITE a query to create a list of donors who do no have a university name
INSERT INTO null_university_donors (first_name, last_name, state, job_field, donation)
SELECT (d.first_name, d.last_name, d.state, d.job_field, d.donation)
FROM donation_data d
JOIN donor_data2 dd ON d.id = dd.id
WHERE university IS NULL;
-- Explanation:
-- The query creates a dedicated list of all donors where university is null. 
