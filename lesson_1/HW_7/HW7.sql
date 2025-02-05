go
use W3Resource
go

--HW7
--1

select Inventory.Salesman.name as Salesman, Inventory.Customer.cust_name,Inventory.Customer.city
from Inventory.Salesman, Inventory.Customer
where Inventory.Salesman.city=Inventory.Customer.city

--2 From the following tables write a SQL query to find those orders where the order
--amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select   Inventory.Customer.cust_name, Inventory.Customer.city,
 Inventory.Orders.ord_no,  Inventory.Orders.purch_amt
 from  Inventory.Customer,Inventory.Orders
 where  Inventory.Orders.purch_amt between 500 and 2000

 --3
  --From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents.
		select* from  Inventory.Customer
	    select* from  Inventory.Salesman
	 
  select  a.cust_name,a.city,b.salesman_id, b.commission from Inventory.Customer a
  join Inventory.Salesman b on 
  a.salesman_id=b.salesman_id

  --4
  --Customer Name, customer city, Salesman, commission.  
  select a.cust_name,a.city , b.salesman_id,b.commission 
  from Inventory.Customer a
  join   Inventory.Salesman b 
  on a.salesman_id=b.salesman_id
  where b.commission >  0.12
  order by b.commission desc
  --5
  select a.cust_name,a.city,a.salesman_id,b.city,b.commission from Inventory.Customer a
  join
  Inventory.Salesman b on 
  a.salesman_id=b.salesman_id
  where a.city != b.city and 
  b.commission>0.12
  --6
  --From the following tables write a SQL query to find the details of an order.
  --Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission


  select a.ord_no, a.ord_date, a.purch_amt, b.cust_name, b.grade, b.salesman_id, d.commission
  from Inventory.Orders a
  join Inventory.Customer b
  on a.customer_id=b.customer_id
  join Inventory.Salesman d on a.salesman_id=d.salesman_id
  --7
  select 
  b.cust_name,b.city,b.grade,
    a.ord_no,a.purch_amt,a.ord_date,a.customer_id, a.salesman_id,
	
	c.commission 
	from Inventory.Orders a
	join Inventory.Customer b 
	 on a.customer_id=b.customer_id
	 join 
	 Inventory.Salesman c on a.salesman_id=c.salesman_id
	


	--8
select
a.customer_id,a.cust_name,a.city, a.grade, a.salesman_id,
b.city
from Inventory.Customer a
join 
Inventory.Salesman b on 
a.salesman_id=b.salesman_id
order by a.customer_id desc


---9
select
a.cust_name,a.city, a.grade, a.salesman_id,
b.city
from Inventory.Customer a
join 
Inventory.Salesman b on 
a.salesman_id=b.salesman_id
where a.grade<300 
order by a.customer_id desc

--10
 select a.cust_name,a.city,
 b.ord_no,b.purch_amt,   b.ord_date    
 from Inventory.Customer a
 join
 Inventory.Orders b on
 a.customer_id=b.customer_id
 order by b.purch_amt asc
 
 --11
 select a.cust_name,a.city,
 b.ord_no,b.purch_amt,   b.ord_date ,
 c.name,c.commission

 from Inventory.Customer a
 join
 Inventory.Orders b on
 a.customer_id=b.customer_id
 join 
 Inventory.Salesman c on
 a.salesman_id =c.salesman_id
 


 