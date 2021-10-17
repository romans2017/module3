ALTER TABLE developers ADD IF NOT EXISTS salary integer;

UPDATE 
	developers 
SET salary = random() * 10000 
WHERE salary IS NULL;

SELECT * FROM developers;