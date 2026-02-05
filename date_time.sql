-- Data & time functions in SQL
Create database employees_datetime;
use employees_datetime  ;

create table Employees(
 emp_id int primary key,
emp_name varchar(100),
 interview_date DATETIME
 );
 desc employees;
 
 insert into employees (emp_id, emp_name, interview_date) 
 values
 (4242,'Shyam','2025-09-21 14:30:00'),
(4243,'Amit','2025-09-21 15:10:00'),
(4244,'Rahul','2025-09-22 09:00:00'),
(4245,'Priya','2025-09-22 11:45:00'),
(4246,'Neha','2025-09-23 10:20:00'),
(4247,'Rohit','2025-09-23 13:50:00'),
(4248,'Anjali','2025-09-24 09:30:00'),
(4249,'Karan','2025-09-24 16:15:00'),
(4250,'Sneha','2025-09-25 10:00:00'),
(4251,'Vikas','2025-09-25 14:40:00'),
(4252,'Pooja','2025-09-26 09:10:00'),
(4253,'Arjun','2025-09-26 12:55:00'),
(4254,'Ritu','2025-09-27 11:35:00'),
(4255,'Manoj','2025-09-27 15:25:00'),
(4256,'Kavya','2025-09-28 10:45:00');

INSERT INTO employees (emp_id, emp_name, interview_date)
VALUES
(7001,'Michael','2025-01-08 09:10:00'),
(7002,'Jessica','2025-02-14 15:35:00'),
(7003,'Daniel','2025-03-21 11:50:00'),
(7004,'Emily','2025-04-06 10:25:00'),
(7005,'Christopher','2025-05-29 14:40:00'),
(7006,'Amanda','2025-06-11 09:55:00'),
(7007,'Matthew','2025-07-19 16:15:00'),
(7008,'Sarah','2025-08-03 13:05:00'),
(7009,'Andrew','2025-09-24 10:45:00'),
(7010,'Lauren','2025-10-17 12:30:00');

select * from employees;
 
-- return the date, month, year in 3 different column by using interview date column :

select  emp_name, 
date(interview_date) as interview_date,
month(interview_date) as interview_month,
year(interview_date) as interview_year,
hour(interview_date) as interview_hour,
minute(interview_date) as interview_minute,
second(interview_date) as interview_seconds,
weekday(interview_date) as DayOfWeek_interview,
quarter(interview_date) as Quarter_Interview
from employees;

-- DAYNAME () - these value will give integer data type as output  

select emp_id, emp_name, interview_date,
dayname(interview_date) as interview_day,
monthname(interview_date) as interview_month,
year(interview_date) as interview_year,
hour(interview_date) as interview_hour,
minute(interview_date) as interview_minute,
second(interview_date) as interview_seconds,
quarter(interview_date) as Quarter_Interview
from employees;


SELECT 
interview_date,
DATE(interview_date) ,
DATE_FORMAT(interview_date, '%w-%m-%e-%y') AS formatted_date
FROM employees;

select format(interview_date, 'yyyy') from employees;


-- Date function -  Format()

-- Syntax : Format(value, format[,culture]  3rd is optional 

Select  emp_name, date_format(interview_date, '%d') as formatted_date from employees ;

select 
month(interview_date) as interviewdatewise,
count(emp_id) as candidate_count 
from employees 
group by interviewdatewise;





