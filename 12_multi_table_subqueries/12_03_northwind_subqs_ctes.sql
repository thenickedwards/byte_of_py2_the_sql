WITH all_comps AS (
	SELECT company_name FROM customers
		UNION ALL
	SELECT company_name FROM shippers
		UNION ALL
	SELECT company_name FROM suppliers
)
SELECT company_name FROM all_comps
	WHERE company_name ILIKE 'd%'

SELECT product_name, category_name FROM products p
	INNER JOIN categories c
	ON c.category_id = p.category_id
WHERE category_name ILIKE 'c%';
	
SELECT p.product_name FROM products p
	WHERE EXISTS(
SELECT category_name FROM categories c
	WHERE c.category_id = p.category_id
	AND category_name ILIKE 'c%');