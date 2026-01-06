-- SQL operators

-- 1.  Arithmetic Operators: Used to perform mathematic calculations on numeric data
/*
+ (addition): adds values
- (Subtraction): Subtracts the right operand from the left.
* (Multiplication): Multiplies two numbers.
/ (Division): Divides the left operand by the right.
% (Modulus): Returns the remainder of a division
*/

-- Examplary use of arithmetic operators in sql
SELECT 40 + 10 AS add_num;

SELECT id, donation + 20 AS increased_donation
FROM donation_data
WHERE id = 1;
/*
Explanation:
This query produces a result showing the increased donation value for a specific donor record.
The output displays the unique ID alongside a modified donation amount that has been increased by 20,
providing an instant view of the total contribution after a flat-rate addition.
*/

SELECT id, donation - 20 AS reduced_donation
FROM donation_data
WHERE id = 1;
/*
Explanation:
This query produces a result showing the adjusted financial value for a specific donor record.
The output displays the unique ID alongside a modified donation amount that has been reduced by 20, providing an instant view of the net contribution after a flat-fee deduction.
*/

SELECT id, round( donation/ 2, 2)
FROM donation_data
WHERE id = 1;
/*Explanation:
This query produces a calculated result for the record (id 1) by dividing the donation amount by 2.
 The output displays the unique ID alongside the modified value, which is restricted to two decimal places to ensure a clean format. 
*/

SELECT id, donation % 2
FROM donation_data
WHERE id = 1;
/*
Explanation:
This query produces a result showing the remainder of a division operation for a specific record. 
The output displays the unique ID alongside the leftover value after the donation amount is divided by two, providing an instant view of the parity or residual balance of the contribution. 
*/

-- 2.  Comparison Operators: Used to compare 2 values, returning a boolean result(TRUE, FALSE, or UNKNOWN)
/*
= (Equal to): Checks if values are identical.
!= or <> (Not equal to): Checks if values are different.
> and < (Greater/Less than): Compares magnitude.
>= and <= (Greater/Less than or equal to): Includes boundary values.
*/
-- Examplary use of comparison operators
SELECT * 
FROM donation_data
WHERE donation = 500;
/*
Explanation: 
This query retrieves all records from the donation_data table where the donation amount is exactly 500.
The results are sorted numerically by their unique id in ascending order to ensure a structured and predictable output. 
*/

SELECT * 
FROM donation_data
WHERE donation != 500
ORDER BY id;
/*
Explanation: 
This query retrieves all records from the donation_data table where the donation amount is not 500.
The results are sorted numerically by their unique id in ascending order to ensure a structured and predictable output. 
*/

SELECT * 
FROM donation_data
WHERE donation > 500
ORDER BY id;
/*
Explanation: 
This query retrieves all records from the donation_data table where the donation amount is greater than 500.
The results are sorted numerically by their unique id in ascending order to ensure a structured and predictable output. 
*/

SELECT * 
FROM donation_data
WHERE donation < 10
ORDER BY id;
/*
Explanation: 
This query retrieves all records from the donation_data table where the donation amount is less than 10
The results are sorted numerically by their unique id in ascending order to ensure a structured and predictable output. 
*/

SELECT * 
FROM donation_data
WHERE donation >= 500
ORDER BY id;
/*
Explanation: 
This query retrieves all records from the donation_data table where the donation amount is 500 or more (inclusive of 500).
The results are sorted numerically by their unique id in ascending order to ensure a structured and predictable output. 
*/

SELECT * 
FROM donation_data
WHERE donation <= 5
ORDER BY id;
/*
Explanation: 
This query retrieves all records from the donation_data table where the donation amount is 5 or less (inclusive of 5).
The results are sorted numerically by their unique id in ascending order to ensure a structured and predictable output. 
*/

