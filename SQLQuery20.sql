--day 17
--subquery
--scalar subquery
select avg(Sales) as [scalar subquery return only 1 value] from Sales.Orders
-- row query
select Sales from Sales.Orders
--table query
select * from Sales.Orders
select Sales,OrderStatus from Sales.Orders

--table query from
--find the product that have a price higer than the avg price of all product
SELECT *
FROM (
    SELECT 
        Price,
        AVG(Price) OVER () AS [avg price]
    FROM Sales.Products
) AS sub
WHERE Price > [avg price];

-- rank the customers based on thir total no of sales
select * from (select Sales,CustomerID,OrderStatus,sum(Sales) over(partition by CustomerID order by Sales desc ) as [check] from Sales.Orders)sub

select *,rank() over(order by [total_sales] desc) as [customer rank] from (
select CustomerID,sum(Sales) as [total_sales] from Sales.Orders group by CustomerID
)sub

--selelct query
--shows the productid ,name,price and total no orders
select ProductID,PRODUCT,Price,
(select count(*) as [total no of orders] from Sales.Orders)sub
from Sales.Products
--join query
-- shows all customer detils and find the total no of each customer
select c.*,o.[total customer] from Sales.Customers as c
left join(
select CustomerID,count(*) as [total customer] from Sales.Orders group by CustomerID)o
on c.CustomerID=o.CustomerID

--where query
--find the product that have a price higer than the avg price of all product
select * from Sales.Products where Price>(select avg(Price) from Sales.Products )

--show the details of orders made by in customers
select * from Sales.Orders where CustomerID in(
select CustomerID from Sales.Customers where Country ='Germany')
--show the details of orders made by  not in customers
select * from Sales.Orders where CustomerID in(
select CustomerID from Sales.Customers where Country !='Germany')

--find the female employee whose salary is greter than  any male salary
select * from Sales.Employees where Gender='F' and Salary> any(
select Salary from Sales.Employees where Gender='M')

--find the female employee whose salary is greter than  all male salary
select * from Sales.Employees where Gender='M' AND Salary<any(
select Salary from Sales.Employees where Gender='F')

-- shows all customer detils and find the total no of each customer
--scalar sub query
--corealeted subquery
select * ,
(select count(*) from Sales.Orders o where o.CustomerID=c.CustomerID) as [total sales]
from Sales.Customers c
--exist sub query
--show the order details  for customer in germany
select * from Sales.Orders o where exists(
select * from Sales.Customers c where Country='Germany' and o.CustomerID=c.CustomerID  )

--show the order details  for customer  notin germany
select * from Sales.Orders o where  not exists(
select * from Sales.Customers c where Country='Germany' and o.CustomerID=c.CustomerID  )
