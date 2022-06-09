-- Пользовательская функция считает общее кол-во учетно-издательских листов, которое выработал определенный сторудник за отведенный срок.

CREATE FUNCTION total_publishing_sheets_counting (last_name VARCHAR, start_date DATE, finish_date DATE) 
RETURNS DECIMAL(5,2) AS 
$$
	SELECT 
		SUM(output_information.publishing_sheets) as total_publishing_sheets
		FROM output_information
		JOIN books ON output_information.book_id = books.id
		JOIN production ON books.id = production.book_id
		JOIN staff ON production.staff_id = staff.id
		JOIN deadlines ON production.id = deadlines.production_id
	WHERE staff.last_name = last_name AND deadlines.finish_date BETWEEN start_date AND finish_date
	GROUP BY staff.id;
$$ 
LANGUAGE SQL;

SELECT total_publishing_sheets_counting('Kunze', '2010-04-01', '2021-05-01') AS total_publishing_sheets;
