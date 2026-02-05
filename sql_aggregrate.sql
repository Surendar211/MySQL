-- aggregation 
-- sum, count, average, min, max
create database aggregation;
use aggregation;
CREATE TABLE CustomerTransactions (
    id INT PRIMARY KEY,
    login_device VARCHAR(50),
    customer_name VARCHAR(100),
    ip_address VARCHAR(20),
    product VARCHAR(100),
    amount DECIMAL(10, 2),
    is_placed BOOLEAN,
    is_viewed BOOLEAN, 
    transaction_status VARCHAR(20)
);

INSERT INTO CustomerTransactions VALUES
(1, 'Mobile', 'Ravi', '192.168.1.1', 'Laptop', 50000.00, TRUE, FALSE, 'Completed'),
(2, 'Desktop', 'Priya', '192.168.1.2', 'Smartphone', 20000.00, TRUE, TRUE, 'Completed'),
(3, 'Tablet', 'Arjun', '192.168.1.3', 'Headphones', 1500.00, FALSE, TRUE, 'Failed'),
(4, 'Mobile', 'Meena', '192.168.1.4', 'Shoes', 2500.00, TRUE, FALSE, 'Completed'),
(5, 'Desktop', 'Karthik', '192.168.1.5', 'Watch', 5000.00, TRUE, TRUE, 'Completed'),
(6, 'Mobile', 'Sowmya', '192.168.1.6', 'Tablet', 15000.00, TRUE, TRUE, 'Completed'),
(7, 'Tablet', 'Ramesh', '192.168.1.7', 'Smartphone', 25000.00, FALSE, TRUE, 'Failed'),
(8, 'Desktop', 'Divya', '192.168.1.8', 'Laptop', 60000.00, TRUE, FALSE, 'Completed'),
(9, 'Mobile', 'Arun', '192.168.1.9', 'Smartwatch', 12000.00, TRUE, TRUE, 'Completed'),
(10, 'Tablet', 'Deepa', '192.168.1.10', 'Laptop', 55000.00, FALSE, FALSE, 'Pending');


select * from CustomerTransactions;

Select count(*) from CustomerTransactions;

Select count(*) from CustomerTransactions where transaction_status = 'Failed';

Select count(*) from CustomerTransactions where transaction_status = 'Failed' and product = 'Failed';

select count(*) as Status_count, transaction_status from customerTransactions where transaction_status in ('Failed','Pending') group by transaction_status;

select count(*)  from customerTransactions where transaction_status not in ('Failed','Pending');

select sum(amount) as Total_Transaction_Amount from customerTransactions where transaction_status = 'Completed' ;

select sum(amount), product from customerTransactions where transaction_status = 'Completed' group by product;

select min(amount) as minimum_transaction from customerTransactions;

select max(amount) as maximum_transaction from customerTransactions;

select avg(amount) as average_transaction from customerTransactions;

select sum(amount) as total_revenue, login_device from customerTransactions group by login_device;


select sum(amount) as total_revenue, login_device from customerTransactions group by login_device having sum(amount) > 80000 ;