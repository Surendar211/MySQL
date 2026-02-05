-- Database Creation 
create database Employees_Info ;

use Employees_Info ;
-- STANDARD WAY : 
create table employees (
employee_id int primary key ,
 first_name varchar (20) not null,
 middle_name varchar (20)not null,
 last_name varchar(20)not null,
 hire_date date, 
 salary decimal (10,3));
 
select * from employees;

insert into employees (employee_id, first_name, middle_name, last_name, hire_date, salary) values (1, 'Suren','diran','S','2023-10-19' ,'50000');
insert into employees (employee_id, first_name, middle_name, last_name, hire_date, salary) values (2, 'Ravi','Kumar','F','2022-11-10' ,'60000');
insert into employees (employee_id, first_name, middle_name, last_name, hire_date, salary) values (3, 'Shyam','Sundar','G','2020-05-15' ,'100000');
insert into employees (employee_id, first_name, middle_name, last_name, hire_date, salary) values (4, 'Komal','Grover','G','2018-05-30' ,'75000');
insert into employees (employee_id, first_name, middle_name, last_name, hire_date, salary) values (5, 'Shyam','Sundar','G','2024-09-13' ,'45000');


-- 2. CTAS (CREATE TABLE AS) 

Create table employee_ctas as
select employee_id, first_name, middle_name, last_name, hire_date, salary from employees where salary > 50000;

select * from employee_ctas;

-- 3. Using CREATE TABLE ... LIKE ...

CREATE TABLE employees_backup LIKE employees;

select * from employees_backup;

-- 4. Temporary Table :
Create temporary table employees_temp as select employee_id, hire_date, salary from employees where salary >90000;

select * from employees_temp;

insert into employees_temp select employee_id, hire_date, salary from employees where salary > 60000;

-- 5. Using CREATE TABLE IF NOT EXISTS

-- CREATE TABLE new_students AS SELECT * FROM students WHERE 1 = 0;

-- 6. with common table expression :

CREATE TABLE high_salary_emp_cte AS
WITH high_salary_employee AS (
    SELECT employee_id, first_name, hire_date, salary
    FROM employees
    WHERE salary > 100000
)
SELECT * FROM high_salary_employee;





