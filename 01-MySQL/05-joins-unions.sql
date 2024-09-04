-- INNER JOIN
SELECT *
FROM employee_demographics DEM
INNER JOIN employee_salary SAL
ON DEM.employee_id = SAL.employee_id;

SELECT DEM.employee_id, DEM.first_name, salary, occupation
FROM employee_demographics DEM
JOIN employee_salary SAL
ON DEM.employee_id = SAL.employee_id;


-- OUTER JOINS
-- LEFT JOIN
SELECT *
FROM employee_demographics DEM
LEFT JOIN employee_salary SAL
ON DEM.employee_id = SAL.employee_id;


-- RIGHT JOIN
SELECT *
FROM employee_demographics DEM
RIGHT JOIN employee_salary SAL
ON DEM.employee_id = SAL.employee_id;


-- OUTER JOIN
SELECT *
FROM employee_demographics DEM
FULL OUTER JOIN employee_salary SAL
ON DEM.employee_id = SAL.employee_id;


-- SELF JOIN
SELECT 
    emp1.employee_id emp_santa,
    emp1.first_name first_name_santa,
    emp1.last_name last_name_santa,

    emp2.employee_id emp,
    emp2.first_name first_name,
    emp2.last_name last_name
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id + 1 = emp2.employee_id;


-- Joining Multiple Tables
SELECT *
FROM employee_demographics DEM
INNER JOIN employee_salary SAL  
    ON DEM.employee_id = SAL.employee_id
INNER JOIN parks_departments PAR
    ON SAL.dept_id = PAR.department_id;


-- UNION
SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary;


-- UNION ALL
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;


-- UNION with WHERE clause
SELECT first_name, last_name, 'Old' as Label
FROM employee_demographics
WHERE age > 50
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' Label 
FROM employee_salary
WHERE salary > 70000;

SELECT first_name, last_name, 'Old Man' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION 
SELECT first_name, last_name, 'Old Lady' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' Label 
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;