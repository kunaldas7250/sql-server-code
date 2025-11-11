select * from dbo.orders as o order by o.sales


--3 highest sales
select * from dbo.orders  as o order by o.sales desc
offset 2 rows fetch next 1 rows only

select min(o.sales) from dbo.Orders  as o where o.sales<(select * from dbo.orders as o) order by o.sales


select * from (
select *, DENSE_RANK() over (order by Sales desc) as rnk
from dbo.orders
) as ranked
where rnk=3