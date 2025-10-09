-- Master table for players
create table tnf.Game_Player(
    id int identity(1,1) primary key,
    Player_id int not null,
    name varchar(50) unique,
    Device_id int,
    Player_Rank int,
    constraint fk_Device foreign key (Device_id) references tnf.Player_Device(Device_id),
    constraint fk_Rank foreign key (Player_Rank) references tnf.Rank_Player(Player_Rank)
);

-- Device dimension (each device defined once)
create table tnf.Player_Device(
    Device_id int primary key,
    Device_name varchar(50) not null
);

-- Rank dimension (each rank defined once)
create table tnf.Rank_Player(
    Player_Rank int primary key,
    Player_position varchar(50) not null
);


insert into tnf.Player_Device (Device_id, Device_name) values
(1, 'PC'),
(2, 'Xbox'),
(3, 'PlayStation'),
(4, 'Nintendo Switch'),
(5, 'Mobile');


insert into tnf.Rank_Player (Player_Rank, Player_position) values
(1, 'Beginner'),
(2, 'Intermediate'),
(3, 'Advanced'),
(4, 'Pro'),
(5, 'Legend');



insert into tnf.Game_Player (Player_id, name, Device_id, Player_Rank) values
(101, 'Alice', 1, 3),
(102, 'Bob', 2, 2),
(303, 'Charlie', 3, 5),
(404, 'David', 4, 1),
(424, 'Eve', 5, 4),
(201, 'Frank', 1, 2),
(251, 'Grace', 2, 3),
(850, 'Hannah', 3, 1),
(750, 'Ian', 4, 5),
(620, 'Jack', 5, 4);


update tnf.Game_Player
set region_id = case id
    when 1 then 1
    when 2 then 2
    when 3 then 3
    when 4 then 1
    when 5 then 2
    when 6 then 3
    when 7 then 1
    when 8 then 2
    when 9 then 3
    when 10 then 1
end
where id between 1 and 10;


alter table tnf.Game_Player
add region_id int null;


select * from tnf.Game_Player