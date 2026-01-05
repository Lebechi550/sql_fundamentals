
-- NULL functions
/*
In SQL, NULL functions are specialized tools used in handling "missing" or "unknown" data.
Essential SQL NULL functions include:
1. COALESCE(Val1, val2,....):This is the most flexible and widely used functions. It returns the first non-NULL value in its list of argument
	usage: In  providing fallback values. e.g: COALESCE(university, 'unknown). COALESCE(state, 'others')
2. IFNULL(expression, alt_value): Used primarily in MySQL and SQLite. It returns the alternative value only if the first expression is NULL.
	e.g: IFNULL(donation, 0)
3. ISNULL(expression, alt_value): Specifically for Microsoft SQL Server (T-SQL). It replaces NULL with a specified replacement value. It returns a boolean(1 if NULL, 0 if not)
4. NULLIF(val1, val2): Returns NULL if two expressions are equal; otherwise, it returns the first value.
	usage: "preventing division by zero" errors by converting a 0 denominator into NULL
5. NVL(expression, alt_value): The Oracle-specific version of IFNULL or ISNULL.    
*/

SELECT DISTINCT university FROM donor_data2; -- Audit the data to check for inconsistencies
SELECT CONCAT_WS(' ', d.first_name, d.last_name) AS full_name, COALESCE(dd.university, 'unknown') AS cleaned_university
FROM donation_data d 
JOIN donor_data2 dd
ON d.id = dd.id
WHERE job_field = 'Human Resources';  
/*
Explanation:
This query retrieves a comprehensive report that enriches donor profiles by linking their identity and job field to their educational background.
The output provides a clear, unified view of the Human Resources department, where every donor is matched with their respective university.
 By using null-handling logic, the result ensures that any missing university data is represented as "unknown".
*/

