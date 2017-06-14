-- 1. Select the last name of all employees.
SELECT lastname FROM employees;

-- 2. Select the last name of all employees, without duplicates.
SELECT DISTINCT lastname FROM employees;

-- 3. Select all the data of employees whose last name is "Smith".
SELECT * FROM employees WHERE lastname = 'Smith';

-- 4. Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM employees WHERE lastname = 'Smith' or lastname = 'Doe';

-- 5. Select all the data of employees that work in department 14.
SELECT * FROM employees WHERE department = 14;

-- 6. Select all the data of employees that work in department 37 or department 77.
SELECT * FROM employees WHERE department = 37 OR department = 77;

-- 7. Select all the data of employees whose last name begins with an "S".
SELECT * FROM employees WHERE lastname like 'S%';

-- 8. Select the sum of all the departments' budgets.
SELECT SUM(budget) FROM departments;

-- 9. Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT department, count(*) FROM employees GROUP BY department;

-- 10. Select all the data of employees, including each employee's department's data.
SELECT ssn, employees.name, lastname, code, departments.name AS departmentname, budget FROM employees INNER JOIN departments ON employees.department = departments.code;

-- 11. Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT employees.name, employees.lastname, departments.name AS departmentname, budget FROM employees INNER JOIN departments ON employees.department = departments.code;

-- 12. Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT employees.name, employees.lastname FROM employees INNER JOIN departments ON employees.department = departments.code WHERE budget > 60000;

-- 13. Select the departments with a budget larger than the average budget of all the departments.
SELECT * FROM departments WHERE budget > (SELECT AVG(budget) FROM departments);

-- 14. Select the names of departments with more than two employees.
SELECT name FROM departments WHERE code IN (SELECT department FROM employees GROUP BY department HAVING count(*) > 2);

-- 15. Select the name and last name of employees working for departments with second lowest budget.
SELECT employees.name, employees.lastname FROM employees WHERE employees.department = (SELECT sub.code FROM (SELECT * FROM departments ORDER BY departments.budget LIMIT 2) sub ORDER BY budget DESC LIMIT 1);

-- 16. Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO departments (code, name, budget) VALUES (11, 'Quality Assurance', 40000);
INSERT INTO employees (ssn, name, lastname, department) VALUES (847219811, 'Mary', 'Moore', 11);

-- 17. Reduce the budget of all departments by 10%.
UPDATE departments SET budget = budget * 0.9;

-- 18. Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE employees SET department = 14 WHERE department = 77;

-- 19. Delete from the table all employees in the IT department (code 14).
DELETE FROM employees WHERE department = 14;

-- 20. Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM employees WHERE department IN (SELECT code FROM departments WHERE budget >= 60000);

-- 21. Delete from the table all employees.
DELETE FROM employees;
