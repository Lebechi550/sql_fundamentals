-- EXISTS: 
-- EXISTS operator is used within a WHERE clause to test for the presence of records in a subquery
-- Find donors who have a university record.
SELECT first_name, last_name, state, job_field
FROM donation_data 
WHERE EXISTS (
	SELECT university FROM donor_data2 WHERE donation_data.id = donor_data2.id AND university IS NOT NULL
    )
ORDER BY first_name;
-- Explanation:
-- The query returns a list of donors who have a confirmed university name recorded, excluding any donors who are either missing from the university table or have an empty (NULL) university field.

-- Find donor whose second language is 'Mongolian'
SELECT first_name, last_name, state
FROM donation_data d
WHERE EXISTS(
	SELECT 1
    FROM donor_data2 dd
    WHERE d.id = dd.id
    AND second_language = 'Mongolian'
);
-- Explanation:
-- The query returns the specified columns for the donor(s) whose second_language is 'Mongolian'

-- Find anyone in the donor_data2 table who hasn't made any donation
SELECT id, university, donation_frequency
FROM donor_data2 dd
WHERE NOT EXISTS(
	SELECT 1
    FROM donation_data d
    WHERE d.id = dd.id
);
-- Explanation:
-- The query retriveves the specified columns for anyone in the donor_data2 table who has not made any donation 

-- Find the detials of donors who onws Hyundai
SELECT * 
FROM donation_data d
WHERE EXISTS(
	SELECT 1
    FROM donor_data2 dd
    WHERE d.id = dd.id
    AND car = 'Hyundai'
);
-- Explanation:
-- The query returns the details of every donor who owns an Hyundai car.

-- Find the details of donors who have made more than one donation
SELECT *
FROM donation_data d1
WHERE EXISTS (
	SELECT 1
    FROM donation_data d2
    WHERE d1.id = d2.id
    GROUP BY id
    HAVING COUNT(*) >1
);
-- Explanation:
-- The qeury returns the details of any donors who has donated at least twice. 
