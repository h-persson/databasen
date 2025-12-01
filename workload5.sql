-- Workload 5: Teachers allocated to more than N courses in current period (Frequency: 20x/day)
SELECT 
    e.employee_id,
    p.first_name,
    p.last_name,
    COUNT(DISTINCT a.course_instance_id) AS course_count
FROM allocation a
JOIN course_instance ci ON a.course_instance_id = ci.course_instance_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN person p ON e.person_id = p.person_id
WHERE ci.study_year = 2025 
  AND ci.study_period_id = 2 -- Example: Current period is 2
GROUP BY e.employee_id, p.first_name, p.last_name
HAVING COUNT(DISTINCT a.course_instance_id) > 1; -- N = 1 in this example

