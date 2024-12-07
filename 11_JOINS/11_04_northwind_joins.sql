SELECT p.product_name, c.category_name
    FROM products p
    INNER JOIN categories c
        ON p.category_id = c.category_id;

SELECT o.order_id, o.ship_name, o.order_date
    FROM orders o 
    LEFT JOIN shippers s
        ON o.ship_via = s.shipper_id
		ORDER BY order_date DESC;

SELECT c.company_name, o.order_id, SUM(od.quantity) FROM orders o 
    JOIN order_details od 
        ON o.order_id = od.order_id 
    JOIN customers c 
        ON o.customer_id = c.customer_id 
GROUP BY o.order_id, c.company_name;