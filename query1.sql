-- Query 1: Planned hours per course instance
-- Usage: SELECT * FROM view_planned_hours WHERE study_year = 2025;
CREATE OR REPLACE VIEW view_planned_hours AS
SELECT 
    ci.study_year,
    ci.course_instance_id,
    cl.course_code,
    cl.hp,
    ci.num_students AS students,
    SUM(CASE WHEN ta.activity_name = 'Lecture' THEN pa.planned_hours * ta.factor ELSE 0 END) AS lecture_hours,
    SUM(CASE WHEN ta.activity_name = 'Tutorial' THEN pa.planned_hours * ta.factor ELSE 0 END) AS tutorial_hours,
    SUM(CASE WHEN ta.activity_name = 'Lab' THEN pa.planned_hours * ta.factor ELSE 0 END) AS lab_hours,
    SUM(CASE WHEN ta.activity_name = 'Seminar' THEN pa.planned_hours * ta.factor ELSE 0 END) AS seminar_hours,
    SUM(CASE WHEN ta.activity_name = 'Other Overhead' THEN pa.planned_hours * ta.factor ELSE 0 END) AS overhead_hours,
    SUM(CASE WHEN ta.activity_name = 'Admin' THEN pa.planned_hours * ta.factor ELSE 0 END) AS admin_hours,
    SUM(CASE WHEN ta.activity_name = 'Exam' THEN pa.planned_hours * ta.factor ELSE 0 END) AS exam_hours,
    SUM(pa.planned_hours * ta.factor) AS total_hours
FROM course_instance ci
JOIN course_layout cl ON ci.course_layout_id = cl.course_layout_id
JOIN planned_activity pa ON ci.course_instance_id = pa.course_instance_id
JOIN teaching_activity ta ON pa.teaching_activity_id = ta.teaching_activity_id
GROUP BY ci.study_year, ci.course_instance_id, cl.course_code, cl.hp, ci.num_students
ORDER BY ci.course_instance_id;
