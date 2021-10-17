SELECT
	AVG(developers.salary)
FROM minimalcost() AS min_project
JOIN developers_projects ON min_project.id = developers_projects.project_id
JOIN developers ON developers_projects.developer_id = developers.id