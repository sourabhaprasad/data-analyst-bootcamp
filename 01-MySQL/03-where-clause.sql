-- COMPARISON OPERATORS
SELECT *
FROM employee_demographics 
WHERE first_name = 'Leslie';

SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_demographics
WHERE gender != 'Female';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-08-1';

-- LOGICAL OPERATORS : AND, OR, NOT
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-08-1'
AND gender = 'Male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-08-1'
OR gender = 'Male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-08-1'
OR NOT gender = 'Male';

-- isolated conditional statement & pedmas
SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) 
    OR age > 55;


-- LIKE STATEMENT
-- % : anything [zero or more characters]
-- _ : a specific value   
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A__';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A__%';