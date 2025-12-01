-- Workload 1: Planned hours per course instance (Frequency: 8x/day)
SELECT 
    ci.course_instance_id,
    cl.course_code,
    cl.course_name,
    SUM(pa.planned_hours * ta.factor) AS total_planned_hours
FROM course_instance ci
JOIN course_layout cl ON ci.course_layout_id = cl.course_layout_id
JOIN planned_activity pa ON ci.course_instance_id = pa.course_instance_id
JOIN teaching_activity ta ON pa.teaching_activity_id = ta.teaching_activity_id
WHERE ci.study_year = 2025
GROUP BY ci.course_instance_id, cl.course_code, cl.course_name;

