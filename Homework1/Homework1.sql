create database MyDatabase
use MyDatabase
 create table Employees (
    EmployeeID  int primary key ,
    FullName varchar(100),
    Position varchar(50),
    Salary int 
)

create table Departments (
    DepartmentID int primary key,
    DepartmentName varchar(100),
    ManagerID int
)

create table Customers (
    CustomerID int primary key,
    FullName varchar(100),
    Email varchar(100),
    Phone varchar(15)
)

create table Orders (
    OrderID int primary key,
    CustomerID int,
    OrderDate  date,
    TotalAmount int  )

create table Products (
    ProductID int primary key,
    ProductName varchar(100),
    Price int  
)

create table Suppliers (
    SupplierID int primary key,
    SupplierName varchar(100),
    ContactInfo varchar(100)
)

create table Payments (
    PaymentID int primary key,
    OrderID int,
    PaymentDate date,
    Amount int  
)

create table Inventory (
    InventoryID int primary key,
    ProductID int,
    StockQuantity int
)

create table Shipments (
    ShipmentID int primary key,
    OrderID int,
    ShipmentDate date,
    status varchar (50)
)

create table Reviews (
    ReviewID int primary key,
    CustomerID int,
    ProductID int,
    Rating int,
    ReviewText text
)
create login MyUser  with password = 'SimplePassword123';
 create user  MyUser  for login  MyUser;
 grant select ,update on   Employees to  MyUser;
grant select,update on Customers to MyUser;
grant select, update on Orders to MyUser;
grant select,update on Products to MyUser;
grant select, update on Inventory to MyUser;


 select *from  Reviews