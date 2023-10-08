use employees;
SELECT 
    *
FROM
    departments
LIMIT 10;

drop table if exists departments_dup;
CREATE TABLE departments_dup
(
dept_no CHAR(4) NOT NULL,
dept_name VARCHAR(40) NOT NULL
);

SELECT 
    *
FROM
    departments_dup
LIMIT 10;

insert into departments_dup
	(
		dept_no,
		dept_name
	)
    SELECT 
    *
	FROM
    departments;
    
SELECT 
    *
FROM
    departments_dup;

-- change table departments duplicate
ALTER table departments_dup

-- change dept_name colmn to a bunch of null values
CHANGE column dept_name dept_name VARCHAR(40) NULL;
-- add new rows d010 and d011 int dept_no col
INSERT INTO departments_dup(dept_no) VALUES("d010"),("d011");
-- add new col dept_manager varchar(255) after dept_name. column has null values
ALTER table departments_dup
ADD column dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') AS dept_named
FROM
    departments_dup;
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name,
            'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    dept_no,
    dept_name,
    COALESCE('dept manager name') AS fake_column
FROM
    departments_dup
ORDER BY dept_no;

-- Exercise
select
	dept_no, 
    dept_name,
    coalesce(dept_no, dept_name) as dept_info
from departments_dup
order by dept_no asc;

select
	ifnull(dept_no,'N/A') as dept_no, 
    ifnull(dept_name,'Department name not provided') as dept_name,
    coalesce(dept_name, dept_no) as dept_info
from departments_dup
order by dept_no asc;