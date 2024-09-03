SELECT *
FROM employee_demographics;

SELECT first_name
FROM employee_demographics;

SELECT first_name, last_name, birth_date
FROM employee_demographics;

SELECT * 
FROM employee_salary;

SELECT *
FROM parks_departments;

-- PEMDAS: Parantheses, Exponential, Multiplication, Division, Addition, Subtraction
SELECT first_name, last_name, salary, (salary * 1.1)+10000
FROM employee_salary;

-- Selects DISTINCT values from a column
SELECT DISTINCT gender
FROM employee_demographics;