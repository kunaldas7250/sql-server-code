select count(*) from dbo.customer
select * from dbo.customer

select * from dbo.customer order by Client_Num
offset 100  rows fetch next 10  rows only


select count(*) from dbo.credit_card

create clustered columnstore index idx_test on dbo.customer

select c.Gender,count(*) as [total customer] from dbo.customer as c group by c.Gender
order by c.Gender desc




select 
c.Customer_Job,
count(c.Customer_Job) as [job] ,
count(c.Cust_Satisfaction_Score) as [job score] ,
c.Gender,
sum(c.Income) as [total income],
c.Customer_Age
from dbo.customer as c 
group by c.Customer_Job,c.Customer_Age,c.Gender
order by c.Customer_Job ,[total income],c.Gender

CREATE NONCLUSTERED COLUMNSTORE INDEX idx_non_clustered_column
ON dbo.Customer (Customer_Age, Gender);

drop index idx_test on dbo.Customer

drop index idx_non_clustered_column on dbo.Customer