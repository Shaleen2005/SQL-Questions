show databases;
use world;
select * from customers limit 5;

select distinct(city) from customers order by city desc;

select count(distinct(city)) from offices;

select max(age),min(age),avg(age) from customers;

select offices.city from offices
left join customers on offices.city=customers.city
where customers.city is null;

select offices.city from offices
inner join customers on offices.city=customers.city;
select * from customers where state is null and creditLimit between 80000 and 130000;

select  max(quantityOrdered),orders.orderDate from orderdetails
inner join orders on orderdetails.orderNumber=orders.orderNumber
where quantityOrdered=(select max(quantityOrdered) from orderDetails) 
group by orderDate;

select customerName,phone from orderdetails
inner join orders on orderdetails.orderNumber=orders.orderNumber
inner join customers on orders.customerNumber=customers.customerNumber
where quantityOrdered=(select max(quantityOrdered) from orderDetails);

select customerName,phone from customers
inner join orders on customers.customerNumber=orders.customerNumber
where orders.status in ('cancelled','disputed');

select * from orderDetails order by quantityOrdered desc limit 4;

select customerNumber,count(orderDate) as 'Number of Orders' from orders  where year(orderDate) between 2003 and 2004 group by customerNumber ;

select city,count(city)from customers group by city having count(city)>4;



