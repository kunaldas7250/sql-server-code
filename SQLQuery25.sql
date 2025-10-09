

-- multiple standlone cte

with playerTeam as (
select ict.name as [Team name],
p.player_name as [Player name],
string_agg(pr.role_name,',') as [Player Role] 
from dbo.IndianCricketTeam as ict
join  dbo.Player as p
on ict.id=p.team_id
join dbo.PlayerRole as pr
on p.id=pr.player_id
group by p.player_name,ict.name
),
 Customer_Cte as (
select 
c.name as [Customer name] 
,ol.location as [Customr_location],
count(o.items) as [Total item order],
min(year(o.order_date)) as [first order year],
max(year(o.order_date)) as [last order year],
sum(o.price) as [customer price]
from dbo.Customer as c
join dbo.Order_Location as ol
on c.id=ol.customer_id
join dbo.Orders as o
on o.order_location_id=ol.id
group by c.name,ol.location
)

SELECT *
FROM playerTeam AS pl
CROSS JOIN Customer_Cte AS ct;

