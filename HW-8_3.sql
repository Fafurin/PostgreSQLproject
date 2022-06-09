ALTER TABLE books_authors
	ADD CONSTRAINT books_authors_author_id_fk
	FOREIGN KEY (author_id)
	REFERENCES authors (id);
	
ALTER TABLE books_authors
	ADD CONSTRAINT books_authors_book_id_fk
	FOREIGN KEY (book_id)
	REFERENCES books (id);
	
ALTER TABLE books_files
	ADD CONSTRAINT books_files_book_id_fk
	FOREIGN KEY (book_id)
	REFERENCES books (id);
	
ALTER TABLE books
	ADD CONSTRAINT books_format_id_fk
	FOREIGN KEY (book_format_id)
	REFERENCES books_formats (id);

ALTER TABLE deadlines
	ADD CONSTRAINT deadlines_production_id_fk
	FOREIGN KEY (production_id)
	REFERENCES production (id);	

ALTER TABLE output_information
	ADD CONSTRAINT output_information_book_id_fk
	FOREIGN KEY (book_id)
	REFERENCES books (id);
	
ALTER TABLE production
	ADD CONSTRAINT production_book_id_fk
	FOREIGN KEY (book_id)
	REFERENCES books (id);
	
ALTER TABLE production
	ADD CONSTRAINT production_staff_id_fk
	FOREIGN KEY (staff_id)
	REFERENCES staff (id);
	
ALTER TABLE staff
	ADD CONSTRAINT staff_profile_id_fk
	FOREIGN KEY (profile_id)
	REFERENCES profiles (id);
	
ALTER TABLE staff
	ADD CONSTRAINT staff_position_id_fk
	FOREIGN KEY (position_id)
	REFERENCES staff_positions (id);
	

