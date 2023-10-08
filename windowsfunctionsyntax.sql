use employees;

select
	emp_no,
    salary,
    row_number() over(partition by emp_no order by salary desc) as row_num
from
	salaries;
    
select
	emp_no,
    salary,
    row_number() over w as row_num
from
	salaries
window w as (partition by emp_no order by salary desc);

-- exercise
select 
	emp_no,
	first_name,
	last_name,
	row_number() over w as row_num
from
	employees
window w as (partition by first_name order by emp_no);