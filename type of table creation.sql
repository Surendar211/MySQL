-- types of table creation 
create database employee;
use  employee;
-- normal way 
create table employee_test (
    employee_id int primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    hire_date date not null,
    salary decimal(10,3)
    );
   
insert into  employee_test (employee_id,first_name,last_name,hire_date,salary) 
values
(1000,'ravi','kumar','2023-10-21',40000),
(3442,'shanmugam','d','2023-06-19',40000),
(5524,'sam','kumar','2022-08-30',40000),
(4242,'raghu','ram','2023-10-07',50000),
(3532,'rama','chandran','2022-12-12',50000),
(5882,'araindh','kumar','2019-09-24',60000),
(9863,'sujith','shreee','2020-04-21',60000),
(5783,'hari','haran','2020-05-12',6000),
(3784,'vishnu','priya','2022-01-18',70000),
(3728,'harshit','kumar','2024-03-28',70000),
(9399,'surendiran','s','2025-05-31',70000),
(8293,'karthi','keyan','2021-03-18',80000),
(3782,'arun','prasad','2022-07-09',80000),
(9028,'praveen','kumar','2021-08-02',80000),
(8392,'karthi','raja','2024-09-22',80000);

select * from employee_test;
-- 2: 
-- ctas - create table as
create table high_employee_test as 
select employee_id,first_name,last_name,hire_date,salary from employee_test where salary > 60000;

select * from high_employee_test;


-- 3 :
-- temporary table 
create table temp_high_employee_test (
 employee_id int primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    hire_date date not null,
    salary decimal(10,3)
    );

insert into temp_high_employee_test (
select employee_id,first_name,last_name,hire_date,salary from employee_test where salary > 55000)


select * from temp_high_employee_test;


-- cte table creation 

with high_salary_cte as (
select employee_id,first_name,last_name,hire_date,salary from employee_test where salary > 60000)

select * from high_salary_cte;

-- above 3 line we need to run in one 


