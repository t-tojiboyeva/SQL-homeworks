--Homework6
use W3Resource
go
 select sum(purch_amt)
 from inventory.orders
  


  select avg (purch_amt) as 'average purchase'
  from inventory.orders

  select  count (distinct salesman_id)
  from inventory.orders

  select count (customer_id)
  from inventory.customer

  select count (customer_id	)
  from inventory.customer
  where grade is not null

  select max (purch_amt)
  from inventory.orders

  select min (purch_amt)
  from inventory.orders
  

  select max(grade ),city
  from inventory.customer
  
  
  select max (grade ),city 
  from inventory.customer
  group by (city) 

  select max (purch_amt),customer_id
  from inventory.orders
  group by customer_id

   select customer_id, max (purch_amt)
  from inventory.orders
  group by customer_id

  select ord_date, max (purch_amt)
  from inventory.orders

  
  select customer_id, ord_date, max (purch_amt) as 'max'
  from inventory.orders
  group by customer_id,ord_date

  select salesman_id, max (purch_amt)
  from inventory.orders
  where ord_date='2012-08-17'
  group by salesman_id

  select salesman_id,ord_date, max (purch_amt) as 'max'
  from inventory.orders
  where purch_amt > 2000
  group by salesman_id,ord_date,purch_amt


  select customer_id,ord_date ,	max(purch_amt) 
  from inventory.orders
  group by customer_id,ord_date 
  having max( purch_amt) in (2000, 3000, 5760, 6000)

  select customer_id, max (purch_amt)
  from inventory.orders
  group by customer_id
  having customer_id between 3002 and 3007


  select salesman_id , max (purch_amt)
  from inventory.orders
  group by salesman_id
  having salesman_id between 5003  and 5008


  select count (*) from inventory.orders

  where ord_date='2012-08-17'


  select count  (salesman_id )
  from inventory.salesman


  select  count (*), ord_date, salesman_id
  from inventory.orders
  group by ord_date , salesman_id

	
	select avg (pro_price) as 'average price'
	from item_mast

	select count (*) as [number of products]
	from item_mast
	where  pro_price >=350


	select avg ( distinct pro_price ) as [average price ],pro_com
	from item_mast 
	group by pro_com 

	select sum (dpt_allotment)
	from emp_details

	select emp_dept,count (emp_idno)  as [count]
	from	emp_details
	group by emp_dept
	 --------------------------------
	 select * from employee.employees e
where salary in (select max(salary) from employee.employees where e.dep_id = dep_id group by dep_id)

begin tran
insert into employee.employees
values
(63667, 'ALEX', 'MANAGER', 68319, '1992-01-05', 2750, null, 1001)
select * from employee.employees

--Hometask
--Return people who get the 2nd highest salaries in each departments

/*
dep_id in employee.employees
dep_id in employee.departments

employee.employees.dep_id = employee.departments.dep_id

e.dep_id = e1.dep_id
*/
	 select max (salary )as [max],emp_name,job_name 
	 
	 from employee.employees
	  group by emp_name,job_name 

