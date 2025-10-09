--day 6
-- cast
select
'123',cast('123' as int) as [string to int],
cast(123 as varchar)as [int to string],
cast('2025-12-05'as date)as [string to date],
cast('2025-12-05'as datetime)as [string to datetime],o.CreationTime,cast(o.CreationTime as date) as [datetime to date]
from Sales.Orders as o

--dateadd 
select o.OrderID,o.OrderDate,
DATEADD(year,3,o.OrderDate) as [adding 3 to year],
DATEADD(month,8,o.OrderDate) as [adding 8 to month]
from Sales.Orders as o
where month(o.OrderDate)=1

select o.OrderID,o.OrderDate,
DATEADD(year,3,o.OrderDate) as [adding 3 to year],
DATEADD(year,-2,o.OrderDate) as [subtract 2 to year],
DATEADD(month,8,o.OrderDate) as [adding 8 to month],
DATEADD(month,-1,o.OrderDate) as [subtract 1 to month],
DATEADD(day,8,o.OrderDate) as [adding 8 to day],
DATEADD(day,-5,o.OrderDate) as [subtract 2 to day]
from Sales.Orders as o

--calculated the age of employee
select e.BirthDate, GETDATE() as [presentday],DATEDIFF(year,e.BirthDate,getdate()) as [age of employee]
from Sales.Employees as e

--find the average shipping duration in days for each month
select month(o.OrderDate) as [oder_month] ,
avg(datediff(day,o.OrderDate,o.ShipDate)) as [average shippdate] 
from Sales.Orders as o 
group by month(o.OrderDate)
--time gap analisic
--find the number of days between each order and previous order
select o.OrderID,o.OrderDate as currenrt_order_date,
LAG(o.OrderDate) over (order by o.OrderDate) as [prev order date] ,
DATEDIFF(day,LAG(o.OrderDate) over (order by o.OrderDate),o.OrderDate) as [date diff prevorder]
from Sales.Orders as o

--check date or not
select ISDATE('123') as [check date or not],
ISDATE('2025') as [check valid year or not],
ISDATE(2025-02-15) as [check valid date or not],
isdate(20-02-2025) as [check],
isdate('09') as [check]