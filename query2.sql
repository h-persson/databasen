-- Query 2: Allocated hours per teacher per course
-- Usage: SELECT * FROM view_allocated_hours_per_course WHERE course_instance_id = '2025-50273';
CREATE OR REPLACE VIEW view_allocated_hours_per_course AS
SELECT 
    ci.course_instance_id,
    cl.course_code,
    e.employee_id,
    p.first_name,
    p.last_name,
    p.first_name || ' ' || p.last_name AS teacher_name,
    jt.job_title,
    SUM(CASE WHEN ta.activity_name = 'Lecture' THEN a.allocated_hours * ta.factor ELSE 0 END) AS lecture_hours,
    SUM(CASE WHEN ta.activity_name = 'Tutorial' THEN a.allocated_hours * ta.factor ELSE 0 END) AS tutorial_hours,
    SUM(CASE WHEN ta.activity_name = 'Lab' THEN a.allocated_hours * ta.factor ELSE 0 END) AS lab_hours,
    SUM(CASE WHEN ta.activity_name = 'Seminar' THEN a.allocated_hours * ta.factor ELSE 0 END) AS seminar_hours,
    SUM(CASE WHEN ta.activity_name = 'Other Overhead' THEN a.allocated_hours * ta.factor ELSE 0 END) AS overhead_hours,
    SUM(CASE WHEN ta.activity_name = 'Admin' THEN a.allocated_hours * ta.factor ELSE 0 END) AS admin_hours,
    SUM(CASE WHEN ta.activity_name = 'Exam' THEN a.allocated_hours * ta.factor ELSE 0 END) AS exam_hours,
    SUM(a.allocated_hours * ta.factor) AS total_allocated
FROM allocation a
JOIN course_instance ci ON a.course_instance_id = ci.course_instance_id
JOIN course_layout cl ON ci.course_layout_id = cl.course_layout_id
JOIN employee e ON a.employee_id = e.employee_id
JOIN person p ON e.person_id = p.person_id
JOIN job_title jt ON e.job_title_id = jt.job_title_id
JOIN teaching_activity ta ON a.teaching_activity_id = ta.teaching_activity_id
GROUP BY ci.course_instance_id, cl.course_code, e.employee_id, p.first_name, p.last_name, jt.job_title
ORDER BY p.last_name;
