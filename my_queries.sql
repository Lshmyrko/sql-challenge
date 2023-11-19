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
-- List the employee number, last name, first name, sex, and salary of each employee.
Select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
From employees e  join salaries s on e.emp_no = s.emp_no
Order by emp_no; 

--List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name,last_name,hire_date 
From employees
Where Extract (Year from hire_date::date) = 1986; 

--List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.
Select c.dept_no, c.dept_name, e.emp_no, e.last_name,e.first_name,e.emp_title
From employees e 
Join dept_emp d on e.emp_no = d.emp_no 
Join departments c on d.dept_no = c.dept_no
Join titles f on f.title_id = e.emp_title
Where e.emp_title = 'm0001'; -- m0001 is a Manager title code 
 
--List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
Select dept.dept_no, e.emp_no, e.last_name, e.first_name, dept.dept_name
From employees e
Join dept_emp d on e.emp_no = d.emp_no
Join departments dept on d.dept_no = dept.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules'
And last_name Like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
Select  e.emp_no, e.last_name,e.first_name
From employees e 
Join dept_emp d on e.emp_no = d.emp_no 
Join departments c on d.dept_no = c.dept_no
Where dept_name = 'Sales';

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
Select  e.emp_no, e.last_name,e.first_name, c.dept_name
From employees e 
Join dept_emp d on e.emp_no = d.emp_no 
Join departments c on d.dept_no = c.dept_no
Where c.dept_name = 'Sales' Or c.dept_name = 'Development';

--List the frequency counts, in descending order,
-- of all the employee last names (that is, how many employees share each last name).

Select last_name, Count(*) As count_value
From employees
Group By last_name
Order By count_value Desc; 


