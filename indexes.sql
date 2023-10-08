select
*
from 
	employees
where 
	hire_date> "2000-01-01";
    

create index i_hire_date on employees(hire_date);

-- composite indexes applied to multiple columns

create index i_full_name on employees(first_name, last_name);

select
	*
from
	employees
where
	first_name = 'Georgi'
    and last_name = 'Facello';
    
show index from employees from employees;

alter table employees
drop index i_hire_date;

create index i_salaries on salaries(salary);

select
	*
from
	salaries
where 
	salary>89000;