create database employee_alter;

use employee_alter;

create table employee(
  first_name varchar(50),
  last_name varchar(50)
  );
  
  desc employee;
  
  -- alter :
  
  alter table employee 
  add email varchar (30);
  
  alter table employee
  add salary decimal(10,4);
  
  alter table employee  drop column last_name ;
  
alter table employee
add emp_id varchar (20) primary key;

-- table name changing :

alter table employee rename to employee_renamed;

  desc employee_renamed;
  

 -- adding not null constraint to existing column :
 
alter table employee_renamed
modify first_name varchar (50) not null;  



