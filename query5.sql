-- Query 5: Variance > 15% between planned and allocated
-- Usage: SELECT * FROM view_variance_check WHERE study_year = 2025;
CREATE OR REPLACE VIEW view_variance_check AS
WITH Planned AS (
    SELECT 
        ci.study_year,
        ci.course_instance_id,
        cl.course_code,
        cl.course_name,
        SUM(pa.planned_hours * ta.factor) AS total_planned
    FROM planned_activity pa
    JOIN teaching_activity ta ON pa.teaching_activity_id = ta.teaching_activity_id
    JOIN course_instance ci ON pa.course_instance_id = ci.course_instance_id
    JOIN course_layout cl ON ci.course_layout_id = cl.course_layout_id
    GROUP BY ci.study_year, ci.course_instance_id, cl.course_code, cl.course_name
),
Allocated AS (
    SELECT 
        ci.course_instance_id,
        COALESCE(SUM(a.allocated_hours * ta.factor), 0) AS total_allocated
    FROM course_instance ci
    LEFT JOIN allocation a ON ci.course_instance_id = a.course_instance_id
    LEFT JOIN teaching_activity ta ON a.teaching_activity_id = ta.teaching_activity_id
    GROUP BY ci.course_instance_id
)
SELECT 
    p.study_year,
    p.course_instance_id,
    p.course_code,
    p.course_name,
    p.total_planned,
    a.total_allocated,
    ABS(p.total_planned - a.total_allocated) AS diff,
    CASE WHEN p.total_planned > 0 
         THEN (ABS(p.total_planned - a.total_allocated) / p.total_planned) * 100 
         ELSE 0 
    END AS variance_percentage
FROM Planned p
JOIN Allocated a ON p.course_instance_id = a.course_instance_id
WHERE 
    p.total_planned > 0 AND
    (ABS(p.total_planned - a.total_allocated) / p.total_planned) > 0.15;
