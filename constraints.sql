-- Constraints in SQL 
create database dept_store;
use dept_store;
-- unique
create table product_info (
  p_id int,
  product_name varchar(100) unique,
  product_price decimal(6,2)
  );
  -- not null
  create table product_info (
  p_id int,
  product_name varchar(100) not null,
  product_price decimal(6,2)
  );
  desc product;
  select * from product_info;
  
  insert  into product_info values
  (2424,'Trimmer',456.42);
  

  insert into product_info  values (4242, 'cherry', 1200.67),
   (24422, 'stool', 345.98),
   (2424, 'mixer', 2100.43);
   
   drop table product_info;
   
   -- updating the not null contrainst in the exisitnd table 
  use dept_store; 
    create table product_info (
  p_id int,
  product_name varchar(100) ,
  product_price decimal(6,2)
  );
 
  select * from product_info;
  
  alter table product_info 
  modify product_name varchar(40) not null;
  
  desc product_info;
  
  drop table product_info; 
  
  -- check constraint : 
  
      create table product_info (
  p_id int,
  product_name varchar(100),
  product_price decimal(6,2)
  check(product_price <=100)
  );
  desc product_info;
  select * from product_info;
  
  alter table product_info 
  modify product_name varchar(40) not null;
  
  alter table product_info 
  add constraint unique (p_id);
  desc product_info;
  
insert  into product_info values
  (2424,'Trimmer',100);
 insert  into product_info values
  (4224,'juice',45);
  
-- removing the constraint from table :
alter table product_info
drop constraint product_price;

 insert  into product_info values
  (3442,'juice',234);
  select * from product_info;
  
  
   
  
  