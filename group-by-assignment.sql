# https://github.com/mdanish0320/teaching-class/blob/master/JP-BE-PY-batch-1/mysql-class/sample-databases/hr_db/db.sql
USE hr_db;

SELECT * from employees;
# Write a query to get the number of employees who has the same job title.
SELECT count(*), JOB_ID from employees group by JOB_ID;

# list down the lowest salary of the employee of every manager and also display the manager_id.
SELECT MANAGER_ID , min(SALARY) as lowest_salary FROM employees group by MANAGER_ID;

# list down the total salaries of every deparment # NOTE: salary should be in ascending order
SELECT job_id , sum(SALARY) as total_salary FROM employees group by job_id order by total_salary;

# list down the average salaries of every department exluding IT Deparment
select job_id, avg(SALARY) as Average_salary from employees group by job_id having job_id != 60;

# fetch the top 3 department who is taking the highest salary among all other deparment
SELECT job_id, max(SALARY) FROM employees group by job_id order by max(salary) desc limit 3;

# list down all the department (job_id) whose avg salary is more than overall avg salary of the whole company
select job_id, avg(salary) from employees group by job_id having avg(salary) > (select avg(salary) from employees) ;

# Write a query to get employee ID, last name, and date of first salary of the employees.
select employee_id, last_name, hire_date from employees;

# find the department that contains more than 10 employees
select count(*) as total_employees, DEPARTMENT_ID from employees group by DEPARTMENT_ID having count(*) >= 10;

# Write a query to get the years in which more than 10 employees joined.
select count(*) as total_employees, year(hire_date) from employees group by year(hire_date) having count(*) >= 10;

#Find the number of employees in each department.
select count(*) as total_employees, DEPARTMENT_ID from employees group by DEPARTMENT_ID;

#Calculate the average salary for each job title.
select avg(salary), job_id from employees group by job_id;

#List the total salary expenditure for each department.
select sum(salary), DEPARTMENT_ID from employees group by DEPARTMENT_ID;

#Find the maximum salary in each department.
select max(salary), DEPARTMENT_ID from employees group by DEPARTMENT_ID;

#Count the number of employees hired in each year.
select count(*), year(hire_date) from employees group by year(hire_date);

#Determine the number of employees with the same manager.
select count(*) as num_of_employees, manager_id from employees group by manager_id;

#Find the average commission percentage for each department.
select avg(COMMISSION_PCT), DEPARTMENT_ID from employees group by DEPARTMENT_ID;

#Calculate the total duration (in days) that each employee spent in their job(s) from the `job_history` table.
select * from job_history;
select sum(datediff(end_date, start_date)), EMPLOYEE_ID from job_history group by EMPLOYEE_ID;

#Find the highest salary offered for each job title.
select max(salary) as highest_salary, job_id from employees group by job_id;