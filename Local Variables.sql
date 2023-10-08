/*
** Local varieables are on ly valid within their begin and end blocks
they ar invalid once called or used outside their begin and end blocks

*/

-- block of code that should give error because variable is called outside it's begin and end block
use employees;
drop function if exists f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal(10,2)
deterministic
begin

declare v_avg_salary decimal(10,2);

begin
declare v_avg_salary_2 decimal(10,2);
end;

select
	avg(s.salary)
into v_avg_salary_2 from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
    
return v_avg_salary_2;
end$$


-- block of code that works because variable is called outside it's begin and end block
use employees;
drop function if exists f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal(10,2)
deterministic
begin

declare v_avg_salary decimal(10,2);
begin
declare v_avg_salary_2 decimal(10,2);
end;
select
	avg(s.salary)
into v_avg_salary from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
    
return v_avg_salary;
end$$


select @s_var1