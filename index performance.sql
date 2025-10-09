select * into Sales.DbCustomer
from Sales.Customers

select * from Sales.DbCustomer

insert into Sales.DbCustomer(CustomerID ,FirstName,LastName,Country,Score)
select CustomerID ,FirstName,LastName,Country,Score
from Sales.Customers
where Country='USA'

create clustered index idx_DbCustoemer_CustomerID
on Sales.DbCustomer(CustomerID)

drop index idx_DbCustoemer_CustomerID on Sales.DbCustomer

create nonclustered index idx_DbCustomer_LastName on Sales.DbCustomer(LastName)

create nonclustered index idx_Dbcustomer_FirstName on Sales.DbCustomer(FirstName)


create nonclustered index idx_Dbcustomer_CountryScore on Sales.DbCustomer(Country,Score)