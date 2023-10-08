use employees;

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1986-01-01' AND '1999-12-31';
    
select count(distinct first_name) from employees;
 
 

SELECT 
   first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;


SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) < 200
    AND hire_date > '1999-01-01'
ORDER BY first_name DESC;


SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name
LIMIT 100;

select
	de.*, d.dept_name
from
	dept_emp de
		join
	departments d
    on de.dept_no = d.dept_no
order by emp_no;