
CREATE SCHEMA star;
GO

-- Fact Table
CREATE TABLE star.Sales (
    SalesId INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    CustomerId INT NOT NULL,
    DateId INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_Sales_Product FOREIGN KEY (ProductId) REFERENCES star.Product(ProductId),
    CONSTRAINT fk_Sales_Customer FOREIGN KEY (CustomerId) REFERENCES star.Customer(CustomerId),
    CONSTRAINT fk_Sales_Date FOREIGN KEY (DateId) REFERENCES star.Date(DateId)
);

-- Dimension: Product
CREATE TABLE star.Product (
    ProductId INT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE,
    Category VARCHAR(50)
);

-- Dimension: Customer
CREATE TABLE star.Customer (
    CustomerId INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

-- Dimension: Date
CREATE TABLE star.Date (
    DateId INT PRIMARY KEY,
    Year INT,
    Month INT,
    Day INT
);


-- Insert Products
INSERT INTO star.Product (ProductId, Name, Category) VALUES
(1, 'iPhone 15', 'Mobile'),
(2, 'Samsung TV', 'Electronics'),
(3, 'Nike Shoes', 'Fashion');

-- Insert Customers
INSERT INTO star.Customer (CustomerId, Name, City) VALUES
(1, 'Kunal', 'Bangalore'),
(2, 'Priya', 'Delhi'),
(3, 'Ravi', 'Hyderabad');

-- Insert Dates
INSERT INTO star.Date (DateId, Year, Month, Day) VALUES
(1, 2025, 10, 1),
(2, 2025, 10, 2),
(3, 2025, 10, 3);

-- Insert Sales (Fact Table)
INSERT INTO star.Sales (OrderId, ProductId, CustomerId, DateId, Amount) VALUES
(1001, 1, 1, 1, 75000.00),  -- Kunal buys iPhone 15
(1002, 2, 2, 2, 120000.00), -- Priya buys Samsung TV
(1003, 3, 3, 3, 6000.00),   -- Ravi buys Nike Shoes
(1004, 1, 2, 1, 76000.00);  -- Priya buys another iPhone 15


select c.Name,p.Name,p.Category,d.Day,d.Month,d.Year from star.Sales as s
left join star.Customer as c
on s.CustomerId=c.CustomerId
left join star.Product as p
on s.ProductId=p.ProductId
left join star.Date as d
on s.DateId=d.DateId
where s.CustomerId=1