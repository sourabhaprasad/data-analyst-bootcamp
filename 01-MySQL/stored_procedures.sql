SELECT *
FROM employee_salary
WHERE salary >= 60000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 60000;

CALL large_salaries();


-- if we tried to add another query to this stored procedure it wouldn't work. It's a separate query:
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 60000;
SELECT *
FROM employee_salary
WHERE salary >= 50000;


-- Best practice is to use a delimiter and a Begin and End 
DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$
DELIMITER ;


CALL large_salaries2();

USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_order_totals3`;
DELIMITER $$
CREATE PROCEDURE large_order_totals3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$

DELIMITER ;


CALL large_order_totals3();

-- adding parameters
USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_salaries3`;
DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000
    AND employee_id_param = employee_id;
END $$

DELIMITER ;

CALL large_salaries3(1);