select * from dbo.Users

ALTER TABLE dbo.Users
ADD PasswordHash VARCHAR(100)  NULL ;

CREATE TABLE dbo.UserLogin (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    User_Id INT NOT NULL,
    UserName VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CONSTRAINT fk_UserLogin_Users FOREIGN KEY (User_Id) REFERENCES dbo.Users(Id)
);

INSERT INTO dbo.UserLogin (User_Id, UserName, PasswordHash)
VALUES
(1, 'kunal',   '5f4dcc3b5aa765d61d8327deb882cf99'), -- "password" MD5 (demo only)
(2, 'rahul',   'e99a18c428cb38d5f260853678922e03'), -- "abc123"
(3, 'priya',   '25d55ad283aa400af464c76d713c07ad'), -- "12345678"
(4, 'amit',    'd8578edf8458ce06fbc5bb76a58c5ca4'), -- "qwerty"
(5, 'sneha',   '5ebe2294ecd0e0f08eab7690d2a6ee69'), -- "secret"
(6, 'arjun',   '202cb962ac59075b964b07152d234b70'), -- "123"
(7, 'meera',   '098f6bcd4621d373cade4e832627b4f6'); -- "test"

select * from dbo.UserLogin

select * from dbo.Users as u
left join dbo.UserLogin as l
on u.ID=l.User_Id