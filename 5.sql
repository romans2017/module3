CREATE OR REPLACE FUNCTION minimalcost() RETURNS projects
LANGUAGE SQL
AS $$
	SELECT
		projects.*
	FROM projects
	JOIN 
		(SELECT
			MIN(projects.cost) AS min_cost
		FROM projects) AS min_cost_table
	ON projects.cost = min_cost_table.min_cost
	ORDER BY projects.id
	LIMIT 1
$$;

SELECT * FROM minimalcost();