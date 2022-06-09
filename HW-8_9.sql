-- При добавлении новой книги в производство, триггер найдет для этой работы наименее занятого сотрудника 

CREATE OR REPLACE FUNCTION check_less_busy_employee_trigger() 
RETURNS TRIGGER AS 
$$
DECLARE staff_id INT;
BEGIN
  staff_id := (
		SELECT 
			staff.id as employee
			FROM production
				LEFT JOIN staff ON staff.id = production.staff_id
				LEFT JOIN books ON books.id = production.book_id WHERE status = 'in_work'
			GROUP BY employee
    		ORDER BY count(production.book_id) LIMIT 1
  );
  IF staff_id THEN
     NEW.staff_id = staff_id;
  END IF;
  RETURN NEW;
END
$$ 
LANGUAGE PLPGSQL;

CREATE TRIGGER check_production_on_insert BEFORE INSERT ON production 
  FOR EACH ROW 
  EXECUTE PROCEDURE check_less_busy_employee_trigger();
