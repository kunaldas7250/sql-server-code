-- table
select * from Sales.Orders

select * from Sales.Orders as o order by o.Sales desc
offset 1 rows fetch next 1 rows only

SELECT TOP 1 *
FROM Sales.Orders AS o
WHERE o.Sales < (
    SELECT MAX(Sales)
    FROM Sales.Orders
)
ORDER BY o.Sales DESC;
