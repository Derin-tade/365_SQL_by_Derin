use employees;

select
	emp_no,
    salary,
-- empty specication no window value
    row_number() over() as row_num
from
	salaries;

select
	emp_no,
    salary,
-- using partition by
    row_number() over(partition by emp_no) as row_num
from
	salaries;
    
select
	emp_no,
    salary,
-- using partition by and order by
    row_number() over(partition by emp_no order by salary desc) as row_num
from
	salaries;
    
select
	emp_no,
    salary,
-- using just order by
    row_number() over(order by salary desc) as row_num
from
	salaries;
    
-- Exercise
/*
Exercise #1 :

Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" 
database (regardless of their department).

Let the numbering disregard the department the managers have worked in. 
Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.
*/
select
e.*,
row_number() over(order by e.emp_no asc) as manager_no

from
	employees e
		join
	dept_manager dm
		on
	e.emp_no = dm.emp_no;
    
select
*
from
	employees e
		join
	dept_manager dm
		on
	e.emp_no = dm.emp_no;
-- correct solution from lesson    
SELECT

    emp_no,

    dept_no,

    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num

FROM

dept_manager;
/*
Exercise #2:

Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. 
Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).
*/
select
*,
row_number() over(partition by first_name order by last_name asc) as sn
from 
	employees;

-- correct solution from lesson

SELECT

emp_no,

first_name,

last_name,

ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name) AS row_num

FROM

employees;