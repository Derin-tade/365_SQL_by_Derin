use employees;
SELECT 
    *
FROM
    dept_emp;

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS num
FROM
    dept_emp
GROUP BY emp_no
HAVING num > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
	SELECT 
		emp_no, MAX(from_date) as from_date, MAX(to_date) as to_date
	FROM
		dept_emp
	GROUP BY emp_no;
    
select* from v_dept_emp_latest_date;


-- 
CREATE OR REPLACE VIEW v_avg_man_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager m ON s.emp_no = m.emp_no