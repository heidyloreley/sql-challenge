DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dep_employees;
DROP TABLE IF EXISTS dep_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

---

create table departments (
	dept_no varchar(10) not null,
	dept_name VARCHAR(255),
	CONSTRAINT pk_dept PRIMARY KEY (dept_no));	
SELECT * FROM departments;

create table employees (
	emp_no int not null,
	birth_date date not null,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	gender varchar(1) not null,
	hire_date date not null,
	CONSTRAINT pk_employee PRIMARY KEY (emp_no));	
SELECT * FROM employees;

create table dep_employees (
	emp_no int not null,
	dept_no varchar(10) not null,
	from_date date not null,
	to_date date not null);
SELECT * FROM dep_employees;

create table dep_manager (
	dept_no varchar(10) not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null);
SELECT * FROM dep_manager;

create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null);
SELECT * FROM salaries;

create table titles (
	emp_no int not null,
	title varchar(100) not null,
	from_date date not null,
	to_date date not null);
SELECT * FROM titles;

--import info from CSV file

ALTER TABLE dep_employees ADD CONSTRAINT fk_dep_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE dep_employees ADD CONSTRAINT fk_dep_employees_dept_no FOREIGN KEY(dept_no)
REFERENCES departments(dept_no);

ALTER TABLE dep_manager ADD CONSTRAINT fk_dep_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);



