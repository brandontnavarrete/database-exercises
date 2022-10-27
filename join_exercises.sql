SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;
# inner join

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
#left join

select * from roles;
select * from users;

Select roles.name , count(users.name)

from roles

join users
on roles.id = users.role_id
group by roles.name;

# right join
/*
admin		1
author		1
reviewer	2
*/



Select roles.name as position, count(roles.name) AS occupancy
from users
 join roles
on users.role_id = roles.id
group by roles.name;


#2 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- # complete
USE employees;

-- taking dept name, concat the names
select dept_name as " Department Name ", 
CONCAT( first_name, ' ',last_name) as 'Department Manager'

--
from departments #table 1

join dept_manager as manager #tab 2

on departments.dept_no = manager.dept_no

join employees -- tab 3

on manager.emp_no /*tap 2 */ = employees.emp_no -- tab 3

where manager.to_date like "%9999%"

limit 10;

/*
Customer Service	Yuchang Weedman
Development			Leon DasSarma
Finance	Isamu 		Legleitner
Human Resources		Karsten Sigstam
Marketing			Vishwani Minakawa
Production			Oscar Ghazalie
Quality Management	Dung Pesch
Research			Hilary Kambil
Sales				Hauke Zhang
*/

#3 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- # complete

select dept_name as " Department Name ", CONCAT( first_name,

 ' ',last_name) as 'Department Manager'
 
from departments #table 1

join dept_manager as manager #tab 2

on departments.dept_no = manager.dept_no

join employees -- tab 3

on manager.emp_no /*tap 2 */ = employees.emp_no -- tab 3

where manager.to_date like "%9999%"

	and employees.gender Like '%F%';
	
/*
Finance			Isamu 	Legleitner
Human Resources	Karsten Sigstam
Development		Leon DasSarma
Research		Hilary Kambil
*/

#4 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --#complete
 
select * from departments limit 5; #dept_no and name
select * from dept_emp limit 5; ;# emp-no,dept_no
select * from employees limit 5;#emp_no,birth,name,gender,hire
select * from salaries limit 5;#empno, salary
select * from titles limit 5;#emp_no,title,from-to

select title, count(dept_emp.emp_no)
from titles #table 1

join dept_emp  #tab 2

on  titles.emp_no /*tab 1*/ =  dept_emp.emp_no/*tab2*/ 

join departments -- tab 3

on  dept_emp.dept_no/*tap 2 */ = departments.dept_no
where departments.dept_name = 'Customer Service'
and dept_emp.to_date like '%9999%'
and titles.to_date like '%9999%'
group by title
order by title;

/*
Assistant Engineer	68
Engineer			627
Manager				1
Senior Engineer		1790
Senior Staff		11268
Staff				3574
Technique Leader	241
*/
 








#5  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- #complete 


 
select places.dept_name as 'Department Name',
 CONCAT(first_name," ",last_name) AS 'Name',
salary as Salary

from salaries #table 1

join employees as people #tab 2

on salaries.emp_no  /*tab 1*/ = people.emp_no /*tab2*/ 

join dept_manager As managers -- tab 3

on people.emp_no /*tap 2 */ = managers.emp_no -- tab3

join departments as places

on  managers.dept_no = places.dept_no 

where salaries.to_date like '%9999%'

and managers.to_date like '%9999%'
order by dept_name;

limit 10;

/*
Customer Service	Yuchang Weedman		58745
Development			Leon DasSarma		74510
Finance				Isamu Legleitner		83457
Human Resources		Karsten Sigstam		65400
Marketing			Vishwani Minakawa	106491
Production			Oscar Ghazalie		56654
Quality Management	Dung Pesch			72876
Research			Hilary Kambil		79393
Sales				Hauke Zhang			101987
*/
#6.-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- #complete 

select distinct departments.dept_no, dept_name, count(emp_no) as 'num_employees'

from departments  #table 1

join dept_emp #tab 2

on  departments.dept_no /*tab 1*/ = dept_emp.dept_no/*tab2*/ 

where to_date like '%9999%'

group by departments.dept_no 

order by departments.dept_no


limit 9;

/*
d001	Marketing			14842
d002	Finance				12437
d003	Human Resources		12898
d004	Production			53304
d005	Development			61386
d006	Quality Management	14546
d007	Sales				37701
d008	Research			15441
d009	Customer Service	17569
*/

#7 -- -- -- -- -- -- -- -- -- -- -- -- -- # correct
select dept_name, avg(salary)  as 'average_salary'

from salaries #table 1

join dept_emp #tab 2

on salaries.emp_no /*tab 1*/ = dept_emp.emp_no/*tab2*/ 

join departments

on dept_emp.dept_no = departments.dept_no

where salaries.to_date like '%9999%'

and dept_emp.to_date like '%9999%'


group by dept_name

order by avg(salary) desc limit 1 ;


#Sales	88852.9695


#8 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --# complete


select first_name, last_name

from departments #table 1

join dept_emp #tab 2

on departments.dept_no /*tab 1*/ = dept_emp.dept_no /*tab2*/ 

join employees   -- tab 3

on dept_emp.emp_no /*tap 2 */ = employees.emp_no  -- tab3

join salaries -- tab 4

on employees.emp_no /*tap 3 */ =  salaries.emp_no -- tab4

where salaries.to_date like '%9999%'

	and departments.dept_name like '%Marketing%'
	
order by salaries.salary desc
limit 1;

#Akemi	Warwick
#9 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --# complete

select first_name, last_name, salaries.salary, dept_name

from departments #table 1

join dept_manager #tab 2

on departments.dept_no /*tab 1*/ = dept_manager.dept_no/*tab2*/ 

join employees   -- tab 3

on dept_manager.emp_no /*tap 2 */ = employees.emp_no  -- ta3

join salaries -- tab 4

on employees.emp_no /*tap 3 */ =  salaries.emp_no -- tab4

where salaries.to_date like '%9999%'

and dept_manager.to_date  like '%9999%'

order by salary desc

limit 1
;
#Vishwani	Minakawa	106491	Marketing

#10 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --# complete


select  distinct dept_name, round(avg(salary),0) AS'average_salary'

from departments #table 1

join dept_emp #tab 2

on  departments.dept_no /*tab 1*/ = dept_emp.dept_no /*tab2*/ 

join salaries -- tab 3

on  dept_emp.emp_no/*tap 2 */ = salaries.emp_no -- tab3

group by dept_name

order by round(avg(salary),0) desc;
 

/*
Sales				80668
Marketing			71913
Finance				70489
Research			59665
Production			59605
Development			59479
Customer Service	58770
Quality Management	57251
Human Resources		55575
*/



