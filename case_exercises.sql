#1 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select
-- what we are looking for	
concat(first_name,' ',last_name) as name,

dept_no, 

from_date, 

to_date,
-- to find current employees, identified as 1 or 0
	if(to_date = '9999-01-01',true, false) as currently_employee
	 
		from dept_emp
-- join tables to fill missing components 
		join employees

		on dept_emp.emp_no = employees.emp_no 
order by name limit 50;

#2 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
 
Select concat(first_name,' ',last_name) as full_name ,

case 
-- testing for a - h using like
when last_name  like 'a%' or last_name like 'b%' or last_name like 'c%' or last_name like 'd%' or last_name like 'e%' or last_name like 'f%' or last_name like 'g%' or last_name like 'h%'
 then 'A-h'
 -- testing for i-q using like
when last_name like 'i%' or last_name like 'j%' or last_name like 'k%' or last_name like 'l%' or last_name like 'm%' or last_name like 'n%' or last_name like 'o%' or last_name like 'p%' or last_name like 'q%'
 then 'I-Q'
 -- testing for r-z using like
when last_name like 'r%' or last_name like 's%' or last_name like 't%' or last_name like 'u%' or last_name like 'v%' or last_name like 'w%' or last_name like 'x%' or last_name like 'y%' or last_name like 'z%'
then 'R-Z'

else 'NULL'

end as alpha_group
 
from employees

limit 100;

 
 
#3 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
drop temporary table if exists noether_2033.no_repeats;

create temporary table noether_2033.no_repeats as (

Select distinct emp_no, birth_date, first_name, last_name, gender,hire_date 
from employees);


-- i checked max and min birth_dates so that i can manage the least amount of cases

select max(birth_date), min(birth_date) from employees limit 5;

select



-- looking for birth_date in the 1960s
count(case when employees.birth_date like '%196%' then employees.birth_date
else null
end)as 'the 60s',

-- looking for birht_date in the 1950s
count(case when employees.birth_date like '%195%' then employees.birth_date
else null
end ) as 'the 50s'


from employees
join noether_2033.no_repeats
on employees.emp_no = noether_2033.no_repeats.emp_no

 
 ;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select * from dept_emp limit 5;
select * from departments limit 5;
select * from salaries  limit 5;
select * from employees limit 5;


SELECT *,

-- grouping dept_name into their respect compartments
-- added to.date > curdate () comparison to find current salary
   CASE
       WHEN dept_name IN ('research', 'development') and 
       salaries.to_date > curdate()
	 		  THEN salary
       else null end as 'R&D',
   CASE 
       WHEN dept_name IN ('sales', 'marketing') and 	
       salaries.to_date > curdate()
 	   		THEN salary
       else null end as 'Sales & Marketing',
   CASE
       WHEN dept_name IN ('Production', 'Quality Management') and 		salaries.to_date > curdate()
				THEN salary
       else null end as 'Prod & QM',
   CASE
   		WHEN dept_name IN ('Finance', 'Human R') and 		salaries.to_date > curdate()

   			  THEN salary
       else null end as 'Finance & HR',
    CASE
    	WHEN dept_name = 'Customer Service' and salaries.to_date > 		curdate()
    		  then salary
    	else null end as 'Customer Service' 

FROM departments
join dept_emp
on departments.dept_no = dept_emp.dept_no

join salaries
on dept_emp.emp_no = salaries.emp_no
limit 10
;



SELECT 

-- cleaning up case statements and using the avg function to get the amount per depth

  AVG(CASE
       WHEN dept_name IN ('research', 'development') 
       and salaries.to_date > curdate()
	 		  THEN salary
       end) as 'R&D',
       
   AVG(CASE 
       WHEN dept_name IN ('sales', 'marketing') 
       and salaries.to_date > curdate()
 	   		THEN salary
       end) as 'Sales & Marketing',
       
   AVG(CASE
       WHEN dept_name IN ('Production', 'Quality Management') 
       and salaries.to_date > curdate()
			THEN salary
       end) as 'Prod & QM',
        
   AVG(CASE
   		WHEN dept_name IN ('Finance', 'Human R') 
		and salaries.to_date > curdate()
			THEN salary
       end) as 'Finance & HR',
       
    AVG(CASE
    	WHEN dept_name = 'Customer Service' 
		and salaries.to_date > curdate()
    		  then salary
    	end) as 'Customer Service' 


FROM departments
join dept_emp
on departments.dept_no = dept_emp.dept_no

join salaries
on dept_emp.emp_no = salaries.emp_no
group by 'R&D', 'Sales & Marketing', 'Prod & QM', 'Finance & HR', 'Customer Service'

limit 10
;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --