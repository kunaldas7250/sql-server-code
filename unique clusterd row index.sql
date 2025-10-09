select * into test
from dbo.Books

CREATE unique CLUSTERED  INDEX idx_test_colstore 
ON dbo.Test(id)
select * from dbo.test
insert into dbo.test(id,Author,Price,Rating,Verified,GameId) values(1,'kunal',500,5,1,2)
drop index idx_test_colstore on dbo.test 



SET IDENTITY_INSERT dbo.test ON;

INSERT INTO dbo.test (id, Author, Price, Rating, Verified, GameId,CreatedAt)
VALUES (1, 'kunal', 500, 5, 1, 2,GETDATE())

SET IDENTITY_INSERT dbo.test OFF;
