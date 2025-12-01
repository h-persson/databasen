-- Query 3: Total allocated hours for specific teacher and specific year
-- Usage: SELECT * FROM view_teacher_load WHERE teacher_name = 'Niharika Gauraha' AND study_year = 2025;
CREATE OR REPLACE VIEW view_teacher_load AS
SELECT 
    ci.study_year,
    cl.course_code,
    ci.course_instance_id,
    sp.period_name,
    e.employee_id,
    p.first_name || ' ' || p.last_name AS teacher_name,
    SUM(CASE WHEN ta.activity_name = 'Lecture' THEN a.allocated_hours * ta.factor ELSE 0 END) AS lecture_hours,
    SUM(CASE WHEN ta.activity_name = 'Tutorial' THEN a.allocated_hours * ta.factor ELSE 0 END) AS tutorial_hours,
    SUM(CASE WHEN ta.activity_name = 'Lab' THEN a.allocated_hours * ta.factor ELSE 0 END) AS lab_hours,
    SUM(CASE WHEN ta.activity_name = 'Seminar' THEN a.allocated_hours * ta.factor ELSE 0 END) AS seminar_hours,
    SUM(CASE WHEN ta.activity_name = 'Other Overhead' THEN a.allocated_hours * ta.factor ELSE 0 END) AS overhead_hours,
    SUM(CASE WHEN ta.activity_name = 'Admin' THEN a.allocated_hours * ta.factor ELSE 0 END) AS admin_hours,
    SUM(CASE WHEN ta.activity_name = 'Exam' THEN a.allocated_hours * ta.factor ELSE 0 END) AS exam_hours,
    SUM(a.allocated_hours * ta.factor) AS total
FROM allocation a
JOIN course_instance ci ON a.course_instance_id = ci.course_instance_id
JOIN course_layout cl ON ci.course_layout_id = cl.course_layout_id
JOIN study_period sp ON ci.study_period_id = sp.study_period_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN person p ON e.person_id = p.person_id
JOIN teaching_activity ta ON a.teaching_activity_id = ta.teaching_activity_id
GROUP BY ci.study_year, cl.course_code, ci.course_instance_id, sp.period_name, e.employee_id, p.first_name, p.last_name
ORDER BY sp.period_name;
