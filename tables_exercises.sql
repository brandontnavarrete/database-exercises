#1 -----------------------------------------------------------

drop temporary table if existsnoether_2033.employees_with_departments;

create temporary table noether_2033. employees_with_departments As

(select first_name, last_name, dept_name
from employees
join dept_emp using (emp_no)
join departments using (dept_no)
where to_date > curdate())
;

select * 
from noether_2033.employees_with_departments;

#a---------
alter table noether_2033.employees_with_departments add full_name varchar(31) ;



#b---------
update noether_2033.employees_with_departments
set full_name = lower(concat(first_name,' ',last_name));

#c---------

alter table noether_2033.employees_with_departments 
drop column first_name, 
drop column last_name;

#d---------
# i could have concatenated the first_name, last_name from the beginning and saved that table.

#2 -----------------------------------------------------------

/* 
Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
*/

create temporary table noether_2033.payment as (Select * from payment);


-- modify col. to remove the decimal
alter table noether_2033.payment
modify column amount float;


describe noether_2033.payment;

-- now that type was no longer decimal i can multiply it by 100
update noether_2033.payment
set amount = amount * 100;


select * 
from noether_2033.payment;

/*
select cast(amount *100 as unsigned) as cents
from read_only_user.payments;
*/




#3 ----------------------------------------------------------- 
/*
complete but 2nd attempt below last comment line
*/
drop table if exists noether_2033.salary_info;

create temporary table noether_2033.salary_info as
(
select 
dept_no,
emp_no,
salary,
salaries.to_date,

first_name,
last_name,
dept_name

from salaries 
join dept_emp using (emp_no)
join employees using (emp_no)
join departments using (dept_no)
);

select *
from noether_2033.salary_info;
#-------------------------

#Find out how the current average pay in each department
drop table if exists noether_2033.as;

create temporary table noether_2033.as (


select emp_no,to_date,dept_name,avg(salary) as 'avg_salary'

from noether_2033.salary_info

where to_date > curdate()

group by emp_no,to_date, dept_name);




#------------------------------------- z_score 
drop table if exists noether_2033.zs;

create temporary table noether_2033.zs(

SELECT

emp_no,
 salary,
  salaries.to_date,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
    
FROM salaries

join dept_emp using (emp_no));




#--------------
select emp_no, dept_name, avg_salary, salary,zc.to_date, zscore

from noether_2033.as AS avs

join noether_2033.zs as zc

using (emp_no)

where zc.to_date > curdate()

group by emp_no,dept_name, avg_salary, salary,zc.to_date, zscore

limit 50;


select emp_no
from noether_2033.as;
select *
from noether_2033.zs;

#-------------- i think complete but don't like outcome , classroom example

create temporary table noether_2033.overall_agg AS (
select avg (salary) as avg_salary, std(salary) as std_salary
from employe.salaries
where to_date > now()
);

#avg salary by department
Create temporary table noether_2033.metrics as (
select dept_name, avg(salary) as dept_average
from employees.salaries
join employees.dept_emp using (emp_no)
join employees.departments using (dept_no)
where employees.dept_emp.to_date > now()
and employees.salaries.to_date > now()
group by dept_name
);

select * 
from noether_2033.metrics;

#create cols for table 
alter table noether_2033.metrics add overall_avg float(10,2);
alter table noether_2033.metrics add overall_std float(10,2);
alter table noether_2033.metrics add dept_zscore floa(10,2);

select * 
from noether_2033.metrics;

update noether_2033.metrics set overall_avg = (select avg_salary from noether_2033.overall_agg);

update noether_2033.metrics set overall_std = (select std_salary from noether_2033.overall_agg);

update noether_2033.metrics set dept_zscore = (dept_average - overall_avg) / overall_std;





