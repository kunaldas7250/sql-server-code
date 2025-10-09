--day 4
--using salesdb,retrive alist of all orders,along with the releted customers,product and employee deteails
--ordder id,customers name,product name,sales,price ,sales person name
select o.OrderID ,o.Sales,c.FirstName,c.LastName,p.Product,p.Price,e.FirstName,e.LastName,e.Gender,e.Salary
from Sales.Orders as o
left join Sales.Customers as c
on o.CustomerID=c.CustomerID
left join Sales.Products as p
on o.ProductID=p.ProductID
left join Sales.Employees as e
on o.SalesPersonID=e.EmployeeID

--union operator
select c.FirstName,c.LastName
from Sales.Customers as c
union
select e.FirstName,e.LastName from Sales.Employees as e

SELECT c.FirstName, c.LastName, NULL AS BirthDate, NULL AS Gender
FROM Sales.Customers AS c
UNION
SELECT e.FirstName, e.LastName, e.BirthDate, e.Gender
FROM Sales.Employees AS e;


--combine the data from employee and customtomer into 1 table include duplicate
select e.FirstName,e.LastName
from Sales.Employees as e
union all
select c.FirstName,c.LastName 
from Sales.Customers as c

--combine the data from employee and customtomer into 1 table without duplicate
select e.FirstName,e.LastName
from Sales.Employees as e
union 
select c.FirstName,c.LastName 
from Sales.Customers as c

--find the employee who are not customers at the same time
select e.FirstName,e.LastName
from Sales.Employees as e
except
select c.FirstName,c.LastName
from Sales.Customers as c

--find employee who are also customers
select e.FirstName,e.LastName
from Sales.Employees as e
intersect
select c.FirstName,c.LastName
from Sales.Customers as c

--order data are stored in separte table(order and orderarhive)
--combine all order data into one report without duplicate

select 
'order'as sourceorder,
[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
from Sales.Orders as o
union
select 
'orderarchive'as sourceorderarchive,
[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
from Sales.OrdersArchive as oa
order by OrderID

--order data are stored in separte table(order and orderarhive)
--combine all order data into one report with duplicate
select 
'order'as sourceorder,
[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
from Sales.Orders as o
union all
select 
'orderarchive'as sourcearchive,
[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
from Sales.OrdersArchive as oa
order by OrderID

