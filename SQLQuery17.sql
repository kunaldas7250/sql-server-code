--show a list of customers first names together with their country in one column
--string funcation
select first_name,country,
concat(first_name,'   ',country)as name_country
from customers

select first_name,country,
concat(first_name,' _  ',country)as name_country
from customers

--convert first name to lower case
select first_name,lower(first_name)as lowercase_string from customers

--convert first name to uppercase
select first_name,UPPER(first_name) as uppercase_string from customers

--find customers whose firstname contains leading or tailling space
select first_name ,
len(first_name)as search_space ,
len(trim(first_name)) as len_trim,
len(first_name)-len(trim(first_name)) flag
from customers 
where len(first_name)!=len(trim(first_name))
--where first_name !=trim(first_name)


--remove dashes from a phoen_number
select 
'789-4789-415' as phone_number, replace('789-4789-415','-',' ')as repace_value

select 
'789-4789-415' as phone_number, replace('789-4789-415','-','/')as repace_value

--replace filename .txt to .csv
select
'hello.txt' as original_file ,replace('hello.txt','.txt','.csv') as replace_file

--CALCULATED THE LENGTH OF EACH CUSTOMER FISRT NAME
SELECT first_name,len(first_name) as total_count_first_name from customers

-- calculated the length of a number
select '350' as number,len('350') as total_count_number

--calculated the length of phone number
select '895-456-425' as phone_number,len('895-456-425')as total_length_phone_number

--retrive first name  first 2 character each firstname
select first_name ,
left(trim(first_name),2)as extact_2_character
from customers

select first_name ,
left(first_name,2)as extact_2_character
from customers

--retrive first name last 2 character each firstname
select first_name,right(first_name,2) as extact_2_right_side from customers

--retrive a list of customers first names removing the first charcter
select first_name,substring(trim(first_name),2,len(first_name)) as middle_part_string from customers