-- COMMON TABLE EXPRESSIONS
WITH CTE_example AS
(
    SELECT gender, ROUND(AVG(salary),2) as avg_salary, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender)
SELECT AVG(avg_salary)
FROM CTE_example;


WITH CTE_Example AS 
(
    SELECT employee_id, gender, birth_date
    FROM employee_demographics dem
    WHERE birth_date > '1985-01-01'
), 
CTE_Example2 AS 
(
    SELECT employee_id, salary
    FROM parks_and_recreation.employee_salary
    WHERE salary >= 50000
)
SELECT *
FROM CTE_Example cte1
LEFT JOIN CTE_Example2 cte2
	ON cte1. employee_id = cte2. employee_id;



WITH CTE_Example (gender, sum_salary, min_salary, max_salary, count_salary) AS 
(
    SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT gender, ROUND(AVG(sum_salary/count_salary),2)
FROM CTE_Example
GROUP BY gender;



-- TEMPORARY TABLE: automatically deleted as soon as the connection is terminated
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM salary_over_50k;