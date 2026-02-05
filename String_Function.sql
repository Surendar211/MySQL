use  case_practice_db;

Select * from employees ;

-- concat ()
select concat(emp_name,'-',department) as fullname_Department from employees ;

-- lower() and upper()
select lower(department) as lower_emp_name from employees;

select upper(emp_name) as upper_emp_name from employees;

INSERT INTO employees VALUES
(14, ' Santosh   ', 'Finance', 605000, 6, 30, 'M', 101);


select * from employees ; 

select trim(department)  as trim_department from employees ; 

select trim(department) as tim_dept from employees;

Select emp_name, 
length(emp_name) len_emp_name, 
length(trim(emp_name)) as len_trim_emp_name,
length(emp_name) - length(trim(emp_name)) as flag_length_diff_name
from employees 
where length(emp_name) != length(trim(emp_name));

-- string function () :

-- right()
-- retrieves the last 2 characters of employees name 
select  emp_name , right(emp_name, 2) as last_two_characters_emp_name from employees ;

-- left()
-- retrieve the first 3 characters of the salary 
select salary , left(salary, 3) as first_three_character_salary from employees;



-- substring 
-- if i need to take like retrieve list of employee name after removing the first character
select emp_name,
substring(emp_name, 2, length(emp_name)) as Substring_emp_name
from employees;


select lpad(emp_name, 10, '*');


