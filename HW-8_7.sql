-- Создадим представление, в котором найдем количество книг в работе у каждого сотрудника

CREATE VIEW staff_workload AS
	SELECT 
		concat(last_name, ' ', first_name) as employee,
		count(production.book_id) as book_count_in_work
	FROM production
	LEFT JOIN staff ON staff.id = production.staff_id
	LEFT JOIN books ON books.id = production.book_id WHERE status = 'in_work'
	GROUP BY employee
    	ORDER BY count(production.book_id) DESC;
   
-- Создадим представление, в котором найдем изданные книги

CREATE VIEW archive_books AS
	SELECT
		books.title as book_title,
		concat(last_name, ' ', first_name) as author,
		output_information.publishing_date,
		output_information.ISBN_or_ISSN
	FROM books
	JOIN books_authors ON books_authors.book_id = books.id
	JOIN authors ON authors.id = books_authors.author_id
	JOIN output_information ON output_information.book_id = books.id WHERE status = 'in_archive'
	ORDER BY output_information.publishing_date DESC; 
