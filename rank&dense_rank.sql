use employees;

select
	emp_no, salary, row_number() over w as row_num
from
	salaries
window w as (partition by emp_no order by salary desc);


select distinct
	emp_no, salary, row_number() over w as row_num
from
	salaries
where emp_no=10001
window w as (partition by emp_no order by salary desc);

select 
	emp_no, (count(salary) - count(distinct salary)) as diff
from
	salaries
group by emp_no
having diff > 0
order by emp_no;

select
	*
from
	salaries
where emp_no = 11839;

select distinct
	emp_no, salary, row_number() over w as row_num
from
	salaries
where emp_no=11839
window w as (partition by emp_no order by salary desc);

select distinct
	emp_no, salary, rank() over w as rank_num
from
	salaries
where emp_no=11839
window w as (partition by emp_no order by salary desc);

select
	emp_no, salary, rank() over w as rank_num
from
	salaries
where emp_no=11839
window w as (partition by emp_no order by salary desc);

select distinct
	emp_no, salary, dense_rank() over w as rank_num
from
	salaries
where emp_no=11839
window w as (partition by emp_no order by salary desc);

-- exercise 1
select
	emp_no,
    salary,
    row_number() over(partition by emp_no order by salary desc) as sal_num
from
	salaries
where emp_no = 10560;

-- exercise 2

select
	de.emp_no,
	count(s.from_date) as contract_count
from
	dept_manager de
    join
    salaries s
    on de.emp_no = s.emp_no
group by emp_no
order by contract_count desc;
    
select
	de.emp_no,
	count(s.from_date) as contract_count,
    row_number() over() as row_num
from
	dept_manager de
    join
    salaries s
    on de.emp_no = s.emp_no
group by emp_no;

-- exercise 3
select
	emp_no,
    salary,
    rank() over(partition by emp_no order by salary desc) as sal_order
from
	salaries
where emp_no = 10560;

select
	*
from

(select
	emp_no,
    salary,
    rank() over w as sal_order
from
	salaries
window w as (partition by emp_no order by salary desc)) as a
where emp_no = 10560;

-- exercise 4
select
	emp_no,
    salary,
    dense_rank() over w as sal_order
from
	salaries
where emp_no = 10560
window w as (partition by emp_no order by salary desc);