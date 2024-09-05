-- Create and Bind the Trigger
CREATE OR REPLACE FUNCTION auditlog() 
RETURNS TRIGGER AS 
$employee_insert$
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
	VALUES(NEW.employee_id,NEW.first_name, NEW.last_name);
RETURN NEW;
END;
$employee_insert$
LANGUAGE plpgsql;


-- Define the Trigger Function
CREATE TRIGGER employee_insert 
	AFTER INSERT ON employee_salary
FOR EACH ROW EXECUTE PROCEDURE auditlog();


-- Insert Sample Data and Verify
INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
	VALUES(13,'Jean','Green','Entertainment',100000, NULL);

SELECT *
FROM employee_demographics;
-----------------------------------------------------------------------------------------------------
