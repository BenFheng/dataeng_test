-- SECTION 2 part 2
-- I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.

SELECT
	a.manufacturer,
	COUNT(b.car_serial_number) AS sales_quantity,
	SUM(a.price) AS sales_number
FROM
	car_dealer.list_of_cars a
	LEFT JOIN car_dealer.transactions b ON a.serial_number = b.car_serial_number
WHERE
	date_part('month', b.datetime) = date_part('month', CURRENT_DATE)
GROUP BY
	a.manufacturer
ORDER BY
	sales_number DESC
LIMIT 3;