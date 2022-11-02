-- Extra MySQL Exercises

use sakila;

-- 1

-- a

Select *

	From actor;

-- b

select last_name

	From actor;
	
-- c

select 

film_id,

title,
		
release_year

	from film;

-- 2

-- a
select distinct last_name

	from actor;

-- b

select distinct postal_code

	from address;
	
-- c 

-- I want to see what is in the film table

select * 

	from film;
	
select distinct `rating`

	from film;
	
-- 3

-- a

select

title,

description,

rating,

length

	from film

-- 180 = 3 hours
		where length >= 180;
		
-- b

select *

	from payment;
	
select

payment_id,

amount,

payment_date

	from payment

-- I used like because only the date matters, not the approx time.
		where payment_date like '%2005-05-27%';

-- c

-- verifying the primary key
describe payment;

select 

payment_id,

amount,

payment_date

	from payment

		where payment_date like '%2005-05-27%';

-- d

select 

first_name,

last_name

	from customer

-- like to be able to use the wild cards
		where last_name like 's%'
		
			and first_name like 'n%';
# NINA	SOTO

-- e

describe customer;

select *

	from customer
	
		where active = 0;
		
-- f 

select * 

	from category

		where category_id > 4
			
			and name like 'c%'
			
				or name like 's%'
				
					or name like 't%';
					
/*
5	Comedy	2006-02-15 04:46:27
14	Sci-Fi	2006-02-15 04:46:27
15	Sports	2006-02-15 04:46:27
16	Travel	2006-02-15 04:46:27
*/	
	
-- g 

select 

staff_id,

first_name,

last_name,

address_id,

picture,

email,

store_id,

active,

username,

last_update
	
	from staff
		
		-- where column contains any value
		where password like '%';

-- h select 

select 

staff_id,

first_name,

last_name,

address_id,

picture,

email,

store_id,

active,

username,

last_update
	
	from staff
		
		-- where column contains NULL
	
		where password is null;
		
-- 4
-- a

select * 

	from address;

select

phone,

district

	from address
		
		where district in ('California','England','Taipei','West Java');

-- b

select 

payment_id,

amount,

payment_date
	
	from payment
		
		where date(payment_date) in 
		
		('2005-05-25' ,'2005-05-27','2005-05-29');
		
		
-- c

select *

from film

where rating in ('G','PG-13','NC-17');

-- 5
-- a

select * 

from payment 

where payment_date between '2005-05-25 00:00:00' and '2005-05-25 23:59:59';

-- b 
select film_id, title, description

from film 

where length(description) between 100 and 120;

-- 6
-- a
select description

from film

where description like "%A Thoughtful%"


-- b

select description

from film

where description like "%A Thoughtful%";

-- c 



select description, length

from film

where description like "%Database%"

and length > 180;

-- 7

select * 













		