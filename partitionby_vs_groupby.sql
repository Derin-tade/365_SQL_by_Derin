select 
*
from
	employees
group by emp_no;

--
select
	*,
    row_number() over(partition by emp_no order by salary) as row_num
from
	employees;
 -- using both in the same statement.   
select 
	a.emp_no,
    max(salary) as max_salary
from (
		select
			emp_no, salary,
            row_number() over w as row_num
		from
			salaries
		window w as (partition by emp_no order by salary desc)) a
group by emp_no;

select 
	a.emp_no,
    max(salary) as max_salary
from (
		select
			emp_no, 
            salary
		from
			salaries) as a
group by emp_no;


select
	a.emp_no,
    a.salary as max_salary
from
	( select
		emp_no,
        salary,
        row_number() over w as row_num
	from
		salaries
	window w as (partition by emp_no order by salary desc)) as a
where a.row_num = 1;

-- exercise 1
select
	a.emp_no,
    a.salary as min_salary
from(
	select
		emp_no,
		salary,
		row_number() over w as row_num
    from
		salaries
	window w as (partition by emp_no order by salary)) as a
where a.row_num = 1;

-- exercise 2
select
	a.emp_no,
    a.salary as min_salary
from(
	select
		emp_no,
		salary,
		row_number() over (partition by emp_no order by salary) as row_num
    from
		salaries) as a
where a.row_num = 1;

-- exercise 3
select
	a.emp_no,
    min(a.salary) as min_salary
from(
	select
		emp_no,
		salary
    from
		salaries) as a
group by emp_no;

select
	a.emp_no,
    a.salary as min_salary
from(
	select
		emp_no,
		salary,
		row_number() over w as row_num
    from
		salaries
	window w as (partition by emp_no order by salary)) as a
where row_num = 2;