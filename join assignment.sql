# https://github.com/mdanish0320/teaching-class/blob/master/JP-BE-PY-batch-1/mysql-class/sample-databases/hr_db/db.sql
USE hr_db;
select * from departments;
#join
#List all employees along with their department names.
select
 emp.FIRST_NAME , emp.last_name, dept.department_name,emp.salary,emp.employee_id 
from
 employees 
as emp 
inner join 
  departments as dept
ON
 emp.DEPARTMENT_ID = dept.DEPARTMENT_ID;
   
#Find all employees and their job titles.
select * from employees as emp inner join jobs ON emp.job_id = jobs.job_id;

#Retrieve the job history of each employee along with the department name they worked in
select * 
from
 employees as emp
inner join
 job_history as jh 
ON
 emp.employee_id = jh.employee_id 
inner join
 departments 
ON
 departments.department_id = jh.department_id;

#List the employees who are currently working under the same manager, displaying the manager's name.
select * from employees as emp ;

#Retrieve the details of all departments located in a specific city i.e "Tokyo".
select * from departments as dept inner join locations as loc ON dept.location_id = loc.location_id where loc.city = 'Tokyo';

#Retrieve the details of all departments located in a specific cities i.e "Sydney" and "Toronto".
select * from departments as dept inner join locations as loc ON dept.location_id = loc.location_id where loc.city = 'Sydney' or loc.city = 'Toronto';

## left join

#Find all departments and their employees, including departments with no employees.
select * from departments left join employees ON departments.department_id = employees.department_id;

#Retrieve a list of all job titles and the employees who have that job, including job titles with no employees.
select * from jobs left join employees as e ON jobs.job_id = e.job_id;


### RIGHT JOIN Assignments
#Find all employees and the locations they are working in, including locations without any employees.
select * from employees as e right join locations as loc ON loc.LOCATION_ID = e.LOCATION_ID;

#List all countries and the regions they belong to, including regions without any countries.
select * from countries as c right join regions as r ON c.region_id = r.region_id;


##      JOIN + Group BY

#List the number of employees working in each city.  
select count(*),departments.location_id from employees as e inner join  departments on e.department_id = departments.department_id group by departments.location_id;

#List the total salary expenditure for each department, along with the department name.
select e.department_id ,d.department_name, sum(e.salary) from employees as e inner join departments as d on e.department_id = d.department_id group by e.department_id;
   
#Count the number of employees in each city.
select count(*) from employees as e inner join departments as d on e.department_id = d.department_id group by d.location_id ;
   
#Calculate the average salary for each job title within each department.
select
 avg(e.salary),j.job_title 
from
 employees as e 
inner join
 jobs as j 
on
 e.job_id = j.job_id 
group by
 j.job_title; 
 
#List the number of employees hired in each year for each job title.
select
 count(*), year(e.hire_date),j.job_title 
from
 employees as e 
inner join
 jobs as j 
on
 e.job_id = j.job_id 
group by
 year(e.hire_date), j.job_title;
 
#Find the highest salary paid in each region.
select
 max(e.salary),r.region_name 
from
 employees as e 
inner join
 departments as d 
on
 e.department_id= d.department_id 
inner join
 locations as l 
on
 d.location_id = l.location_id 
inner join
 countries as c 
on
 l.country_id = c.country_id 
inner join
 regions as r 
on
 c.region_id = r.region_id 
group by
 r.region_name ;
  
#Count the number of employees in each country.
select
 count(*),c.country_name 
from
 employees as e 
inner join
 departments as d 
on
 e.department_id= d.department_id 
inner join
 locations as l 
on
 d.location_id = l.location_id 
inner join
 countries as c 
on
 l.country_id = c.country_id 
group by
 c.country_name;
 
#Calculate the average salary and the number of employees for each department located in a specific region.
select avg(e.salary),r.region_name,d.department_name,count(*) from employees as e inner join departments as d on e.department_id = d.department_id inner join locations as l on d.location_id = l.location_id inner join countries as c on l.country_id = c.country_id inner join regions as r on c.region_id = r.region_id group by r.region_name,d.department_name; 