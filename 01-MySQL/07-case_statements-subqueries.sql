SELECT first_name, last_name, age,
    CASE
        WHEN age <= 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 50 THEN 'Old'
        WHEN age >= 50 THEN 'On Death''s Door'
    END AS Age_Bracket
FROM employee_demographics;


SELECT *
FROM ;


-- Pay Increase and Bonus
-- < 50k 5%
-- > 50k 7k
-- Finance Department 10%

SELECT first_name, last_name, salary, 
    CASE 
        WHEN salary < 50000 THEN salary + (salary*0.05) -- salary * 1.05
        WHEN salary > 50000 THEN salary + (salary*0.07) -- salary * 1.07
    END AS New_Salary,
    CASE 
        WHEN dept_id = 6 THEN salary * 0.10
    END AS Bonus
FROM employee_salary;

-- SUBQUERIES
-- WHERE clause
SELECT *
FROM employee_demographics
WHERE employee_id IN (
    SELECT employee_id
    FROM employee_salary
    WHERE dept_id = 1
)
ORDER BY employee_id;


-- SELECT statement 
SELECT first_name, last_name, salary,
(
    SELECT ROUND(AVG(salary), 2) Avg_salary
    FROM employee_salary
)
FROM employee_salary;


-- 
SELECT gender, ROUND(AVG(age),2) as avg_age, MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;


SELECT ROUND(AVG(avg_age),2), ROUND(AVG(max_age),2) -- AVG(`MAX(age)`) in MySQL
FROM (
    SELECT gender, 
        ROUND(AVG(age),2) as avg_age, 
        MAX(age) as max_age, 
        MIN(age) as min_age, 
        COUNT(age) as count
    FROM employee_demographics
    GROUP BY gender
) AS agg_table;

