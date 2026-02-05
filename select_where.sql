use employees;

select *  from employees where first_name = 'Cathie' or 
	First_name = 'Mark' or 
           first_name = 'Nathan';
           
select * from employees where first_name NOT in ('Cathie','Mark','Nathan');

-- IS NOT NULL / IS NULL : 

select * from employees where last_name is not null ;

select * from employees where last_name is null ;

SELECT 
    emp_no, first_name
FROM
    employees
WHERE
    first_name IS NOT NULL; 
    
    
select count(emp_no) from employees;
select  count(distinct first_name) from employees; 