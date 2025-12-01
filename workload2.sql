-- Workload 2: Actual allocated hours per teacher per course instance (Frequency: 12x/day)
SELECT 
    ci.course_instance_id,
    cl.course_code,
    cl.course_name,
    p.first_name,
    p.last_name,
    SUM(a.allocated_hours * ta.factor) AS total_allocated_hours
FROM allocation a
JOIN course_instance ci ON a.course_instance_id = ci.course_instance_id
JOIN course_layout cl ON ci.course_layout_id = cl.course_layout_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN person p ON e.person_id = p.person_id
JOIN teaching_activity ta ON a.teaching_activity_id = ta.teaching_activity_id
WHERE ci.study_year = 2025
GROUP BY ci.course_instance_id, cl.course_code, cl.course_name, p.first_name, p.last_name;
