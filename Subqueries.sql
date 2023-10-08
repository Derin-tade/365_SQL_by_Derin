use employees;
select * from dept_manager;
# select first name, last_name from the Employees table for the same
# emloyee numbers that can be found in the "Department Manager" table
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
SELECT 
            dm.emp_no
        FROM
            dept_manager dm;
            
SELECT 
    *
FROM
    dept_manager
WHERE 
emp_no  IN  (SELECT 
    emp_no
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '1995-01-01');
    
    
-- Exists and Not exists
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
	EXISTS (SELECT 
            dm.emp_no
        FROM
            dept_manager dm
            WHERE dm.emp_no = e.emp_no);
            
SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            t.emp_no
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND t.title = 'Assistant Engineer');
                
                
-- SQL Subqueries Nested in SELECT and FROM

-- Assign emp_no 110022 as manager to employees from 10001 to 10002
-- and emp_no 110039 as manager to all employees from 10021 to 10040

SELECT
	A.*
FROM
	(SELECT 
		e.emp_no AS employee_ID,
        e.first_name, e.last_name,
		MIN(de.dept_no) AS department_code,
		(SELECT 
			emp_no
		FROM
			dept_manager
		WHERE
			emp_no = 110022) as manager_ID
	FROM
		employees e
			JOIN 
		dept_emp de ON e.emp_no = de.emp_no
	WHERE 
		e.emp_no <=10020
	GROUP BY e.emp_no
	ORDER BY e.emp_no) as A
UNION
SELECT
	B.*
FROM
	(SELECT 
		e.emp_no AS employee_ID,
        e.first_name, e.last_name,
		MIN(de.dept_no) AS department_code,
		(SELECT 
			emp_no
		FROM
			dept_manager
		WHERE
			emp_no = 110039) as manager_ID
	FROM
		employees e
			JOIN 
		dept_emp de ON e.emp_no = de.emp_no
	WHERE 
		e.emp_no >10020
	GROUP BY e.emp_no
	ORDER BY e.emp_no
	LIMIT 20) as B;
-- Exercise

drop table if exists emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);
INSERT INTO emp_manager

SELECT
	U.* 
FROM
	(SELECT
		A.*
	FROM
		(SELECT 
			e.emp_no AS employee_ID,
			MIN(de.dept_no) AS department_code,
			(SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110022) as manager_ID
		FROM
			employees e
				JOIN 
			dept_emp de ON e.emp_no = de.emp_no
		WHERE 
			e.emp_no <=10020
		GROUP BY e.emp_no
		ORDER BY e.emp_no) as A
	UNION
	SELECT
		B.*
	FROM
		(SELECT 
			e.emp_no AS employee_ID,
			MIN(de.dept_no) AS department_code,
			(SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110039) as manager_ID
		FROM
			employees e
				JOIN 
			dept_emp de ON e.emp_no = de.emp_no
		WHERE 
			e.emp_no >10020
		GROUP BY e.emp_no
		ORDER BY e.emp_no
		LIMIT 20) as B
	UNION
	SELECT
		C.*
	FROM
		(SELECT 
			e.emp_no AS employee_ID,
			MIN(de.dept_no) AS department_code,
			(SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110039) as manager_ID
		FROM
			employees e
				JOIN 
			dept_emp de ON e.emp_no = de.emp_no
		WHERE 
			e.emp_no =110022
		GROUP BY e.emp_no
		ORDER BY e.emp_no) as C
	UNION
	SELECT
		D.*
	FROM
		(SELECT 
			e.emp_no AS employee_ID,
			MIN(de.dept_no) AS department_code,
			(SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110022) as manager_ID
		FROM
			employees e
				JOIN 
			dept_emp de ON e.emp_no = de.emp_no
		WHERE 
			e.emp_no =110039
		GROUP BY e.emp_no
		ORDER BY e.emp_no) as D) as U;



SELECT 
    *
FROM
    emp_manager