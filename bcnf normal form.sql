create schema bcnf
go

-- Region table
create table bcnf.Player_Region(
    Region_id int primary key identity(1,1),
    Region_name varchar(50) not null
);

-- State table
create table bcnf.Player_State(
    State_id int primary key identity(1,1),
    State_name varchar(50) not null
);

-- Linking Region ? State
create table bcnf.Region_State(
    Region_id int not null,
    State_id int not null,
    constraint fk_region foreign key (Region_id) references bcnf.Player_Region(Region_id),
    constraint fk_state foreign key (State_id) references bcnf.Player_State(State_id),
    primary key (State_id, Region_id)
);

-- City table
create table bcnf.Player_City(
    City_id int primary key identity(1,1),
    City_name varchar(50) not null
);

-- Linking State ? City
create table bcnf.State_City(
    State_id int not null,
    City_id int not null,
    constraint fk_state2 foreign key (State_id) references bcnf.Player_State(State_id),
    constraint fk_city foreign key (City_id) references bcnf.Player_City(City_id),
    primary key (State_id, City_id)
);

-- District table
create table bcnf.Player_District(
    District_id int primary key identity(1,1),
    District_name varchar(50) not null
);

-- Linking City ? District
create table bcnf.City_District(
    City_id int not null,
    District_id int not null,
    constraint fk_city2 foreign key (City_id) references bcnf.Player_City(City_id),
    constraint fk_district foreign key (District_id) references bcnf.Player_District(District_id),
    primary key (District_id, City_id)
);


INSERT INTO bcnf.Player_Region (Region_name) VALUES
('North'),
('South'),
('East'),
('West');

INSERT INTO bcnf.Player_State (State_name) VALUES
('Uttar Pradesh'),
('Maharashtra'),
('Tamil Nadu'),
('West Bengal'),
('Karnataka');


INSERT INTO bcnf.Region_State (Region_id, State_id) VALUES
(1, 1),  -- North ? Uttar Pradesh
(1, 4),  -- North ? West Bengal
(2, 3),  -- South ? Tamil Nadu
(2, 5),  -- South ? Karnataka
(3, 4),  -- East ? West Bengal
(4, 2);  -- West ? Maharashtra


INSERT INTO bcnf.Player_City (City_name) VALUES
('Lucknow'),
('Varanasi'),
('Mumbai'),
('Chennai'),
('Bengaluru'),
('Kolkata'),
('Pune');


INSERT INTO bcnf.State_City (State_id, City_id) VALUES
(1, 1), -- UP ? Lucknow
(1, 2), -- UP ? Varanasi
(2, 3), -- Maharashtra ? Mumbai
(2, 7), -- Maharashtra ? Pune
(3, 4), -- Tamil Nadu ? Chennai
(5, 5), -- Karnataka ? Bengaluru
(4, 6); -- West Bengal ? Kolkata


INSERT INTO bcnf.Player_District (District_name) VALUES
('Lucknow District'),
('Varanasi District'),
('Mumbai Suburban'),
('Chennai District'),
('Bengaluru Urban'),
('Kolkata District'),
('Pune District');


INSERT INTO bcnf.City_District (City_id, District_id) VALUES
(1, 1), -- Lucknow ? Lucknow District
(2, 2), -- Varanasi ? Varanasi District
(3, 3), -- Mumbai ? Mumbai Suburban
(4, 4), -- Chennai ? Chennai District
(5, 5), -- Bengaluru ? Bengaluru Urban
(6, 6), -- Kolkata ? Kolkata District
(7, 7); -- Pune ? Pune District

SELECT 
    r.Region_name,
    s.State_name,
    c.City_name,
    d.District_name
FROM bcnf.Player_Region r
JOIN bcnf.Region_State rs ON r.Region_id = rs.Region_id
JOIN bcnf.Player_State s ON rs.State_id = s.State_id
JOIN bcnf.State_City sc ON s.State_id = sc.State_id
JOIN bcnf.Player_City c ON sc.City_id = c.City_id
JOIN bcnf.City_District cd ON c.City_id = cd.City_id
JOIN bcnf.Player_District d ON cd.District_id = d.District_id;
