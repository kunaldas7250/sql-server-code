--day 18
-- cte 
--step 1:find the total sales per customer
--CTE
with CTE_TOTAL_SALES AS (
select 
CustomerID 
,sum(Sales) as [total sales] 
from Sales.Orders 
group by CustomerID
)
--MAIN QUERY
SELECT 
c.CustomerID,c.FirstName,c.Country,c.Score,cts.[total sales]
FROM 
Sales.Customers AS c
left join CTE_TOTAL_SALES cts
on cts.CustomerID=c.CustomerID
--multiple standlone cte
--step2:find the last order for each per customer
with CTE_TABLE AS (
SELECT CustomerId,
sum(Sales) as [total sales]
from Sales.Orders AS O
group by CustomerID)
,
CTE_TABLE_2 AS (
SELECT O.CustomerID,max(O.OrderDate) as [last order] FROM Sales.Orders AS O group by o.CustomerID
)
SELECT C.CustomerID,C.FirstName,cte.[total sales],CTE2.[last order]
FROM Sales.Customers AS C
left JOIN CTE_TABLE as cte
on cte.CustomerID=C.CustomerID
LEFT JOIN CTE_TABLE_2 AS CTE2
ON CTE2.CustomerID=C.CustomerID
--RANK THE CUTSOMER BASED ON THEIR ON THIER TOTAL SALES PER CUSTOMER
WITH CTE_TABLE_1 AS (
SELECT 
Sales,
CustomerID,
rank() over(order by CustomerID)  as [rank_based] 
FROM Sales.Orders
),CTE_TABLE_2 AS (
SELECT 
CustomerID,
SUM(Sales) as [total sales] ,
MAX([rank_based]) AS [MAX_RANK]
FROM CTE_TABLE_1 
group by CustomerID
)
select 
c.CustomerID,
c.FirstName,
c.Country,
sec.[total sales],
sec.MAX_RANK
from Sales.Customers as c
left join CTE_TABLE_2 AS SEC
ON SEC.CustomerID=C.CustomerID

--step 4:segment custoemr based on their total sales
WITH CTE_TABLE_1 AS (
    SELECT 
        CustomerID,
        Sales
    FROM Sales.Orders
),
CTE_TABLE_2 AS (
    SELECT 
        CustomerID,
        SUM(Sales) AS [total_sales],
        RANK() OVER (ORDER BY SUM(Sales) DESC) AS [rank_based_on_customer]
    FROM CTE_TABLE_1
    GROUP BY CustomerID
),
CTE_TABLE_3 AS (
    SELECT 
        CustomerID,
        CASE 
            WHEN total_sales > 100 THEN 'HIGH'
            WHEN total_sales > 50  THEN 'Medium'
            ELSE 'Low'
        END AS [Customer_segment]
    FROM CTE_TABLE_2
),CTE_TABLE_4 AS (
SELECT 
O.CustomerID,
max(O.OrderDate) as [last order]
FROM Sales.Orders AS O 
group by o.CustomerID
)
SELECT 
    C.CustomerID,
    C.FirstName,
    C.Country,
    SEC.total_sales,
    SEC.rank_based_on_customer,
    thir.Customer_segment,
    FORTH.[last order]
FROM Sales.Customers AS C
LEFT JOIN CTE_TABLE_2 AS SEC
    ON SEC.CustomerID = C.CustomerID
LEFT JOIN CTE_TABLE_3 AS thir
    ON thir.CustomerID = C.CustomerID
    LEFT JOIN CTE_TABLE_4 AS FORTH
    ON FORTH.CustomerID=C.CustomerID


    --GENAARTE A SEQUENCE OF NUMBER 1 TO NUMBER
    WITH SERIES AS (
    --ANCHOR QUERY
    SELECT 1 AS MYNUMBER
    UNION ALL
    --RECURSIVE QUERY
    SELECT 
    MYNUMBER +1
    FROM SERIES
    WHERE MYNUMBER<20
    )
    SELECT * FROM SERIES
    --SHOW THE EMPLOYEE HIERACY BY DISPLAYING EACH EMPLOYEE'S LEVEL WITHIN THE ORGANISATION
    WITH CTE_EMP_HIERARCY AS (
    --ANCHOR QUERY
    SELECT 
    EmployeeID,
    FirstName,
    ManagerID,
    1 AS LEVEL 
    FROM Sales.Employees
    WHERE ManagerID IS NULL
    UNION ALL
    --RECURISEIVE QUERY
    SELECT 
   E.EmployeeID ,
    E.FirstName,
    E.ManagerID,
     LEVEL + 1
    FROM Sales.Employees AS E
   -- WHERE E.ManagerID=1
   INNER JOIN CTE_EMP_HIERARCY AS CT
   ON E.ManagerID=CT.EmployeeID
    )
    --MAIN QUERY
    SELECT * FROM CTE_EMP_HIERARCY

    SELECT * FROM Sales.Employees