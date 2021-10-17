
CREATE TEMP TABLE IF NOT EXISTS tt_projects_salaries
(
	id integer,
	name varchar(100),
	sum_salary integer
) ON COMMIT DROP
;

TRUNCATE tt_projects_salaries
;

INSERT INTO tt_projects_salaries
SELECT
	projects.id,
	projects.name,
	SUM(developers.salary) AS sum_salary 
FROM developers_projects
JOIN developers ON developers_projects.developer_id = developers.id
JOIN projects ON developers_projects.project_id = projects.id
GROUP BY 
	projects.id,
	projects.name
;

SELECT
	tt_projects_salaries.id,
	tt_projects_salaries.name,
	tt_projects_salaries.sum_salary
FROM (SELECT
		MAX(tt_projects_salaries.sum_salary) AS max_sum_salary
	FROM tt_projects_salaries) AS tt_max_salaries
JOIN tt_projects_salaries ON tt_max_salaries.max_sum_salary = tt_projects_salaries.sum_salary
;
