select * from dbo.Students

alter PROCEDURE SearchDetails 
    @Student VARCHAR(50),@Grater int,@smaller
AS
BEGIN
    SELECT 
        s.*, 
        CONCAT(s.firstname, ' ', s.lastname) AS [Full Name]
    FROM dbo.Students AS s
    WHERE s.firstname LIKE @Student + '%';

    select g.title,g.platform,t.Author,t.Price,t.Rating from dbo.Game as g
    join dbo.test as t
    on g.id=t.id
    where t.Price>@smaller and t.Price<@Grater
END;


ALTER PROCEDURE SearchDetails 
    @Student VARCHAR(50),
    @Greater INT,
    @Smaller INT
AS
BEGIN
    -- Search students
    SELECT 
        s.*, 
        CONCAT(s.firstname, ' ', s.lastname) AS [Full Name]
    FROM dbo.Students AS s
    WHERE s.firstname LIKE @Student + '%';

    -- Search games within price range
    SELECT 
        g.title,
        g.platform,
        t.Author,
        t.Price,
        t.Rating
    FROM dbo.Game AS g
    INNER JOIN dbo.test AS t
        ON g.id = t.id
    WHERE t.Price > @Smaller AND t.Price < @Greater;
END;



EXEC SearchDetails 
    @Student = 'Kunal', 
   @Greater = 300, 
   @Smaller = 150;


