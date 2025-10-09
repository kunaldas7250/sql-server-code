-- USE MyDatabase

--day 2

/*
heo
-- select first_name,country,score as total_population from customers where score>350
-- select * from customers where score >0
-- select * from customers where score =0
-- select * from customers where score <> 0
--select * from customers where score !=0

--retrive from germany from customers
select * from customers where country='Germany' order by score desc

-- order by desc
select * from customers order by  score desc


-- order by asc
select * from customers order by  score asc 

--nested query order by
select * from customers order by country asc,score desc

select * from customers order by score desc,country asc 


-- find the total score by each country
select * from customers

select country,sum(score) as total_score from customers group by country

-- find the total score total number of customer for each country
select sum(score) as total_score, count(id) as total_number,country from customers group by country */

/*find the average score of each country considering only customer 
with score not equal to 0 and
return only thoso country  with average score greter than 430

select country,AVG(score) as avg_score
from customers
where score !=0
group by country
having  avg(score)>430


-- return unique value of all customen in country
select distinct 
country from customers

-- retrieve only 3 customer
select top 3 * from customers

-- retrive top 3 customer with highest score
select top 3 score from customers order by score desc

--retrive lowest 2 customer based on score
select top 2 score from customers order by score asc */

-- get the two most recent order
select * from orders

select  top 2 * from orders order by  order_date asc

--insert value to exsiting table
select * from customers

insert into customers (id,first_name,country,score)
values(6,'kunal','india',null),(7,'riku','bengaluru',450)

create table person(
ID INT NOT NULL,
PERSON_NAME VARCHAR(50) NOT NULL,
BIRTH_DATE DATE,
PHONE VARCHAR(15) NOT NULL,
CONSTRAINT KUNAL PRIMARY KEY (ID)
)
insert into person(ID,PERSON_NAME,BIRTH_DATE,PHONE)
select id,first_name,null,'unknown' from customers
SELECT * FROM person

-- change the  score of customer with id 6 to 0
select * from customers 
update  customers set score=0 where id=6

-- change the score of customer with id 6 to 100 and coutry with dhanbad
update  customers set score=100 , country='dhanbad' where id=6

--change the customer who have score 0 with 600 or null
update  customers set score=null where id=5

update  customers set score=null where id=2

update customers set score=200 where score is null

--delete custumor where id greter than 5
delete from customers where id>5

-- delete all data from person table
 truncate table person