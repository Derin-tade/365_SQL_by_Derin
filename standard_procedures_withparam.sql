use employees;
drop procedure if exists emp_salary;

delimiter $$
use employees $$
create procedure emp_salary(in p_emp_no integer)
begin
select
		e.first_name, e.last_name, s.salary, s.from_date, s.to_date
from
		employees e
			join
		salaries s on e.emp_no = s.emp_no
where 
	e.emp_no = p_emp_no;
    end$$

delimiter ;




delimiter $$
use employees $$
create procedure emp_avg_salary(in p_emp_no integer)
begin
select
		e.first_name, e.last_name, avg(s.salary)
from
		employees e
			join
		salaries s on e.emp_no = s.emp_no
where 
	e.emp_no = p_emp_no;
    end$$

delimiter ;

call employees.emp_avg_salary(11300);

-- Stored procedures with an output parameter

drop procedure if exists emp_avg_salary_out;

delimiter $$
use employees $$
create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
begin
select
		avg(s.salary)
-- must include select "into 'in parameter'"  for standard procedure with out parameter
        into p_avg_salary
from
		employees e
			join
		salaries s on e.emp_no = s.emp_no
where 
	e.emp_no = p_emp_no;
    end$$

delimiter ;

call employees.emp_avg_salary_out(11300);


-- Exercise

drop procedure if exists emp_info;

delimiter $$
use employees$$
create procedure emp_info(in p_emp_first_name varchar(50), in p_emp_last_name varchar(50), out p_emp_number integer)
begin
	select 
    emp_no into p_emp_number from employees 
	where first_name = p_emp_first_name
	and last_name = p_emp_last_name;
end $$
delimiter ;
