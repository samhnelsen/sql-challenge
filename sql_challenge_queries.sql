--List the employee number, last name, first name, sex, and salary of each employee.
SELECT
e.emp_no,
e.last_name,
e.first_name,
e.sex,
s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no ;
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
first_name,
last_name,
hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) >= 1986 ;
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
d.dept_no,
dt.dept_name,
e.emp_no,
e.last_name,
e.first_name
FROM employees e
JOIN dept_manager d ON e.emp_no = d.emp_no
JOIN departments dt ON d.dept_no = dt.dept_no ;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
d.dept_no,
e.emp_no,
e.last_name,
e.first_name,
dt.dept_name
FROM employees e
JOIN dept_emp d ON e.emp_no = d.emp_no
JOIN departments dt ON d.dept_no = dt.dept_no;
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
e.emp_no,
e.last_name,
e.first_name
FROM employees e
JOIN dept_emp d ON e.emp_no = d.emp_no
WHERE d.dept_no = 'd007';
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
e.emp_no,
e.last_name,
e.first_name,
dt.dept_name
FROM employees e
JOIN dept_emp d ON e.emp_no = d.emp_no
JOIN departments dt ON d.dept_no = dt.dept_no
WHERE dt.dept_name = 'Sales'
OR dt.dept_name = 'Development';
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
