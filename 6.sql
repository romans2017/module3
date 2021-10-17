SELECT
	minimalcost.id,
	minimalcost.name,
	AVG(developers.salary) AS average_salary
FROM minimalcost AS minimalcost
JOIN developers_projects ON minimalcost.id = developers_projects.project_id
JOIN developers ON developers_projects.developer_id = developers.id
GROUP BY 
	minimalcost.id,
	minimalcost.name