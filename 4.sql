ALTER TABLE projects ADD IF NOT EXISTS cost integer;

UPDATE 
	projects 
SET cost = random() * 1000000 
WHERE cost IS NULL;

SELECT * FROM projects;