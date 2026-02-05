create database primary_foreign  ;
use primary_foreign;
create table keys_concept (
 transaction_id int primary key,
 amount decimal (6,2)
 );
 desc keys_concept;
 select * from keys_concept;
 
 insert into keys_concept values (1,'424');
 insert into keys_concept values (2,'424');
 insert into keys_concept (transaction_id,amount) values ('',345); -- it will fail 
 insert into keys_concept (amount) values (345); -- it will fail 
 insert into keys_concept (transaction_id,amount) values (null,345); -- it will fail 
 
 drop table keys_concept;
 
 
 -- how to add the primary key in the existing table if that table doesn't have primary key :
 
 create table transactions  (
 transaction_id int ,
 amount decimal (6,2)
 );
 desc transactions;
 select * from transactions;
 
 alter table transactions
 add constraint primary key(transaction_id);
 
 -- auto increment :
 
 drop table transactions;
 
create table transactions  (
 transaction_id int primary key auto_increment ,
 amount decimal (6,2)
 );
 desc transactions;
 select * from transactions;
 
 insert into transactions (amount) values(6767.6776);
  insert into transactions (amount) values(100.82);
 
 drop table transactions;
 
 -- adding the auto increment constraint if no primary key and auto increment in table :
 create table transactions  (
 transaction_id int ,
 amount decimal (6,2)
 );
 desc transactions;
 select * from transactions;
 
 alter table transactions 
 add constraint primary key (transaction_id);
 
 alter table transactions 
 modify transaction_id int  auto_increment ;
 
  insert into transactions (amount) values(6767.6776);
  insert into transactions (amount) values(100.82);
  
  -- add the increment number from which number it should start : 
  create table transactions  (
 transaction_id int ,
 amount decimal (6,2)
 );
 desc transactions;
 select * from transactions;
 
 alter table transactions 
 add constraint primary key (transaction_id);
 
 alter table transactions 
 modify transaction_id int auto_increment ;
 
 alter table transactions
auto_increment = 2000;
 
  insert into transactions (amount) values(6767.6776);
  insert into transactions (amount) values(100.82);
 
 
 SELECT VERSION();
 
 
use  employee;
 
 select * from temp_high_employee_test;
 
 
 