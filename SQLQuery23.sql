--step 1- find the total sales per customers
select * from Sales.Orders

WITH TotalSales AS (
    SELECT 
        o.CustomerID,
        o.OrderStatus,
        SUM(o.Sales) AS TotalSales
    FROM Sales.Orders AS o
    GROUP BY o.CustomerID, o.OrderStatus
)
SELECT 
    c.FirstName,
    c.LastName,
    c.Country,
    SUM(c.Score) AS TotalScore,
    ts.OrderStatus,
    ts.TotalSales
FROM Sales.Customers AS c
JOIN TotalSales AS ts
    ON c.CustomerID = ts.CustomerID
GROUP BY 
    c.FirstName,
    c.LastName,
    c.Country,
    ts.OrderStatus,
    ts.TotalSales
ORDER BY ts.TotalSales DESC;


--find the running total sales for each month

WITH Cte_summary AS (
    SELECT 
        DATETRUNC(MONTH, o.OrderDate) AS [Month],
        SUM(o.Sales) AS [TotalSales],
        count(OrderID) as [totalorder],
        sum(o.Quantity) as [total quantity]
    FROM Sales.Orders AS o 
    GROUP BY DATETRUNC(MONTH, o.OrderDate)
)
SELECT 
    [Month],
    TotalSales,
    SUM(TotalSales) OVER (ORDER BY [Month]) AS RunningTotal
FROM Cte_summary


select * from Cte_summary

drop view Cte_summary


--task:provide view that combine details from others,products customers,employee
create view Sales.Order_details as (
SELECT 
    o.OrderID,
    o.Sales,
    o.Quantity,
    o.OrderDate,
    P.Category,
    P.Product,
    CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
    c.Country AS [Customer Country],
    CONCAT(e.FirstName, ' ', e.LastName) AS [shales Name],
    e.Department
FROM Sales.Orders AS o
LEFT JOIN Sales.Products AS P
    ON P.ProductID = o.ProductID
LEFT JOIN Sales.Customers AS c
    ON c.CustomerID = o.CustomerID
    left join Sales.Employees as e
    on e.EmployeeID=o.SalesPersonID )


    select * from Sales.Order_details

--provide a view for uo sales team
--tahat cobine tables from all tables
--and exclusive data to the usa
CREATE VIEW Sales.Protated_view as 
(
SELECT 
    o.OrderID,
    o.Sales,
    o.Quantity,
    o.OrderDate,
    P.Category,
    P.Product,
    CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
    c.Country AS [Customer Country],
    CONCAT(e.FirstName, ' ', e.LastName) AS [shales Name],
    e.Department
FROM Sales.Orders AS o
LEFT JOIN Sales.Products AS P
    ON P.ProductID = o.ProductID
LEFT JOIN Sales.Customers AS c
    ON c.CustomerID = o.CustomerID
    left join Sales.Employees as e
    on e.EmployeeID=o.SalesPersonID 
    where c.Country!='USA'
    )

    select * from Sales.Protated_view

    if OBJECT_ID('Sales.MonthlyOrder','u')is not null
    drop table Sales.MonthlyOrder
    go
    select 
    datename(month,o.OrderDate) as [Order date],
    count(o.OrderID) as [Total order]
    into Sales.MonthlyOrder
    from Sales.Orders as o
    group by datename(month,o.OrderDate)

    select * from Sales.MonthlyOrder


    select
    * 
    into #Order
    from 
    Sales.Orders


    select * from #Order

    delete from #Order
    where OrderStatus='Delivered'