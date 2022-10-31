use employees;
#-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --#	
select first_name, to_date, hire_date

from   employees 

join dept_emp on employees.emp_no = dept_emp.emp_no

where to_date > curdate()

and hire_date =
					(select hire_date
					from employees 
						 where emp_no = 101010 );
#2-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --#	


/*
select title, first_name, dept_emp.to_date as 'current employee' -- current employee
from (select * from employees where first_name like '%Aamod%') as fn
join titles as T
on fn.emp_no = T.emp_no
join dept_emp
on T.emp_no = dept_emp.emp_no
and dept_emp.to_date > curdate();
*/

select title, count(title)

from titles AS T

join employees

on T.emp_no = employees.emp_no

join dept_emp

on employees.emp_no = dept_emp.emp_no

where dept_emp.to_date > curdate()

and first_name IN
				(select first_name
					from employees
					where first_name like '%Aamod%')
					Group by title;
# classmate example -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --#	
/*
select employees.first_name, titles.title
from employees
join titles on employees.emp_no = titles.emp_no
where first_name = 'Aamod'
group by titles.title;
*/

/*

select title, first_name
from (
select first_name, employees.emp_no
from employees
join dept_emp as de on de.emp_no = employees.emp_no
where first_name = "Aamod"
and de.to_date > curdate())
as e
join titles as t on t.emp_no = e.emp_no;

*/
#3-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# 91479 PEOPLE FROM THE EMPLOYEES TABLE NO LONGER WORK FOR THE COMPANY
Select first_name, to_date
from employees
join dept_emp
on dept_emp.emp_no = employees.emp_no 
where to_date In
				(select to_date
				from dept_emp
				where to_date not like '%9999%') 
				order by to_date
				;
				
				
# classmate example -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --#	

select * 
from employees
where em_no in ( 
				select emp_no
				from dept_emp
					where to_date < curdate()
					);
					
#4 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
select * from employees limit 1;
select * from titles limit 1;
select * from departments limit 1;
select * from dept_emp limit 1;
select * from dept_manager limit 1;
select * from salaries limit 1;

#Isamu		Legleitner	F
#Karsten	Sigstam		F
#Leon		DasSarma	F
#Hilary		Kambil		F

select concat(first_name,' ',last_name) as full_name

from employees

join dept_manager

on employees.emp_no = dept_manager.emp_no

where gender = 'F'

and dept_manager.emp_no in

-- find all the current managers
 	(select emp_no
 	
		from dept_manager
		
			where to_date > curdate());




#5 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- companies OVRALL AVG salary
select concat(first_name,' ', last_name) as full_name

from employees

join salaries 

on employees.emp_no = salaries.emp_no

where to_date > curdate()

and salary > 

(select avg(salary)
from salaries); 

#6 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- \


select count(*) as num_emps, (count(*)/ 
										-- finding current salaries
										(
												 select count(to_date)
										
										 from salaries
											
										 where to_date >curdate())*100) as pecent_of_emps

from salaries

where salary >= (select(max(salary)-std(salary)) 

from salaries)

and salaries.to_date > curdate();



/*
-- 158220 the current highest salary (1 row)
(select max(salary)
from salaries
where to_date > curdate()) -

-- std salary

(Select round(std(salary))
from salaries );



-- 72012 the current avg salary (1 row)
select round(AVG(salary))
from salaries 
where to_date > curdate();


*/
select(max(salary)-std(salary)) 

from salaries;




