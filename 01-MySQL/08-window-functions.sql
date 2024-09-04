-- WINDOW FUNCTIONS

SELECT dem.first_name, dem.last_name, gender, AVG(salary) avg_salary
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id
GROUP BY dem.first_name, dem.last_name, gender;

SELECT dem.first_name, dem.last_name, gender, salay, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;


SELECT dem.first_name, dem.last_name, gender, salary, SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;

-- ROLLING TOTAL : starts at a specific value and adds on the subsequent rows based off on the partitions
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
    SUM(salary) OVER(PARTITION BY gender ORDER BY dem.first_name) as rolling_total
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;

-- ROW_NUMBER() : unique
-- RANK() : if there are duplicates, rank() repeats the index number. while assigning the next number, the next number is not going to the next number numerically but the next number positionally.
-- DENSE_RANK() : gives the next number numerically but not positionally
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) as row_num,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num,
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as dense_rank_num
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;


-- LEAD() & LAG()
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
   LEAD(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as next_emp_salary,
   LAG(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as prev_emp_salary
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
   LEAD(salary,2,0) OVER(PARTITION BY gender ORDER BY dem.employee_id) as next_emp_salary,  
   LAG(salary,2,0) OVER(PARTITION BY gender ORDER BY dem.employee_id) as prev_emp_salary
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;



SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
   LAG(salary,1,0) OVER(PARTITION BY gender ORDER BY dem.employee_id) as prev_emp_salary,
   CASE 
        WHEN salary > LAG(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) THEN 'Higher than previous employee'
        WHEN salary < LAG(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) THEN 'Lower than previous employee'
        WHEN salary = LAG(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) THEN 'Same as previous employee'
    END AS sal_range
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;



SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
   LAG(salary,1,0) OVER() as prev_emp_salary,
   CASE 
        WHEN salary > LAG(salary) OVER() THEN 'Higher than previous employee'
        WHEN salary < LAG(salary) OVER() THEN 'Lower than previous employee'
        WHEN salary = LAG(salary) OVER() THEN 'Same as previous employee'
    END AS sal_range
FROM employee_demographics DEM
JOIN employee_salary SAL
    ON DEM.employee_id = SAL.employee_id;