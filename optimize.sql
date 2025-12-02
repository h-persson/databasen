
CREATE INDEX idx_ci_year_period ON course_instance(study_year, study_period_id);

CREATE INDEX idx_allocation_ci ON allocation(course_instance_id);
CREATE INDEX idx_allocation_emp ON allocation(employee_id);

CREATE INDEX idx_planned_act_ci ON planned_activity(course_instance_id);

ANALYZE;

DROP VIEW IF EXISTS view_planned_hours;

CREATE MATERIALIZED VIEW view_planned_hours AS
SELECT 
    ci.study_year,
    ci.course_instance_id,
    cl.course_code,
    cl.course_name,
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
GROUP BY ci.study_year, ci.course_instance_id, cl.course_code, cl.course_name, cl.hp, ci.num_students
ORDER BY ci.course_instance_id
WITH DATA;

-- Index på MVn för snabb sökning

CREATE INDEX idx_mv_planned_year ON view_planned_hours(study_year);
