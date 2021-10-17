SELECT
	SUM(developers.salary)
FROM developers_skills
JOIN developers ON developers_skills.developer_id = developers.id
JOIN skills ON developers_skills.skill_id = skills.id
WHERE skills.language = 'Java'