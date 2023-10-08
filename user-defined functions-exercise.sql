use employees;

drop function if exists f_emp_info ;
delimiter $$
create function f_emp_info(p_emp_fname varchar(255), p_emp_lname varchar(255)) 
returns decimal(10,2)
deterministic
begin

declare v_max_from_date date;
	
    declare v_latest_salary decimal(10,2);
    
select max(s.from_date) into v_max_from_date

from 
	employees e join salaries s 
	on e.emp_no = s.emp_no
    
    where e.first_name = p_emp_fname
    and e.last_name = p_emp_lname;
    
select s.salary into v_latest_salary

from 
	employees e join salaries s
    on e.emp_no = s.emp_no
    
    where e.first_name = p_emp_fname
    and e.last_name = p_emp_lname
    and s.from_date = v_max_from_date;
    
	return v_latest_salary;

end$$
delimiter ;
    
SELECT F_EMP_INFO('Aruna', 'Journel') as "Aruna latest Salary";

