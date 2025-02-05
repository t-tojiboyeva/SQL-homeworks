go
use Northwind
go 
--HW8
--1

select * from Shippers
--2
select CategoryName,Description
from Categories
--3
select FirstName,LastName,HireDate
from
--4

--5
select* from Orders
where EmployeeID=5
--6
select supplierId,ContactName,ContactTitle from Suppliers
where ContactTitle !='Marketing Manager'
--7
select * from Products
where ProductName like  'Queso%' 
--8
select  orderId,CustomerId,ShipCountry from Orders
where ShipCountry in ('France' , 'Belgium')
--9
select * from Orders
where ShipCountry in ('Brazil','Mexico',' Argentina',' Venezuela')
--10
select FirstName, LastName, Title, BirthDate from Employees
order by BirthDate asc
--11
select FirstName, LastName, Title, format (BirthDate,'yyyy-mm-dd')as birthdate
from Employees
order by  BirthDate
--12
 select FirstName,LastName ,firstname +'   '+ lastname  as [Full Name]
 from	Employees
 --13
 select OrderID, ProductID, UnitPrice, 
Quantity, (unitPrice*quantity) as [total]from OrderDetails
order by OrderID , ProductID
--14
select count(customerId ) from Customers
--15
select min (OrderDate) from Orders
--16
select *from customers	

--17
select ContactTitle ,count (ContactTitle) as [Total]from Customers
group by ContactTitle
--18
select 
ProductID, ProductName,  
s.CompanyName  from Products p
join
Suppliers s on s.SupplierID=p.SupplierID
ORDER BY ProductID

--19
select * from Orders
select * from Shippers
select	 OrderID,format (OrderDate, 'yyyy-mm-dd') as
orderdate, sh.CompanyName 
from Orders o
join
Shippers sh on
o.ShipVia=sh.ShipperID
where OrderID < 10300
order by OrderID
--20
select * from Categories
select * from Products
select CategoryName,  p.ProductID from Categories c
join 
Products p on
c.CategoryID=p.CategoryID

--21
select country,city,count (*) as TotalCustomers
from Customers
group by Country,city
order by Country,city
--22
select  ProductID,ProductName,
UnitsInStock,ReorderLevel 
from Products
where UnitsInStock< ReorderLevel
order by ProductID
--23
select  ProductID, ProductName, 
UnitsInStock ,UnitsOnOrder,
ReorderLevel,Discontinued
from Products
where (UnitsInStock +UnitsOnOrder)<= ReorderLevel and
 Discontinued=0
--24
select customerId,CompanyName,Region,
CASE
WHEN Region IS NULL THEN 1 ELSE 0 END AS RegionSort
FROM Customers
ORDER BY RegionSort, Region, CustomerID
 --25 
select  ShipCountry,
AVG (Freight) as [average Freight]
from Orders

group by ShipCountry
order by [average Freight] desc
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY
-
--26
select  ShipCountry,
AVG (Freight) as [average Freight]
from Orders
where OrderDate between '2015-01-01' and '2015-12-30'
group by ShipCountry
order by [average Freight] desc
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY
--27
select  ShipCountry,
AVG (Freight) as [average Freight],

Dateadd(yy, -1, (Select Max(OrderDate) from Orders))
from Orders
group by ShipCountry
order by [average Freight] desc
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY
--29
select*from Employees
select*from Orders
select*from Products
select*from OrderDetails

select e.EmployeeID,LastName,o.OrderID,p.ProductID
Quantity from Employees e 
join Orders o on e.EmployeeID=o.EmployeeID
join OrderDetails od on o.OrderID=od.OrderID
join Products p on p.ProductID=od.ProductID
order by od.OrderID,p.ProductID


--30
SELECT c.CustomerID, c.CompanyName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
