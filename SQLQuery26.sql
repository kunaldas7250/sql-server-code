select * from dbo.Books
select * from dbo.BookGame

drop sys.table dbo.BookGame

IF OBJECT_ID('dbo.BookGame', 'U') IS NOT NULL
    DROP TABLE dbo.BookGame;
