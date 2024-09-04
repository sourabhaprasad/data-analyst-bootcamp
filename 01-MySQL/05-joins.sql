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