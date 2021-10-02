-- SECTION 2 part 2
-- I want to know the list of our customers and their spending.

SELECT
	a.id,
	a.name,
	SUM(c.price) AS total_spend
FROM
	car_dealer.customers a
	LEFT JOIN car_dealer.transactions b ON a.id = b.customer_id
	LEFT JOIN car_dealer.list_of_cars c ON b.car_serial_number = c.serial_number
GROUP BY
	a.id;