-- LENGTH(): Calculates the length of a string
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;


-- UPPER and LOWER
SELECT UPPER(first_name)
FROM employee_demographics;

SELECT LOWER(first_name)
FROM employee_demographics;


-- TRIM(): This function is used to cut the given symbol from the string
SELECT TRIM(LEADING '0' FROM '000123');


-- LTRIM(): This function is used to cut the given sub string from the original string.
SELECT LTRIM('123123geeks', '123');


-- RTRIM(): This function is used to cut the given sub string from the original string.
SELECT RTRIM('geeksxyxzyyy', 'xyz');


-- LEFT(): This function is used to SELECT a sub string from the left of given size or characters.
-- RIGHT(): This function is used to SELECT a sub string from the right end of the given size.
-- SUBSTR(): This function is used to find a sub string from the a string from the given position.
SELECT first_name, LEFT(first_name, 4), SUBSTRING(CAST(birth_date AS TEXT), 6,2) birth_month
FROM employee_demographics;


SELECT first_name, REPLACE(first_name, 'a','A')
FROM employee_demographics;

SELECT POSITION('x' IN 'Alexander'); -- PostgreSQL specific
-- SELECT LOCATE('x', 'Alexander');

-- Concatenation
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;