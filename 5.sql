CREATE OR REPLACE VIEW minimalcost
AS 
	SELECT
		projects.*
	FROM projects
	JOIN 
		(SELECT
			MIN(projects.cost) AS min_cost
		FROM projects) AS min_cost_table
	ON projects.cost = min_cost_table.min_cost
	ORDER BY projects.id;

SELECT * FROM minimalcost;