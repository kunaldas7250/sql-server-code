--day 3
select * from customers 

--retrive all the customers from germany
select * from customers where country='Germany'

--retrive all customers are not equal to germany
select * from customers where country!='Germany'
select * from customers where country<>'Germany'

-- retrive all customer score greater than 500
select * from customers where score >500

-- retrive all customer score greater than 350 or more
select * from customers where score >=350

-- retrive all customer leass than 500
select * from customers where score <500

--retrive all customer leass than or equal to 400
select * from customers where score <=400

--retrive all customer are from uk and grter than 500
select * from customers where country='UK' and score>500

--retrive all customer are from uk or grter than 300
select * from customers where country='UK' or score>300

--retrive all customer not less than 500
select * from customers where  not score<500

--retrive all customer whose score falls in the range between between 200 to 500
select * from customers where score between 200 and 500

--retrive all customer either they come from use or germany
select * from customers where country='USA' or country='Germany'

select * from customers where country in ('USA','Germany')

--retrive all customer either they not come in from use or germany
select * from customers where country not in ('USA','Germany')

--retrive all customers whose first letter should m
select * from customers where first_name like 'M%'

--find all customers first name ends with 'n'
select * from customers where  first_name like '%n'

--find all the customers  who fisrt name contains with 'p'
select * from customers where first_name like 'p%'
--find all customers middle name contains with r
select * from customers where first_name like '%r%'


--find all customers whos first name contains r with the 3 index
select * from customers where first_name like '__r%'