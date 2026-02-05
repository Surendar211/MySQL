CREATE DATABASE case_practice_db;
USE case_practice_db;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(20),
    salary INT,
    experience INT,
    age INT,
    gender CHAR(1),
    manager_id INT
);


INSERT INTO employees VALUES
(1, 'Ravi', 'IT', 60000, 6, 30, 'M', 101),
(2, 'Priya', 'HR', 35000, 3, 26, 'F', 102),
(3, 'Amit', 'IT', 45000, 4, 28, 'M', 101),
(4, 'Neha', 'Finance', 50000, 5, 32, 'F', NULL),
(5, 'Kiran', 'HR', 28000, 2, 23, 'M', 102),
(6, 'Suman', 'IT', 70000, 8, 35, 'F', 101),
(7, 'Arjun', 'Sales', 30000, 3, 25, 'M', NULL),
(8, 'Meena', 'Finance', 40000, 4, 29, 'F', 103),
(9, 'Rahul', 'IT', 32000, 2, 24, 'M', 101),
(10, 'Pooja', 'HR', 52000, 6, 34, 'F', 102);

select * from employees;

-- Concept 1: Basic CASE WHEN

-- 1 . Write a query to show High if salary ≥ 40000 else Low.

select emp_id emp_name, department,salary,
case 
	when salary > 40000 then 'High'
    else 'Low' 
    end as salary_category  
from employees;

-- 2 . Write a query to show Adult if age ≥ 18 else Minor.

select 
 emp_id,emp_name, age, gender,
 case
	when age >= 18 then 'Adult'
    else 'Minor'
    end as age_status
from employees ;

-- 3 . Write a query to show Male if gender = 'M' else Female.

select 
	  emp_id, emp_name, gender,
case 
    when gender = 'M' then 'Male'
    else 'Female'
end as Gender_short_form
from employees;


-- Concept 2: Multiple Conditions

-- 4. Classify employees as: Very High if salary ≥ 60000, High if salary ≥ 40000, Low otherwise 

Select
      emp_id, emp_name, salary,
case
	when salary >= 60000 THEN 'VERY HIGH'
    when salary >= 40000 THEN 'HIGH'
    else 'OTHERWISE'
end as salary_range
from employees;


-- 5 Classify employees by experience: Senior if experience ≥ 6, Mid if experience ≥ 3, Junior otherwise

Select 
emp_id, emp_name, experience,
case
	when experience >= 6 then 'Senior'
    when experience >=3 then 'Mid'
    else 'Junior'
end as experiece_level
from employees;

-- 6 . Concept 3: CASE with Text Values
-- Show department type: IT → Technical, HR → Human Resource, Others → Other

Select 
emp_id, emp_name, experience, 
case 
    when department = 'IT' then 'Technical'
    when department = 'HR' then 'Human Resource'
    else 'Others'
end  experience_full_form
from employees;


-- 7 . Show gender description:
  -- M → Male , F → Female
  
  select  emp_id, gender,
  case
	  when gender = 'M' then 'Male'
      when gender = 'F' then 'Female'
  end gender_description
  from employees;


-- Concept 4: CASE with NULL
-- Show No Manager if manager_id is NULL else Has Manager

select 
     emp_id,emp_name, manager_id, 
case
   when manager_id is Null then 'No manager'
   else 'has manager'
end has_manager_or_not
from employees;

-- Show Assigned if department is not NULL else Not Assigned.

select 
     emp_id, emp_name, department,
case
	when department is null then 'Not assigned'
    else 'Assigned'
end Employee_Department_Status
from employees;

-- Concept 5: CASE with AND / OR

select 
      emp_id, emp_name, department,
case 
    when (salary > 50000 and experience > 5) then 'Senior High Paid'
	when (salary > 30000 and experience > 3) then 'Eligible'
    else 'Not Determined'
end Employee_Price 
from Employees;


--  Concept 6: CASE in WHERE Clause
-- Select employees where : If department = IT → salary > 40000, If department = HR → salary > 30000, Else → salary > 20000

select 
      emp_name, department, salary  from employees where 
   
case 
     when department = 'IT' then (salary > 40000)
     when department = 'HR' then (salary > 30000)
    else  (salary > 20000)
end ;
  
-- Select employees where: If gender = 'M' → age > 25, Else → age > 23

Select 
	emp_name, department, gender, age from employees where 
case 
    when gender = 'M' then (age > 25)
    else (age>23)
end;


-- 🔹 Concept 7: CASE with ORDER BY
-- Sort employees such that: IT first, HR second, Others last

select emp_name, emp_id, department  from employees
order by  
case
	when Department = 'IT' then 1
    when department = 'HR' then 2
    Else  3
end;


-- Sort employees such that:
-- Highest salary department appears first (IT → Finance → HR → Others)

select emp_name, department from employees 
order by 
case 
    when Department = 'IT' then 1
    when department = 'Finance' then 2
    when department = 'HR' then 3
    else 4
end ;

-- 🔹 Concept 8: CASE with Aggregate Function

-- Count employees whose salary > 50000

Select department,
sum(
    case 
        when salary > 5000 then 1 
        else 0
	end
) as high_salary_count
from employees
group by department;

-- Count male and female employees using CASE.

SELECT
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM employees;








