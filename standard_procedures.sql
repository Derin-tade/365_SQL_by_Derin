-- Using Stored Routines
Use employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$

CREATE PROCEDURE select_employees()
BEGIN
				
                SELECT * FROM employees
                LIMIT 1000;
                
END$$

DELIMITER ;

call employees.select_employees();

-- Exercise solution
DROP PROCEDURE IF EXISTS average_salaries;

DELIMITER $$

CREATE PROCEDURE average_salaries()
BEGIN
				
                SELECT 
    AVG(salary)
FROM
    salaries
LIMIT 1000;
                
END$$

DELIMITER ;
call employees.average_salaries();

-- Stored procedures with an input parameter
 