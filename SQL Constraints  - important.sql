create database constraints ;

use constraints;

-- constraint  : set or declaring the rule to the specific column in the table 
-- primary key
-- When we try to insert a duplicate value into that PRIMARY KEY column, it will fail because primary keys must be unique.
CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    rider_id INT NOT NULL,
    pickup_location VARCHAR(100) NOT NULL,
    dropoff_location VARCHAR(100) NOT NULL,
    ride_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) NOT NULL
);

desc rides;

INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(1, 101, 201, 'Chennai', 'Coimbatore', '2024-12-29 08:00:00', 500.00);

select * from rides;

-- composite primary key : (more than one column combination)
-- One column alone is not enough to uniquely identify a row. But a combination of columns together is unique.

drop table rides;

CREATE TABLE rides (
    ride_id INT,
    driver_id INT NOT NULL,
    rider_id INT NOT NULL,
    pickup_location VARCHAR(100) NOT NULL,
    dropoff_location VARCHAR(100) NOT NULL,
    ride_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) NOT NULL,
    primary key(ride_id, rider_id)
);

desc rides;
INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(1, 101, 201, 'Chennai', 'Coimbatore', '2024-12-29 08:00:00', 500.00);
INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(1, 101, 202, 'Chennai', 'Coimbatore', '2024-12-29 08:00:00', 500.00);
INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(2, 101, 201, 'Chennai', 'Coimbatore', '2024-12-29 08:00:00', 500.00);
INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(2, 101, 202, 'Chennai', 'Coimbatore', '2024-12-29 08:00:00', 500.00);
select * from rides;
-- either ride id can be duplicate or rider id can ble duplicate but rider id and ride id cannot be duplicate that is composite primary key 

-- eg :
-- account number + phone number
-- account number +  address

-- unique constraint 

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
desc users ;

INSERT INTO users (user_id, email)
VALUES (1, 'user1@example.com'); 

INSERT INTO users (user_id, email)
VALUES (2, 'user2@example.com'); 
select * from users;

INSERT INTO users (user_id, email)
VALUES (3, NULL);  -- this row will insert and unique constraint will allow null values 

INSERT INTO users (user_id, email)
VALUES (NULL, 'user@gmail.com');  -- this row will not insert  04:23:37	INSERT INTO users (user_id, email) VALUES (NULL, NULL)
-- Error Code: 1048. Column 'user_id' cannot be null	0.000 sec

INSERT INTO users (user_id, email)
VALUES (4, 'user2@example.com'); 
-- 04:25:18	INSERT INTO users (user_id, email) VALUES (4, 'user2@example.com')	Error Code: 1062. 
-- Duplicate entry 'user2@example.com' for key 'users.email'	0.016 sec

select * from users;

-- unique vs primary key 
-- there is difference between unique and primary key : unique will allow null value and does not allow duplicate values.
--  but primary key will not allow duplicates and also null values

 
-- NOT NULL :
drop table rides;
CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    rider_id INT ,
    pickup_location VARCHAR(100) NOT NULL,
    dropoff_location VARCHAR(100) NOT NULL,
    ride_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) NOT NULL
);

desc rides;
INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(3, 103, NULL, 'Coimbatore', 'Chennai', '2024-12-29 14:00:00', 600.00);

Select * from rides; -- this will insert because of not null not given to this column 

INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(4, 103, NULL, 'namakkal', 'Chennai', '2024-12-29 14:00:00', 600.00);
-- 04:32:53	INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
 -- VALUES (4, 103, NULL, NULL, 'Chennai', '2024-12-29 14:00:00', 600.00)	
 -- Error Code: 1048. Column 'pickup_location' cannot be null	0.000 sec
 
 -- check 
 drop table rides;
 CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    rider_id INT NOT NULL ,
    pickup_location VARCHAR(100) NOT NULL,
    dropoff_location VARCHAR(100) NOT NULL,
    ride_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) check  (fare > 0) 
);

INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(4, 103, 201, 'namakkal', 'Chennai', '2024-12-29 14:00:00', 600.00);

INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(5, 103, 201, 'namakkal', 'Chennai', '2024-12-29 14:00:00', -3);
-- 04:36:21	INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare) VALUES
-- (5, 103, 201, 'namakkal', 'Chennai', '2024-12-29 14:00:00', -3)Error Code: 3819. Check constraint 'rides_chk_1' is violated.	0.000 sec


 

-- foreign key :

-- Creating the drivers table
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    license_number VARCHAR(50) UNIQUE
);
drop table drivers;
-- Creating the rides table with driver_id as a foreign key

CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT,
    pickup_location VARCHAR(100),
    dropoff_location VARCHAR(100),
    ride_date DATETIME,
    fare DECIMAL(10, 2),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);
desc rides;
desc drivers;
INSERT INTO drivers (driver_id, driver_name, license_number)
VALUES (101, 'John Doe', 'XYZ12345'), (102, 'Jane Smith', 'ABC67890');

INSERT INTO rides (ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(301, 101, 'Chennai', 'Coimbatore', '2024-12-01 08:00:00', 500.00),
(302, 101, 'Chennai', 'Madurai', '2024-12-01 19:30:00', 600.00),
(303, 102, 'Bangalore', 'Hyderabad', '2024-12-02 10:00:00', 700.00);

select * from rides;
select * from drivers;

-- Attempting to insert a ride with a non-existing driver_id
INSERT INTO rides (ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare)
VALUES (304, 999, 'Coimbatore', 'Chennai', '2024-12-03 10:00:00', 800.00);

-- 999 - driver id is not in database in driver table 
-- error code :
-- 05:01:27	INSERT INTO rides (ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare) VALUES 
-- (304, 999, 'Coimbatore', 'Chennai', '2024-12-03 10:00:00', 800.00)	
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails
-- (`constraints`.`rides`, CONSTRAINT `rides_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`))	0.000 sec

INSERT INTO rides (ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(304, 102, 'Chennai', 'Coimbatore', '2024-12-01 08:00:00', 500.00),
(305, 101, 'Chennai', 'Madurai', '2024-12-01 19:30:00', 600.00),
(306, 102, 'Bangalore', 'Hyderabad', '2024-12-02 10:00:00', 700.00);

select * from rides;

DELETE FROM drivers
WHERE driver_id = 101;

-- 05:13:51	DELETE FROM drivers WHERE driver_id = 101	Error Code: 1451. 
-- Cannot delete or update a parent row: a foreign key constraint fails (`constraints`.`rides`, CONSTRAINT `rides_ibfk_1`
-- FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`))	0.000 sec

-- but if i delete the driverid - 101 linked records from rides table and then if i try to delete the driverid then driver id will delete
-- before deleting 6 records 
delete from rides
where driver_id = 101
select * from rides ;
-- only 3 records i am getting 
-- now if i try to delete that will delete 

DELETE FROM drivers WHERE driver_id = 101;

select * from drivers;  -- 1 driver
select * from rides;  -- 3 rows records 



drop table drivers;
drop table rides;
-- Creating the drivers table
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    license_number VARCHAR(50) UNIQUE
);


-- Creating the rides table with driver_id as a foreign key
CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT,
    pickup_location VARCHAR(100),
    dropoff_location VARCHAR(100),
    ride_date DATETIME,
    fare DECIMAL(10, 2),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)  ON DELETE CASCADE
);
INSERT INTO drivers (driver_id, driver_name, license_number)
VALUES (101, 'John Doe', 'XYZ12345'), (102, 'Jane Smith', 'ABC67890');


INSERT INTO rides (ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare)
VALUES (304, 101, 'Coimbatore', 'Chennai', '2024-12-03 10:00:00', 800.00),
 (305, 102, 'Chennai', 'Coimbatore', '2024-12-01 08:00:00', 500.00),
(307, 101, 'Chennai', 'Madurai', '2024-12-01 19:30:00', 600.00),
(306, 102, 'Bangalore', 'Hyderabad', '2024-12-02 10:00:00', 700.00);

select * from rides;
select * from drivers;

 







-- default constraint :

create table product(
s_no int auto_increment unique,
product_id int primary key,
product_name varchar (50) not null,
country varchar(50) default 'India',
product_code varchar (10) not null,
published_year year, 
product_price decimal (10,2) check(product_price>200000)
);

insert into product (product_id, product_name,country, product_code, published_year, product_price) values
 (43421, 'ZenBook','usa','ZNK','2006','2000000');
 
 select * from product;
 insert into product (product_id, product_name, product_code, published_year, product_price) values
 (42242, 'ZenBook','ZNK','2006','2000000');
desc product;













