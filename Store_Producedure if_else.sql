select * from Sales.Customers

CREATE PROCEDURE Dim_table_details
    @score INT
AS
BEGIN
    IF (@score > 0 AND @score <= 200)
    BEGIN
        PRINT 'Low Score Category';
        SELECT 
            c.CustomerID,
            CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
            c.Country,
            COALESCE(c.Score, 0) AS [Score]
        FROM Sales.Customers AS c
        WHERE c.Score BETWEEN 0 AND 200;
    END
    ELSE IF (@score > 200 AND @score <= 500)
    BEGIN
        PRINT 'Medium Score Category';
        SELECT 
            c.CustomerID,
            CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
            c.Country,
            COALESCE(c.Score, 0) AS [Score]
        FROM Sales.Customers AS c
        WHERE c.Score BETWEEN 201 AND 500;
    END
    ELSE
    BEGIN
        PRINT 'High Score Category';
        SELECT 
            c.CustomerID,
            CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
            c.Country,
            COALESCE(c.Score, 0) AS [Score]
        FROM Sales.Customers AS c
        WHERE c.Score > 500;
    END
END;

EXEC Dim_table_details @score = 750;

SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
    c.Country,
    COALESCE(c.Score, 0) AS [Score]
FROM Sales.Customers AS c;


SELECT 
    c.*, 
    CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
    CASE 
        WHEN c.Score IS NULL THEN COALESCE(c.Score, 0)
        WHEN c.LastName IS NULL THEN COALESCE(c.LastName, '')
        ELSE c.Score
    END AS [Score]
FROM Sales.Customers AS c;


CREATE PROCEDURE Dim_table_details_2
AS
BEGIN
    SELECT 
        c.CustomerID,
        CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
        c.Country,
        COALESCE(c.Score, 0) AS [Score],
        CASE 
            WHEN c.Score > 0 AND c.Score <= 200 THEN 'Low'
            WHEN c.Score > 200 AND c.Score <= 500 THEN 'Medium'
            ELSE 'High'
        END AS [ScoreCategory]
    FROM Sales.Customers AS c;
END;

EXEC Dim_table_details_2;


