SELECT customer_id, MIN(order_date) first_order FROM orders 
	GROUP BY customer_id 
	ORDER BY customer_id;

SELECT customer_id, AVG(freight) avg_fright FROM orders
	GROUP BY customer_id
	ORDER BY avg_fright DESC;

SELECT od.order_id, COUNT(DISTINCT product_id) as product_count
	FROM order_details od
		GROUP BY od.order_id HAVING COUNT(*) >= 5
		ORDER BY product_count DESC;