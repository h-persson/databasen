-- Query 4: Teachers with multiple courses in a period
-- Usage: SELECT * FROM view_teachers_multiple_courses WHERE study_year = 2025 AND no_of_courses > 1;
CREATE OR REPLACE VIEW view_teachers_multiple_courses AS
SELECT 
    ci.study_year,
    sp.period_name,
    e.employee_id,
    p.first_name || ' ' || p.last_name AS teacher_name,
    COUNT(DISTINCT a.course_instance_id) AS no_of_courses
FROM allocation a
JOIN course_instance ci ON a.course_instance_id = ci.course_instance_id
JOIN study_period sp ON ci.study_period_id = sp.study_period_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN person p ON e.person_id = p.person_id
GROUP BY ci.study_year, sp.period_name, e.employee_id, p.first_name, p.last_name;
