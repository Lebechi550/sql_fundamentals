/*
CASE Statement
 In SQL, the CASE statement is a conditional expression that functions like if-then-else logic.
 It evaluates multiple conditions sequentially and returns a specific value as soon as the first condition is met.
 Basic syntax
 A CASE statement must sttart with the keyword CASE and end with END. It uses WHEN to define the condition and THEN to specify the result. 
*/
CASE
	WHEN condition1 THEN result1
	WHEN  condition2 THEN result2
	WHEN condition3 THEN result3
	ELSE result
END;
/*
Common use cases:
 1 Categorizing Data: Assigning labels like 'High', 'Medium' or 'Low' based on numeric ranges
 2 Standardizing Values: Converting abbreviations (e.g 'M' and 'F' ) into full text ('Male' and 'Female') for reports
 3 Aggregate logic: Using CASE inside functions like SUM() OR COUNT() to calculate specific totals (e.g counting donors from different states or job_fields at the same time). 
 4 Custom Sorting: Using it in an ORDER BY clause to prioritize specific rows, such as placing null values at the bottom or prioritizing "Critical" tasks.
 5 Dynamic Updates: Setting new values in an UPDATE statement based on specific row criteria
*/

-- Data categorization using CASE:
-- Write a query to categorize donors into 3 specific tiers based on their donation amount
SELECT CONCAT_WS(' ', first_name, last_name) AS full_name, donation,
CASE
	WHEN donation >= 400 THEN 'Top_tier' 
	WHEN donation >= 300 THEN 'second_tier'
ELSE 'third_tier'
END AS donor_status
FROM donation_data;
/*
Explanation:
Write a query to segment a donor list into specific performance tiers based on their contribution levels for targeted outreach
*/

/*
 Data Standardization using CASE:
 Write a query to standardize long job fields and state full-names into consistent abbreviations for cleaner, professional reporting.
*/
SELECT DISTINCT state FROM donation_data; -- Audit the data to check for inconsistencies
SELECT CONCAT_WS(' ' , first_name, last_name) AS full_name, state, job_field,
CASE 
WHEN job_field = 'Human Resources' THEN 'HR'
WHEN job_field = 'Research and Development' THEN 'RD'
WHEN job_field = 'Business Development' THEN 'BD'
ELSE job_field
end AS job_field_abbrev,
CASE 
WHEN state = 'New York' THEN 'NY'
WHEN state = 'New Hampshire' THEN 'N-H'
WHEN state = 'Washington' THEN 'W.D'
WHEN state = 'New Mexico' THEN 'N-M'
WHEN state = 'District of Columbia' THEN 'D-C'
WHEN state = 'North Carolina' THEN 'N-c'
WHEN state = 'West Virginia' THEN 'W-V'
ELSE state
END AS state_abbreviation
FROM donation_data
ORDER BY state_abbreviation, job_field_abbrev;
/*
Explanation:
This query demonstrates Data Normalization and String Standardization. 
 By using CASE statements, we transform lengthy strings—such as 'Human Resources' and 'District of Columbia'—into standardized abbreviations
*/
-- Aggregate logic with CASE:
-- Write a query to count the number of donors from multiple different job fields and display them all in a single row
SELECT 
SUM(CASE WHEN job_field = 'Human Resources' THEN 1 ELSE 0 END) AS HR_donors,
SUM(CASE WHEN job_field = 'Engineering' THEN 1 ELSE 0 END) AS Eng_donors,
SUM(CASE WHEN job_field = 'Sales' THEN 1 ELSE 0 END) AS sales_donors,
SUM(CASE WHEN job_field = 'Business Development' THEN 1 ELSE 0 END) AS business_donors,
SUM(CASE WHEN job_field = 'Legal' THEN 1 ELSE 0 END) AS legal_donors,
SUM(CASE WHEN job_field = 'Marketing' THEN 1 ELSE 0 END) AS mkt_donors,
SUM(CASE WHEN job_field = 'Services' THEN 1 ELSE 0 END) AS service_donors,
SUM(CASE WHEN job_field = 'Accounting' THEN 1 ELSE 0 END) AS account_donors,
SUM(CASE WHEN job_field = 'Research and Development' THEN 1 ELSE 0 END) AS research_donors,
SUM(CASE WHEN job_field = 'Training' THEN 1 ELSE 0 END) AS training_donors,
SUM(CASE WHEN job_field = 'Support' THEN 1 ELSE 0 END) AS support_donors,
SUM(CASE WHEN job_field = 'Product Management' THEN 1 ELSE 0 END) AS product_donors
FROM donation_data;
/*
Explanation:
This query uses CASE statements nested inside SUM functions to perform conditional counting. Instead of filtering the entire dataset for one field at a time, 
the query scans the table once and evaluates each row. If the job_field matches (e.g., 'Engineering'), it adds 1 to that specific total; otherwise, it adds 0. 
This technique is ideal for comparing multiple metrics side-by-side in a single result set.
*/

-- Conditional Summation of Values
-- Write a query to calculate the total donations for multiple departments simultaneously and display them as separate columns
SELECT 
SUM(CASE WHEN job_field = 'Human Resources' THEN donation ELSE 0 END) AS HR_donation,
SUM(CASE WHEN job_field = 'Engineering' THEN donation ELSE 0 END) AS Eng_donation,
SUM(CASE WHEN job_field = 'Sales' THEN donation ELSE 0 END) AS sales_donation,
SUM(CASE WHEN job_field = 'Business Development' THEN donation ELSE 0 END) AS business_donation,
SUM(CASE WHEN job_field = 'Legal' THEN donation ELSE 0 END) AS legal_donation,
SUM(CASE WHEN job_field = 'Marketing' THEN donation ELSE 0 END) AS mkt_donation,
SUM(CASE WHEN job_field = 'Services' THEN donation ELSE 0 END) AS service_donation,
SUM(CASE WHEN job_field = 'Accounting' THEN donation ELSE 0 END) AS account_donation,
SUM(CASE WHEN job_field = 'Research and Development' THEN donation ELSE 0 END) AS research_donation,
SUM(CASE WHEN job_field = 'Training' THEN donation ELSE 0 END) AS training_donation,
SUM(CASE WHEN job_field = 'Support' THEN donation ELSE 0 END) AS support_donation,
SUM(CASE WHEN job_field = 'Product Management' THEN donation ELSE 0 END) AS product_donation
FROM donation_data;
/*
Explanation:
 This query uses CASE statements within SUM functions to calculate department-specific financial totals in a single result set. 
 Key Logic:
 Instead of just counting entries, it checks if a row belongs to a specific 'job_field'.
 If true, it adds the actual 'donation' value to that column's running total. 
 This allows for an instant side-by-side comparison of total revenue across all departments.
*/
-- Custom Sorting with CASE:
-- Write a query to prioritize "Human Resources" in a report, placing  at the top and "Accounting" at the bottom, while others by donation amount. 
SELECT first_name,  donation, job_field
FROM donation_data
ORDER BY
	CASE 
		WHEN job_field = 'Human Resources' THEN 1
        WHEN job_field = 'Accounting' THEN 3
        ELSE 2
        END,
        donation DESC;
/*
Explanation:
 This query utilizes a CASE statement within the ORDER BY clause to create a non-alphabetical sort order. By assigning numeric values (1, 2, 3) to specific job fields, 
 we force "Human Resources" to the top of the list and "Accounting" to the bottom. All other fields are assigned a value of 2 to sit in the middle. Finally, a secondary sort of donation DESC is applied, ensuring that within those categories, the highest donations appear first.     
*/     

/*
 Dynamic Update with CASE:
 Write a query to categorize donors into membership tiers based on their donation
 Note: The 'donor_tier' column must exist or be added via ALTER TABLE before running this
*/
UPDATE donation_data
SET donor_tier = CASE
	WHEN  donation >= 500 THEN 'Platinum'
    WHEN donation >= 200 THEN 'Gold'
    WHEN donation >= 100 THEN 'Silver'
    ELSE 'Bronze'
    END;
-- Explanation:
-- This query performs a dynamic update by evaluating each donation value and assigning a corresponding rank to the donor_tier column. 
-- By using a CASE statement, multiple conditions are handled in a single pass of the database, ensuring that every donor is categorized correctly—from 'Platinum' for high-value contributors down to 'Bronze' for entry-level donors.    
