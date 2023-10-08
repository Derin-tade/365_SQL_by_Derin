use employees;

select
	emp_no,
    salary,
    row_number() over() as row_num1,
    row_number() over(partition by emp_no) as row_num2,
    row_number() over(partition by emp_no order by salary desc) as row_num3,
    row_number() over(order by emp_no desc) as row_num4
from
	salaries;
-- Add an order by clause to the outer query
select
	emp_no,
    salary,
    row_number() over() as row_num1,
    row_number() over(partition by emp_no) as row_num2,
    row_number() over(partition by emp_no order by salary desc) as row_num3,
    row_number() over(order by emp_no desc) as row_num4
from
	salaries
    order by emp_no, salary;
-- 2. only use window specifications with identical partitions
select
	emp_no,
    salary,
    -- row_number() over() as row_num1,
    row_number() over(partition by emp_no) as row_num2,
    row_number() over(partition by emp_no order by salary desc) as row_num3
    -- row_number() over(order by emp_no desc) as row_num4
from
	salaries;
    
-- exercise 2
SELECT

dm.emp_no,

    salary,

    ROW_NUMBER() OVER () AS row_num1,

    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2   

FROM

dept_manager dm

    JOIN 

    salaries s ON dm.emp_no = s.emp_no
 ORDER BY row_num,salary
;
    
-- -- exercise 1
SELECT

dm.emp_no,

    salary,

    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num1,

    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2   

FROM

dept_manager dm

    JOIN 

    salaries s ON dm.emp_no = s.emp_no;