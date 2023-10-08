use employees;

select
	d.dept_no,
    d.dept_name,
    dm.emp_no,
    rank() over w as dept_sal_ranking,
    s.salary,
    s.from_date as salary_from_date,
    s.to_date as salary_to_date,
    dm.from_date as dept_manager_from_date,
	dm.to_date as dept_manager_to_date
from
	dept_manager dm
		join
	salaries s on s.emp_no = dm.emp_no
		and s.from_date between dm.from_date and dm.to_date
		and s.to_date between dm.from_date and dm.to_date
        join
	departments d on d.dept_no = dm.dept_no
window w as (partition by dm.dept_no order by s.salary desc);


-- exercise

/*
Write a query that ranks the salary values in descending order of all contracts signed 
by employees numbered between 10500 and 10600 inclusive. Let equal salary values 
for one and the same employee bear the same rank. Also, allow gaps in the ranks 
obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result.
*/
select
	e.emp_no,
    e.first_name,
    e.last_name,
    dense_rank() over w as emp_salary_rank,
    (year(s.from_date)-year(e.hire_date)) as years_from_start,
    s.salary,
    s.from_date,
    e.hire_date
    
from
	employees e
    join
    salaries s on e.emp_no = s.emp_no
where e.emp_no between 10500 and 10600
	and year(s.from_date)-year(e.hire_date) > 5
window w as (partition by e.emp_no order by s.salary desc);
--
select
	e.emp_no,
    e.first_name,
    e.last_name,
    dense_rank() over w as emp_salary_rank,
    (year(s.from_date)-year(e.hire_date)) as years_from_start,
    s.salary,
    s.from_date,
    e.hire_date
    
from
	employees e
    join
    salaries s on e.emp_no = s.emp_no
    and year(s.from_date)-year(e.hire_date) > 5
where e.emp_no between 10500 and 10600
	
window w as (partition by e.emp_no order by s.salary desc);
