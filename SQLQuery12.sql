--join topic
--no join
--retrive all data from customers and orders in two different result
select * from customers
select * from orders

--inner join
--get all customers along with orders,but only for customers who have placed on order
select c.id,
c.first_name,
c.country,
o.order_id,
o.order_date,
o.sales
from customers as c
inner join orders as o
on c.id=o.customer_id


--USING FILTER AND ASCEDING
select c.id,
c.first_name,
c.country,
o.order_id,
o.order_date,
o.sales
from customers as c
inner join orders as o
on c.id=o.customer_id
where country in ('USA')
order by o.order_date asc

--WHERE SALES IS GREATER THAN 30
SELECT c.id,
c.first_name,
c.country,
o.order_date,
o.sales,
o.order_id
from customers AS c
inner join orders as o
on c.id=o.customer_id
where sales >30

--WHERE SALES IS smaller than 30
SELECT c.id,
c.first_name,
c.country,
o.order_date,
o.sales,
o.order_id
from customers AS c
inner join orders as o
on c.id=o.customer_id
where sales <30

--retrive all customers and orders country in usa and recent order and hisgest number of sales
select c.id,
c.first_name,
c.country,
o.order_date,
o.sales,o.order_id
from customers as c
inner join orders as o
on c.id=o.customer_id
where c.country in('USA')
order by o.order_date asc ,o.sales desc

--left join
-- get all customer along with their orders,including those without orders
select *
from customers as c
left join orders as o
on c.id=o.customer_id


--get all customer and order sales are greter than 30
select *
from customers as c
left join orders as o
on c.id=o.customer_id
where o.sales >30


--get all customers along with their orders ,including orders without matching customers
select * from orders as o
left join  customers as c
on c.id=o.customer_id

--right join
select * from  customers as c
right join  orders as o
on c.id=o.customer_id

-- get all customers and orders even if there is no match
select c.id,c.first_name,o.sales,o.order_id
from customers as c
full join orders as o
on c.id=o.customer_id

