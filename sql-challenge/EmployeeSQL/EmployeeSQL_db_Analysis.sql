-- DATA ANALYSIS
SELECT * FROM Employees

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date from Employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT department_manager.dept_no, 
	   	departments.dept_name,
	   	department_manager.emp_no,
	   	employees.last_name,
	   	employees.first_name
FROM department_manager
INNER JOIN departments ON
department_manager.dept_no = departments.dept_no
INNER JOIN employees ON
department_manager.emp_no = employees.emp_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	department_employee.dept_no,
	departments.dept_name
FROM employees 
INNER JOIN department_employee ON 
employees.emp_no = department_employee.emp_no
INNER JOIN departments ON 
departments.dept_no = department_employee.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employee ON
employees.emp_no = department_employee.emp_no
INNER JOIN departments ON
department_employee.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employee ON
employees.emp_no = department_employee.emp_no
INNER JOIN departments ON
department_employee.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR 
	  dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;
