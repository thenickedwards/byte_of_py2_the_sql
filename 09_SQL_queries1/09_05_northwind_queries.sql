SELECT COUNT(*) FROM customers;	-- 91

SELECT company_name FROM customers;

SELECT DISTINCT company_name FROM customers
	WHERE company_name BETWEEN 'Q' and 'Z'
	ORDER BY company_name DESC;

SELECT last_name, first_name FROM employees
	WHERE title = 'Sales Representative'
	ORDER BY last_name, first_name;

SELECT first_name, home_phone FROM employees
	WHERE first_name ILIKE 'A%'
	AND home_phone LIKE '%4%'
	ORDER BY employee_id;