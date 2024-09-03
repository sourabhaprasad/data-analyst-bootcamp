-- GROUP BY
-- AVG age per gender
SELECT gender, ROUND(AVG(age),2)
FROM employee_demographics 
GROUP BY gender;

SELECT gender, ROUND(AVG(age),2), COUNT(age)
FROM employee_demographics 
GROUP BY gender;

SELECT gender, ROUND(AVG(age),2), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics 
GROUP BY gender;


-- ORDER BY 
SELECT *
FROM employee_demographics
ORDER BY first_name;

SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;

-- using column position
SELECT *
FROM employee_demographics
ORDER BY 5, 4;



-- HAVING vs WHERE
SELECT occupation, ROUND(AVG(salary), 2)
FROM employee_salary
GROUP BY occupation;

SELECT occupation, ROUND(AVG(salary), 2)
FROM employee_salary
WHERE occupation LIKE '%Manager%'
GROUP BY occupation;

SELECT occupation, ROUND(AVG(salary), 2)
FROM employee_salary
WHERE occupation LIKE '%Manager%'
GROUP BY occupation
HAVING AVG(salary)>70000;

SELECT occupation, ROUND(AVG(salary), 2)
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary)>70000;


-- LIMIT
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;



-- ALIASING
SELECT occupation, ROUND(AVG(salary), 2) AS avg_salary
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary)>70000;