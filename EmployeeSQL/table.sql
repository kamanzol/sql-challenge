-- Create all the tables for the spreadsheets.
CREATE TABLE departments (
	dept_no VARCHAR(4),
	dept_name VARCHAR,
	Primary Key (dept_no)
);

CREATE TABLE employees (
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR(1),
	hire_date DATE,
	Primary Key (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(4),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4),
	emp_no INT,
	from_date DATE,
	to_date DATE, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);

CREATE TABLE salaries (
	emp_no INT,
	salary DEC,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Since importing manually doesn't work on my computer, need to import each CSV with code.

copy departments from '/Users/kamanzol/Desktop/homework/sql-challenge/EmployeeSQL/data/departments.csv'
with (format CSV, HEADER);

copy employees from '/Users/kamanzol/Desktop/homework/sql-challenge/EmployeeSQL/data/employees.csv'
with (format CSV, HEADER);

copy dept_emp from '/Users/kamanzol/Desktop/homework/sql-challenge/EmployeeSQL/data/dept_emp.csv'
with (format CSV, HEADER);

copy dept_manager from '/Users/kamanzol/Desktop/homework/sql-challenge/EmployeeSQL/data/dept_manager.csv'
with (format CSV, HEADER);

copy salaries from '/Users/kamanzol/Desktop/homework/sql-challenge/EmployeeSQL/data/salaries.csv'
with (format CSV, HEADER);

copy titles from '/Users/kamanzol/Desktop/homework/sql-challenge/EmployeeSQL/data/titles.csv'
with (format CSV, HEADER);

