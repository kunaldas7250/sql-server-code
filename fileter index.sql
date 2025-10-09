select * into Db_customer_usa from Sales.Customers

create  nonclustered index idx_Db_Customer_usa on dbo.Db_customer_usa(Country) where Country='USA'

drop index idx_Db_Customer_usa on dbo.Db_customer_usa

select * from dbo.Db_customer_usa


