--rows store
select * into FactinternetSales_rs
from dbo.FactInternetSales

create clustered index idx_test_row_clustered on 
dbo.FactinternetSales_rs(SalesOrderNumber,SalesOrderLineNumber)