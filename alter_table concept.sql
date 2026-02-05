use employees_info; 

-- Alter table & column :
create table alterconcept_employee (emp_id int primary key, first_name varchar (20), last_name varchar(20));

insert into alterconcept_employee values(001, 'sundar','ram');
insert into alterconcept_employee values(002, 'ram','kumar');
insert into alterconcept_employee values(003, 'richard','lee');
insert into alterconcept_employee values(004, 'leo','james');

describe alterconcept_employee;

--   altering the table cloumn - adding another column in the table: 

alter table alterconcept_employee add column email varchar (40);

alter table alterconcept_employee drop column last_name ;

alter table alterconcept_employee rename to emp_alterconcept;

describe emp_alterconcept;







