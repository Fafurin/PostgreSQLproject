--Найдем авторов, чьи книги еще не поступили в производство

SELECT 
	CONCAT(last_name, ' ',  first_name) as author,
	phone
FROM authors WHERE id IN (SELECT author_id FROM books_authors WHERE book_id IN 
			  (SELECT id FROM books WHERE status = 'standing_by'))
ORDER BY author;


--Найдем сотрудников, чей возраст более 50 лет 

SELECT 
	CONCAT(last_name, ' ', first_name) as employee,
	(SELECT position FROM staff_positions WHERE id = staff.position_id)
FROM staff WHERE profile_id IN (SELECT id FROM profiles WHERE ((CURRENT_DATE - date_of_birth)/365) > 50)
ORDER BY employee;


