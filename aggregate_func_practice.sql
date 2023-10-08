USE employees;

select * from dept_emp;

SELECT 
	s.emp_no,
    e.first_name,
    e.last_name,
    count( distinct salary) as salary_changes
FROM
	employees e
		join
	salaries s on e.emp_no = s.emp_no
		join 
	dept_emp de on de.emp_no = e.emp_no
		join
	departments d on de.dept_no = d.dept_no
group by emp_no
order by emp_no;