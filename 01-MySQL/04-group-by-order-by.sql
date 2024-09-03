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