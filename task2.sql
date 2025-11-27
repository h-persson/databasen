-- 1. Planned hours calculations: 
SELECT 
    cl.course_code AS "Course Code",
    ci.course_instance_id AS "Course Instance ID",
    cl.hp AS "HP",
    sp.period_name AS "Period",
    ci.num_students AS "# Students",

    SUM(CASE WHEN ta.activity_name = 'Lecture'        THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Lecture Hours",
    SUM(CASE WHEN ta.activity_name = 'Tutorial'       THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Tutorial Hours",
    SUM(CASE WHEN ta.activity_name = 'Lab'            THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Lab Hours",
    SUM(CASE WHEN ta.activity_name = 'Seminar'        THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Seminar Hours",
    SUM(CASE WHEN ta.activity_name = 'Others'         THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Other Overhead Hours",
    SUM(CASE WHEN ta.activity_name = 'Administration' THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Admin",
    SUM(CASE WHEN ta.activity_name = 'Examination'    THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Exam",

    SUM(pa.planned_hours * ta.factor) AS "Total Hours"

FROM course_instance ci
JOIN course_layout cl ON cl.course_layout_id = ci.course_layout_id
JOIN study_period sp ON sp.study_period_id = ci.study_period_id
JOIN planned_activity pa ON pa.course_instance_id = ci.course_instance_id
JOIN teaching_activity ta ON ta.teaching_activity_id = pa.teaching_activity_id

WHERE ci.study_year = 2025


GROUP BY 
cl.course_code, 
ci.course_instance_id, 
cl.hp, 
sp.period_name, 
ci.num_students

ORDER BY ci.course_instance_id;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--2. Calculate actual allocated hours for a course: 

SELECT
cl.course_code AS "Course Code",
ci.course_instance_id AS "Course Instance ID",
cl.hp AS "HP",
CONCAT(p.first_name, ' ', p.last_name) AS "Teacher's Name",
jt.job_title AS "Designation",

SUM(CASE WHEN ta.activity_name = 'Lecture'        THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Lecture Hours",
SUM(CASE WHEN ta.activity_name = 'Tutorial'       THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Tutorial Hours",
SUM(CASE WHEN ta.activity_name = 'Lab'            THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Lab Hours",
SUM(CASE WHEN ta.activity_name = 'Seminar'        THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Seminar Hours",
SUM(CASE WHEN ta.activity_name = 'Others'         THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Other Overhead Hours",
SUM(CASE WHEN ta.activity_name = 'Administration' THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Admin",
SUM(CASE WHEN ta.activity_name = 'Examination'    THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Exam",

SUM(pa.planned_hours * ta.factor) AS "Total"

FROM allocation al
JOIN planned_activity pa ON pa.planned_activity_id = al.planned_activity_id
JOIN teaching_activity ta ON ta.teaching_activity_id = pa.teaching_activity_id
JOIN employee e ON e.employee_id = al.employee_id
JOIN person p ON p.person_id = e.person_id
JOIN job_title jt ON jt.job_title_id = e.job_title_id
JOIN course_instance ci ON ci.course_instance_id = pa.course_instance_id
JOIN course_layout cl ON cl.course_layout_id = ci.course_layout_id

WHERE ci.study_year = 2025

GROUP BY
cl.course_code,
ci.course_instance_id,
cl.hp,
p.first_name,
p.last_name,
jt.job_title

ORDER BY
ci.course_instance_id,
"Teacher's Name";


/////////////////////////////////////////////////////////////////////////////////////////////////////////
--3. Calculate the total allocated hours (with multiplication factors) for a teacher, only for the current years’ course instances

SELECT
cl.course_code AS "Course Code",
ci.course_instance_id AS "Course Instance ID",
cl.hp AS "HP",
sp.period_name AS "Period",
CONCAT(p.first_name, ' ', p.last_name) AS "Teacher's Name",

SUM(CASE WHEN ta.activity_name = 'Lecture'        THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Lecture Hours",
SUM(CASE WHEN ta.activity_name = 'Tutorial'       THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Tutorial Hours",
SUM(CASE WHEN ta.activity_name = 'Lab'            THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Lab Hours",
SUM(CASE WHEN ta.activity_name = 'Seminar'        THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Seminar Hours",
SUM(CASE WHEN ta.activity_name = 'Others'         THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Other Overhead Hours",
SUM(CASE WHEN ta.activity_name = 'Administration' THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Admin",
SUM(CASE WHEN ta.activity_name = 'Examination'    THEN pa.planned_hours * ta.factor ELSE 0 END) AS "Exam",

SUM(pa.planned_hours * ta.factor) AS "Total"

FROM allocation al
JOIN planned_activity pa ON pa.planned_activity_id = al.planned_activity_id
JOIN teaching_activity ta ON ta.teaching_activity_id = pa.teaching_activity_id
JOIN employee e ON e.employee_id = al.employee_id
JOIN person p ON p.person_id = e.person_id
JOIN course_instance ci ON ci.course_instance_id = pa.course_instance_id
JOIN course_layout cl ON cl.course_layout_id = ci.course_layout_id
JOIN study_period sp ON sp.study_period_id = ci.study_period_id

WHERE ci.study_year = 2025 

GROUP BY
cl.course_code,
ci.course_instance_id,
cl.hp,
sp.period_name,
p.first_name,
p.last_name

ORDER BY
"Teacher's Name",
ci.course_instance_id;


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 4.List employee ids and names of all teachers who are allocated in more than a specific number of course instances during the current period. 

SELECT
e.employee_id AS "Employment ID",
CONCAT(p.first_name, ' ', p.last_name) AS "Teacher's Name",
sp.period_name AS "Period",
COUNT(DISTINCT ci.course_instance_id) AS "No of courses"

FROM allocation al

JOIN planned_activity pa ON pa.planned_activity_id = al.planned_activity_id
JOIN employee e ON e.employee_id = al.employee_id
JOIN person p ON p.person_id = e.person_id
JOIN course_instance ci ON ci.course_instance_id = pa.course_instance_id
JOIN study_period sp ON sp.study_period_id = ci.study_period_id

WHERE ci.study_year = 2025  

GROUP BY
e.employee_id,
p.first_name,
p.last_name,
sp.period_name

HAVING COUNT(DISTINCT ci.course_instance_id) > 0

ORDER BY
"Teacher's Name";

