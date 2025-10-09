select * from dbo.Orders
select * from dbo.Order_Location
select * from dbo.Customer

select * from dbo.Users
select * from dbo.chatbot

WITH LondonOrder AS (
    SELECT ol.Id
    FROM dbo.Order_Location AS ol
    WHERE ol.Location = 'London'
)
SELECT o.*
FROM dbo.Orders AS o
WHERE o.order_location_id IN (SELECT Id FROM LondonOrder);


--with join 
with LondonOrder as (
select c.name,ol.location,o.items,o.price,o.order_date from dbo.Customer as c
join dbo.Order_Location as ol
on c.id=ol.customer_id
join dbo.Orders as o
on ol.id=o.order_location_id
where c.id=1
)
select * from LondonOrder

select * from dbo.Orders

with OrderTable as (
select o.price,count(*) as [Total count] from dbo.Orders as o group by o.price 
)
select * from OrderTable order by price



