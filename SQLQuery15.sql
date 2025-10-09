--day 15
--find the total sales for each product
--additonally add such details such order id ,order date
--find the total sales across all order
--find the combination of product and order status
select * from Sales.Orders

SELECT 
    o.OrderDate,
    o.OrderID,
    o.ProductID,
    o.OrderStatus,
    o.Sales,
    SUM(o.Sales) OVER (PARTITION BY o.ProductID order by o.Sales desc ) AS [total sales by ProductID],
    SUM(o.Sales) OVER (PARTITION BY o.OrderID) AS [total sales by OrderID],
    SUM(o.Sales) OVER (PARTITION BY o.ProductID, o.OrderStatus ) AS [total sales by ProductID and OrderStatus]
FROM Sales.Orders AS o;

--rank each order based on sales from higest to lowest
--additonally add such details such order id ,order date

select 
o.OrderID,
o.OrderDate,
o.Sales,
o.ProductID,
o.OrderStatus,
rank() over (order by o.Sales desc ) as [rank by sales]
from Sales.Orders as o

--frame
select 
o.OrderID,
o.OrderDate,
o.OrderStatus,
o.ProductID,
o.Sales,
sum(o.Sales) over(partition by o.OrderStatus order by o.OrderDate rows between current row and 2 following) as [window function]
from Sales.Orders as o

select 
o.OrderID,
o.OrderDate,
o.OrderStatus,
o.ProductID,
o.Sales,
sum(o.Sales) over(partition by o.OrderStatus order by o.OrderDate rows between 2 preceding and current row) as [window function]
from Sales.Orders as o

select 
o.OrderID,
o.OrderDate,
o.OrderStatus,
o.ProductID,
o.Sales,
sum(o.Sales) over(partition by o.OrderStatus order by o.OrderDate rows  2 preceding ) as [window function]
from Sales.Orders as o

SELECT 
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    o.ProductID,
    o.Sales,
    SUM(o.Sales) OVER (
        PARTITION BY o.OrderStatus 
        ORDER BY o.OrderDate 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS [window function]
FROM Sales.Orders AS o;


SELECT 
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    o.ProductID,
    o.Sales,
    SUM(o.Sales) OVER (
        PARTITION BY o.OrderStatus 
        ORDER BY o.OrderDate 
       -- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS [window function]
FROM Sales.Orders AS o;

SELECT 
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    o.ProductID,
    o.Sales,
    SUM(o.Sales) OVER (
        PARTITION BY o.OrderStatus 
        ORDER BY o.OrderDate 
        ROWS  2 PRECEDING 
    ) AS [window function]
FROM Sales.Orders AS o;

SELECT 
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    o.ProductID,
    o.Sales,
    SUM(o.Sales) OVER (
        PARTITION BY o.OrderStatus 
        ORDER BY o.OrderDate 
        ROWS  1 PRECEDING 
    ) AS [window function]
FROM Sales.Orders AS o;

select 
o.OrderID,
o.OrderDate,
o.OrderStatus,
o.Sales,
sum(o.Sales) over (partition by o.OrderStatus) as [windows function]
from Sales.Orders as o
order by o.OrderDate desc

select 
o.OrderDate,
o.OrderID,
o.ProductID,
o.Sales,
o.OrderStatus,
sum(o.Sales) over(partition by o.OrderStatus) as [check]
from Sales.Orders as o
where o.ProductID in(101,102)
order by o.OrderID desc

--rank customer based total sales
select 
o.CustomerID,
sum(o.Sales) as [total sales],
rank() over(order by sum(o.Sales) desc) as [window check]
 from Sales.Orders as o
 group by o.CustomerID

 --count aggreagate function
 select 
 o.Sales,
 o.OrderID,
 o.CustomerID,
 o.ProductID,
 count(o.CustomerID) over(partition by o.ProductID) as [rank]
 from
 Sales.Orders as o
 --find the number of product for each product
 
 select 
 p.Product,
 p.Category,
 COUNT(p.Product) over (partition by p.Category) as [total product]
 from Sales.Products as p

 select 
 p.Category,
 p.Price,
 COUNT(p.Product) over (order by p.Category desc ) as [total product]
 from Sales.Products as p
 group by COUNT(p.Product) over (order by p.Category desc )  


 --find the total number of product
 --addtiditional add details category and price
 select 
 p.Category,
 p.Price,p.Product,
 count(p.Product) over() as [total product],
 count( p.Category) over(partition by p.Product ) as[total category],
 count( p.Product) over(partition by p.Category ) as[total product partion by category]
 from Sales.Products as p

 --check whether the table orders contains duplicate rows
 select 
 *,count(1) over(partition by o.OrderId)as [check pk]
 from Sales.Orders as o

 select * from
 (select oa.OrderID,
 count(oa.OrderID) over(partition by oa.OrderId) as [check_pk] 
 from Sales.OrdersArchive as oa ) as sub where sub.check_pk>1
  

 SELECT 
    oa.OrderID,
    COUNT(*) AS [count]
FROM Sales.OrdersArchive AS oa
GROUP BY oa.OrderID
HAVING COUNT(*) > 1;

--find the total sales across all orders
--and the total sales for each products
--aditinally provide details such order id and order date
select o.OrderID,o.OrderDate,
sum(o.Sales) over(partition by o.ProductID) as [total sales],
sum(o.Sales) over()  as[test]   
from Sales.Orders as o

--find the percentage contribution of each product sales to the total sales
select * from
(select o.OrderID,
o.OrderDate,
o.Sales,
sum(o.Sales) over() as [total sales],
count(o.Sales) over() as [totals count sales],
--(CAST(SUM(o.Sales) over() as float) / COUNT(o.Sales) over())*100  AS [percentage]
round((CAST(o.Sales AS FLOAT) / SUM(o.Sales) OVER ()) * 100,2) AS [percentage_of_total]
from Sales.Orders as o)sub 

--find the avgerage sales across all orders
--and the avg sales for each product
--additioanally provide details such as order id and order date
select 
o.OrderID,
o.OrderDate,
o.ProductID,
o.Sales,
avg(o.Sales) over() as [total average sales],
avg(o.Sales)over(partition by o.ProductID ) as [product wise]
from Sales.Orders as o

--find the avg score of customer
--additionally prvide details customer id and last name
select 
c.CustomerID,
c.FirstName,c.LastName,
c.Score,
avg(nullif(isnull(c.Score,1),0)) over() as [avg score],
COALESCE(c.LastName,'unknown')  as [last name]
from Sales.Customers as c

--find all orders where sales are higher than the avgerage sales acroess all orders
select 
o.OrderID,
o.OrderDate,
o.Sales,
case
when o.Sales>avg(o.Sales)  over() then 'your sales is higher than avg sales'
else 'your sales is lower than avg sales'
end as [sales]
from Sales.Orders as o

--find the highest and lowest sales of all oredr
--find the higest and lowest sales for each product
--additionally provide details such order id and order date
select 
o.OrderID,
o.OrderDate,
o.Sales,
o.ProductID,
max(o.Sales) over( ) as [max sales  orderid],
min(o.Sales) over( ) as [min sales orderid],
max(o.Sales) over(partition by o.ProductID ) as [max sales partion by ProductID],
min(o.Sales) over(partition by o.ProductID ) as [min sales partion by ProductID]
from Sales.Orders as o

--show the employye who have higest salary
SELECT * FROM (
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.Salary,
        MAX(e.Salary) OVER () AS [highest_salary]
    FROM Sales.Employees AS e
) sub
WHERE sub.Salary = sub.highest_salary;

