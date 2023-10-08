SET @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
select @v_avg_salary;

-- exercise
set @v_emp_no = 000000;
call employees.emp_info('Aruna', 'Journel', @v_emp_no);
select @v_emp_no
