-- Workload 3: Teacher load per period (Frequency: 5x/day)
SELECT 
    p.first_name,
    p.last_name,
    sp.period_name,
    SUM(a.allocated_hours * ta.factor) AS total_load
FROM allocation a
JOIN course_instance ci ON a.course_instance_id = ci.course_instance_id
JOIN study_period sp ON ci.study_period_id = sp.study_period_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN person p ON e.person_id = p.person_id
JOIN teaching_activity ta ON a.teaching_activity_id = ta.teaching_activity_id
WHERE ci.study_year = 2025
GROUP BY p.first_name, p.last_name, sp.period_name;

