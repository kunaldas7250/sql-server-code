create schema Snowflake
go
create table Snowflake.Sales(
OrderId int not null,
ProductId int not null,
CustomerId int not null,
DateId int not null,
Amount int not null,
constraint fk_ProductId foreign key (ProductId) references Snowflake.Product(ProductId),
constraint fk_CustomerId foreign key (CustomerId) references Snowflake.Customer(CustomerId)
)
create table Snowflake.Product(
ProductId int not null primary key,
Name varchar(50) unique,
CategoryID int not null,
constraint fk_CategoryID foreign key (CategoryID) references Snowflake.Category(CategoryID)
)
create table Snowflake.Category(
CategoryID int not null primary key,
CategoryName varchar(50) unique

)

create table Snowflake.Customer(
CustomerId int not null primary key,
Name varchar(50) not null unique,
CityId int not null,
constraint fk_CityId foreign key (CityId) references Snowflake.City(CityId)
)
create table Snowflake.City(
CityId int not null primary key,
CityName varchar (50)unique,
StateId int not null,
constraint fk_StateId foreign key (StateId) references Snowflake.State(StateId)
)
create table Snowflake.State(
StateId int not null primary key,
StateName varchar(50) unique

)



-- State
INSERT INTO Snowflake.State (StateId, StateName) VALUES
(1, 'Karnataka'),
(2, 'Delhi'),
(3, 'Telangana');

-- City
INSERT INTO Snowflake.City (CityId, CityName, StateId) VALUES
(1, 'Bangalore', 1),
(2, 'Delhi', 2),
(3, 'Hyderabad', 3);

-- Category
INSERT INTO Snowflake.Category (CategoryID, CategoryName) VALUES
(1, 'Mobile'),
(2, 'Electronics'),
(3, 'Fashion');

-- Product
INSERT INTO Snowflake.Product (ProductId, Name, CategoryID) VALUES
(1, 'iPhone 15', 1),
(2, 'Samsung TV', 2),
(3, 'Nike Shoes', 3);

-- Customer
INSERT INTO Snowflake.Customer (CustomerId, Name, CityId) VALUES
(1, 'Kunal', 1),
(2, 'Priya', 2),
(3, 'Ravi', 3);

-- Sales
INSERT INTO Snowflake.Sales (OrderId, ProductId, CustomerId, DateId, Amount) VALUES
(1001, 1, 1, 20251001, 75000),
(1002, 2, 2, 20251002, 120000),
(1003, 3, 3, 20251003, 6000),
(1004, 1, 2, 20251001, 76000);

create view Power_bi_leraning as 
(select c.Name,ci.CityName,st.StateName,p.Name,s.Amount,ca.CategoryName from Snowflake.Sales as s
left join Snowflake.Customer as c
on s.CustomerId=c.CustomerId
left join Snowflake.City as ci
on c.CityId=ci.CityId
left join Snowflake.State as st
on ci.StateId=st.StateId
left join Snowflake.Product as p
on s.ProductId=p.ProductId
left join Snowflake.Category as ca
on p.CategoryID=ca.CategoryID
)

CREATE VIEW Power_bi_learning AS
SELECT 
    c.Name AS CustomerName,
    ci.CityName,
    st.StateName,
    p.Name AS ProductName,
    s.Amount,
    ca.CategoryName
FROM Snowflake.Sales AS s
LEFT JOIN Snowflake.Customer AS c
    ON s.CustomerId = c.CustomerId
LEFT JOIN Snowflake.City AS ci
    ON c.CityId = ci.CityId
LEFT JOIN Snowflake.State AS st
    ON ci.StateId = st.StateId
LEFT JOIN Snowflake.Product AS p
    ON s.ProductId = p.ProductId
LEFT JOIN Snowflake.Category AS ca
    ON p.CategoryID = ca.CategoryID;

