-- Creating my tables
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);
CREATE TABLE dept_emp (
    emp_no Integer,
    dept_no VARCHAR NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INTEGER NOT NULL
);

CREATE TABLE employees (
    emp_no Integer PRIMARY KEY,
    emp_title VARCHAR NOT NULL,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR
	
);
CREATE TABLE salaries(
    emp_no Integer PRIMARY KEY,
	salary Integer
);
CREATE TABLE titles(
    title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

-- viewing my tables after importing data
select * from departments
select* from dept_emp
select * from dept_manager
select * from employees
select* from salaries
select * from titles