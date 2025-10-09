create schema threenf
go

-- District table
create table threenf.Player_District(
    District int primary key,
    Player_District varchar(50) not null
);

-- City table
create table threenf.Player_City(
    city int primary key,
    city_name varchar(50) unique,
    District int not null,
    constraint fk_district foreign key (District) references threenf.Player_District(District)
);

-- State table
create table threenf.Player_State(
    state int primary key,
    Player_state varchar(50) unique,
    city int not null,
    constraint fk_city foreign key (city) references threenf.Player_City(city)
);

-- Region table
create table threenf.Player_Region(
    region_id int primary key,
    region_name varchar(50),
    state int not null,
    constraint fk_state foreign key (state) references threenf.Player_State(state)
);


insert into threenf.Player_District (District, Player_District) values
(1, 'North District'),
(2, 'South District'),
(3, 'East District'),
(4, 'West District');

insert into threenf.Player_City (city, city_name, District) values
(101, 'Alpha City', 1),
(102, 'Beta City', 1),
(103, 'Gamma City', 2),
(104, 'Delta City', 2),
(105, 'Epsilon City', 3),
(106, 'Zeta City', 3),
(107, 'Eta City', 4),
(108, 'Theta City', 4);


insert into threenf.Player_State (state, Player_state, city) values
(1001, 'State A', 101),
(1002, 'State B', 102),
(1003, 'State C', 103),
(1004, 'State D', 104),
(1005, 'State E', 105),
(1006, 'State F', 106),
(1007, 'State G', 107),
(1008, 'State H', 108);


insert into threenf.Player_Region (region_id, region_name, state) values
(1, 'Region North', 1001),
(2, 'Region North', 1002),
(3, 'Region South', 1003),
(4, 'Region South', 1004),
(5, 'Region East', 1005),
(6, 'Region East', 1006),
(7, 'Region West', 1007),
(8, 'Region West', 1008);
