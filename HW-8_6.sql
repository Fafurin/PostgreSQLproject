-- Выведем имена, фамилии, дату рождения и должность всех сотрудников

SELECT 
	CONCAT(first_name, ' ', last_name) as employee,
	date_of_birth,
	position
FROM staff_positions
	JOIN staff ON staff.position_id = staff_positions.id
	JOIN profiles ON profiles.id = staff.profile_id
ORDER BY position;

-- Найдем котакты авторов, чьи книги находятся в работе

SELECT 
	CONCAT(first_name, ' ', middle_name) as author,
	authors.phone,
	authors.email,
	books.title as book_title
FROM authors
	JOIN books_authors ON books_authors.author_id = authors.id
	JOIN books ON books.id = books_authors.book_id
WHERE status = 'in_work';
