#### Data Analysis

Once you have a complete database, do the following:

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, salary 
from employees e
join salaries on e.emp_no = salaries.emp_no;


--2. List employees who were hired in 1986.
select * from employees
where hire_date > '1986-01-01' and hire_date <= '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name, m.emp_no,  m.from_date, m.to_date 
from departments d
join dep_manager m
on (d.dept_no = m.dept_no)
join employees e
on(e.emp_no = m.emp_no)
group by e.emp_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select d.dept_name, e.emp_no, e.last_name, e.first_name
from employees e
join dep_employees de
on(e.emp_no = de.emp_no)
join departments d
on (d.dept_no = de.dept_no)
group by d.dept_name
having count(e.emp_no)<2;


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
from employees e
where first_name = 'Hercules' and last_name like 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, dept_name
from departments d
join dep_employees on d.dept_no = dep_employees.dept_no
join employees as e on e.emp_no = dep_employees.emp_no
join salaries on e.emp_no = salaries.emp_no
where dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, dept_name
from departments d
join dep_employees on d.dept_no = dep_employees.dept_no
join employees as e on e.emp_no = dep_employees.emp_no
join salaries on e.emp_no = salaries.emp_no
where dept_name ='Sales' or dept_name ='Development'
order by dept_name;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) from employees
group by last_name
order by last_name desc;
