SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE gender
        WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
select
	e.emp_no,
	e.first_name,
	e.last_name,
	case
		when dm.emp_no is not null then 'Manager'
		else 'Employee'
	end as is_manager
from employees e
		left join
	dept_manager dm ON dm.emp_no = e.emp_no
where 
e.emp_no > 109990;

select
	e.emp_no,
	e.first_name,
	e.last_name,
	case dm.emp_no
		when not null then 'Manager'
		else 'Employee'
	end as is_manager
from employees e
		left join
	dept_manager dm ON dm.emp_no = e.emp_no
where 
e.emp_no > 109990;

select
	emp_no,
    first_name,
    last_name,
    if(gender='M', 'Male', 'Female') as gender
from
	employees;
    
select
	dm.emp_no,
    e.first_name,
    e.last_name,
    max(s.salary) - min(s.salary) as salary_difference,
    case
		when max(s.salary) - min(s.salary) > 30000 then 'Salary was raised more than $30,000'
        when max(s.salary) - min(s.salary) > 20000 then 'Salary was raised more than $20,000 but less than $30000'
        else 'Salary was raised by less than $20,000'
	end as salary_increase
    
        from dept_manager as dm
			join
            employees e on e.emp_no = dm.emp_no
            join
            salaries s on s.emp_no = dm.emp_no
	Group by s.emp_no;
    
select 
	e.emp_no,
	dm.emp_no,
    e.first_name,
    e.last_name,
    
    case 
		when dm.emp_no is not null then 'Manager'
		else 'Employee'
	end as is_manager
from
	employees e
		left join
	dept_manager dm on dm.emp_no = e.emp_no
where e.emp_no >109990;


select
	e.emp_no,
    e.first_name,
    e.last_name,
    max(s.salary) - min(s.salary) as salary_difference,
    if(dm.emp_no is not null, 'Manager', 'Not a Manager') as is_manager,
    case
		when max(s.salary) - min(s.salary) > 30000 then 'Salary was raised more than $30,000'
        else 'Salary was raised by less than $30,000'
	end as salary_increase
    
        from employees e
			join
            dept_manager  dm on e.emp_no = dm.emp_no
            join
            salaries s on e.emp_no = s.emp_no
	Group by s.emp_no;

select * from dept_emp;
select 
	e.emp_no,
    e.first_name,
    e.last_name,
    case 
		when max(de.to_date) > sysdate() then 'is still employed'
		else 'not an employee anymore'
    end as current_employee
from
	employees e
		 join
	dept_emp de on de.emp_no = e.emp_no
group by de.emp_no
order by de.emp_no asc
limit 100;

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    if(max(de.to_date) > sysdate(), 'Is still employed', 'Not an employee anymore') as current_employee
from
	employees e
		join
	dept_emp de on de.emp_no = e.emp_no
group by de.emp_no
order by de.emp_no asc
limit 100;