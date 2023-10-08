select
	*
from
	salaries
where emp_no=10001;

--
select
	emp_no,
    salary,
    lag(salary) over w as previous_salary,
    lead(salary) over w as next_salary,
    salary - lag(salary) over w as diff_salary_current_previous,
    lead(salary) over w - salary as diff_salary_next_current
from
	salaries
where emp_no=10001
window w as (order by salary);

-- exercise
select
	emp_no,
	salary,
	lag(salary) over w as previous_salary,
    lead(salary) over w as next_salary,
    salary - lag(salary) over w as curprev_saldiff,
    lead(salary) over w - salary as nextcur_saldiff
from
	salaries
where emp_no between 10500 and 10600
	and salary>80000
window w as (partition by emp_no order by salary asc);


-- exercise 2
select
	emp_no,
    salary as current_salary,
    lag(salary) over w as previous_salary,
    lag(salary, 2) over w as previous2_salary,
    lead(salary) over w as next_salary,
    lead(salary, 2) over w as next2_salary
from
	salaries
window w as (partition by emp_no order by salary asc)
limit 1000;

    