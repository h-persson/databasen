BEGIN;

INSERT INTO job_title (job_title) VALUES
  ('Professor'),
  ('Associate Professor'),
  ('Lecturer'),
  ('PhD Student'),
  ('Teaching Assistant');

INSERT INTO department (department_name, manager_employee_id) VALUES
  ('EECS', NULL),
  ('SCI', NULL),
  ('ITM', NULL);

INSERT INTO person (personal_number, first_name, last_name, address) VALUES
  ('19750101-1234', 'Paris', 'Carbone', 'KTH Campus, Stockholm'),
  ('19691212-2345', 'Leif', 'Linbäck', 'Kista, Stockholm'),
  ('19880202-3456', 'Niharika', 'Gauraha', 'Solna, Stockholm'),
  ('19790909-4567', 'Anna', 'Svensson', 'Södermalm, Stockholm'),
  ('19930303-5678', 'Brian', 'Holm', 'Flemingsberg, Stockholm'),
  ('19970707-6789', 'Adam', 'Nilsson', 'Täby, Stockholm'),
  ('19851111-7890', 'Karin', 'Dahl', 'Uppsala'),
  ('19940404-8901', 'Oskar', 'Lund', 'Vallentuna'),
  ('19860606-9012', 'Maja', 'Berg', 'Norrmalm, Stockholm'),
  ('19980808-0123', 'Erik', 'Johansson', 'Sundbyberg');

INSERT INTO employee (employee_id, person_id, supervisor_employee_id, job_title_id, department_id) VALUES
  ('E1001',
    (SELECT person_id FROM person WHERE personal_number='19750101-1234'),
    NULL,
    (SELECT job_title_id FROM job_title WHERE job_title='Professor'),
    (SELECT department_id FROM department WHERE department_name='EECS')
  ),
  ('E1002',
    (SELECT person_id FROM person WHERE personal_number='19691212-2345'),
    'E1001',
    (SELECT job_title_id FROM job_title WHERE job_title='Lecturer'),
    (SELECT department_id FROM department WHERE department_name='EECS')
  ),
  ('E2001',
    (SELECT person_id FROM person WHERE personal_number='19880202-3456'),
    NULL,
    (SELECT job_title_id FROM job_title WHERE job_title='Associate Professor'),
    (SELECT department_id FROM department WHERE department_name='SCI')
  ),
  ('E3001',
    (SELECT person_id FROM person WHERE personal_number='19790909-4567'),
    NULL,
    (SELECT job_title_id FROM job_title WHERE job_title='Professor'),
    (SELECT department_id FROM department WHERE department_name='ITM')
  ),
  ('E1003',
    (SELECT person_id FROM person WHERE personal_number='19930303-5678'),
    'E1001',
    (SELECT job_title_id FROM job_title WHERE job_title='PhD Student'),
    (SELECT department_id FROM department WHERE department_name='EECS')
  ),
  ('E1004',
    (SELECT person_id FROM person WHERE personal_number='19970707-6789'),
    'E1002',
    (SELECT job_title_id FROM job_title WHERE job_title='Teaching Assistant'),
    (SELECT department_id FROM department WHERE department_name='EECS')
  ),
  ('E2002',
    (SELECT person_id FROM person WHERE personal_number='19851111-7890'),
    'E2001',
    (SELECT job_title_id FROM job_title WHERE job_title='Lecturer'),
    (SELECT department_id FROM department WHERE department_name='SCI')
  ),
  ('E2003',
    (SELECT person_id FROM person WHERE personal_number='19940404-8901'),
    'E2001',
    (SELECT job_title_id FROM job_title WHERE job_title='PhD Student'),
    (SELECT department_id FROM department WHERE department_name='SCI')
  ),
  ('E3002',
    (SELECT person_id FROM person WHERE personal_number='19860606-9012'),
    'E3001',
    (SELECT job_title_id FROM job_title WHERE job_title='Lecturer'),
    (SELECT department_id FROM department WHERE department_name='ITM')
  ),
  ('E3003',
    (SELECT person_id FROM person WHERE personal_number='19980808-0123'),
    'E3002',
    (SELECT job_title_id FROM job_title WHERE job_title='Teaching Assistant'),
    (SELECT department_id FROM department WHERE department_name='ITM')
  );

UPDATE department SET manager_employee_id='E1001' WHERE department_name='EECS';
UPDATE department SET manager_employee_id='E2001' WHERE department_name='SCI';
UPDATE department SET manager_employee_id='E3001' WHERE department_name='ITM';

INSERT INTO phone_number (person_id, phone_number, comment)
SELECT person_id, phone, 'mobile'
FROM (
  VALUES
    ('19750101-1234', '+46 70 111 11 11'),
    ('19691212-2345', '+46 70 222 22 22'),
    ('19880202-3456', '+46 70 333 33 33'),
    ('19790909-4567', '+46 70 444 44 44'),
    ('19930303-5678', '+46 70 555 55 55'),
    ('19970707-6789', '+46 70 666 66 66'),
    ('19851111-7890', '+46 70 777 77 77'),
    ('19940404-8901', '+46 70 888 88 88'),
    ('19860606-9012', '+46 70 999 99 99'),
    ('19980808-0123', '+46 70 000 00 00')
) AS v(pnr, phone)
JOIN person p ON p.personal_number=v.pnr;

INSERT INTO salary (employee_id, salary_date, salary) VALUES
  ('E1001','2024-01-01', 72000), ('E1001','2025-01-01', 75000),
  ('E1002','2024-01-01', 52000), ('E1002','2025-01-01', 54000),
  ('E2001','2024-01-01', 68000), ('E2001','2025-01-01', 70000),
  ('E3001','2024-01-01', 70000), ('E3001','2025-01-01', 72000),
  ('E1003','2024-01-01', 36000), ('E1003','2025-01-01', 38000),
  ('E1004','2024-01-01', 31000), ('E1004','2025-01-01', 32000),
  ('E2002','2024-01-01', 50000), ('E2002','2025-01-01', 51500),
  ('E2003','2024-01-01', 35000), ('E2003','2025-01-01', 36500),
  ('E3002','2024-01-01', 49500), ('E3002','2025-01-01', 51000),
  ('E3003','2024-01-01', 30000), ('E3003','2025-01-01', 31000);

INSERT INTO skill (skill_description) VALUES
  ('Databases'),
  ('Discrete Mathematics'),
  ('Programming'),
  ('Computer Networks'),
  ('Pedagogy'),
  ('Algorithms'),
  ('Machine Learning');

INSERT INTO skill_set (employee_id, skill_id) VALUES
  ('E1001', (SELECT skill_id FROM skill WHERE skill_description='Databases')),
  ('E1001', (SELECT skill_id FROM skill WHERE skill_description='Pedagogy')),
  ('E1002', (SELECT skill_id FROM skill WHERE skill_description='Databases')),
  ('E1002', (SELECT skill_id FROM skill WHERE skill_description='Programming')),
  ('E2001', (SELECT skill_id FROM skill WHERE skill_description='Discrete Mathematics')),
  ('E2001', (SELECT skill_id FROM skill WHERE skill_description='Algorithms')),
  ('E2002', (SELECT skill_id FROM skill WHERE skill_description='Algorithms')),
  ('E2002', (SELECT skill_id FROM skill WHERE skill_description='Pedagogy')),
  ('E2003', (SELECT skill_id FROM skill WHERE skill_description='Machine Learning')),
  ('E3001', (SELECT skill_id FROM skill WHERE skill_description='Pedagogy')),
  ('E3002', (SELECT skill_id FROM skill WHERE skill_description='Computer Networks')),
  ('E3002', (SELECT skill_id FROM skill WHERE skill_description='Programming')),
  ('E3003', (SELECT skill_id FROM skill WHERE skill_description='Programming'));

INSERT INTO study_period (period_name, period_start_date, period_end_date) VALUES
  ('P1','2025-01-13','2025-03-16'),
  ('P2','2025-03-17','2025-06-01'),
  ('P3','2025-08-25','2025-10-26'),
  ('P4','2025-10-27','2025-12-14');

INSERT INTO limits (limit_description, limit_value) VALUES
  ('max_course_instances_per_teacher_per_period', 4);

INSERT INTO teaching_activity (activity_name, factor, hp_factor, student_factor, base_hours) VALUES
  ('Lecture',        3.6, 0,     0,     0),
  ('Lab',            2.4, 0,     0,     0),
  ('Tutorial',       2.4, 0,     0,     0),
  ('Seminar',        1.8, 0,     0,     0),
  ('Examination',    1.0, 0, 0.725,    32),
  ('Administration', 1.0, 2,   0.2,    28),
  ('Others',         1.0, 0,     0,     0);

INSERT INTO course_layout (course_code, course_name, min_students, max_students, hp, version) VALUES
  ('IV1351','Data Storage Paradigms', 50, 250, 7.5, 1),
  ('IV1351','Data Storage Paradigms', 50, 250, 15.0, 2),
  ('IX1500','Discrete Mathematics',   50, 150, 7.5, 1),
  ('ID2214','Programming II',         40, 200, 7.5, 1),
  ('IV1350','Data Communication Basics', 40, 200, 7.5, 1);

INSERT INTO course_instance (course_instance_id, num_students, study_year, course_layout_id, study_period_id) VALUES
  ('2025-50273', 180, 2025,
    (SELECT course_layout_id FROM course_layout WHERE course_code='IV1351' AND version=1),
    (SELECT study_period_id FROM study_period WHERE period_name='P1')
  ),
  ('2025-50274', 200, 2025,
    (SELECT course_layout_id FROM course_layout WHERE course_code='IV1351' AND version=2),
    (SELECT study_period_id FROM study_period WHERE period_name='P2')
  ),
  ('2025-50413', 150, 2025,
    (SELECT course_layout_id FROM course_layout WHERE course_code='IX1500' AND version=1),
    (SELECT study_period_id FROM study_period WHERE period_name='P1')
  ),
  ('2025-50341', 120, 2025,
    (SELECT course_layout_id FROM course_layout WHERE course_code='ID2214' AND version=1),
    (SELECT study_period_id FROM study_period WHERE period_name='P2')
  ),
  ('2025-60104',  90, 2025,
    (SELECT course_layout_id FROM course_layout WHERE course_code='IV1350' AND version=1),
    (SELECT study_period_id FROM study_period WHERE period_name='P3')
  );

INSERT INTO planned_activity (planned_hours, course_instance_id, teaching_activity_id) VALUES
  (18,   '2025-50273', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lecture')),
  (70,   '2025-50273', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Tutorial')),
  (35,   '2025-50273', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lab')),
  (60,   '2025-50273', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Seminar')),
  (500,  '2025-50273', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Others')),
  (79,   '2025-50273', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Administration')),
  (162.5,'2025-50273', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Examination'));

INSERT INTO planned_activity (planned_hours, course_instance_id, teaching_activity_id) VALUES
  (20,  '2025-50274', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lecture')),
  (80,  '2025-50274', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Tutorial')),
  (40,  '2025-50274', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lab')),
  (80,  '2025-50274', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Seminar')),
  (650, '2025-50274', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Others')),
  (98,  '2025-50274', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Administration')),
  (177, '2025-50274', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Examination'));

INSERT INTO planned_activity (planned_hours, course_instance_id, teaching_activity_id) VALUES
  (44,    '2025-50413', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lecture')),
  (64,    '2025-50413', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Seminar')),
  (200,   '2025-50413', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Others')),
  (73,    '2025-50413', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Administration')),
  (140.75,'2025-50413', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Examination'));

INSERT INTO planned_activity (planned_hours, course_instance_id, teaching_activity_id) VALUES
  (12,  '2025-50341', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lecture')),
  (15,  '2025-50341', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Tutorial')),
  (25,  '2025-50341', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lab')),
  (40,  '2025-50341', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Others')),
  (67,  '2025-50341', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Administration')),
  (119, '2025-50341', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Examination'));

INSERT INTO planned_activity (planned_hours, course_instance_id, teaching_activity_id) VALUES
  (15,   '2025-60104', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Lecture')),
  (25,   '2025-60104', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Tutorial')),
  (100,  '2025-60104', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Others')),
  (61,   '2025-60104', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Administration')),
  (97.25,'2025-60104', (SELECT teaching_activity_id FROM teaching_activity WHERE activity_name='Examination'));

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1001', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50273' AND ta.activity_name IN ('Lecture','Others','Administration','Examination');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1002', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50273' AND ta.activity_name IN ('Tutorial','Seminar');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1003', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50273' AND ta.activity_name='Lab';

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1001', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50274' AND ta.activity_name IN ('Lecture','Others','Administration','Examination');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1002', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50274' AND ta.activity_name IN ('Lecture','Tutorial','Administration');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1003', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50274' AND ta.activity_name IN ('Tutorial','Lab');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1004', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50274' AND ta.activity_name='Lab';

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E2002', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50274' AND ta.activity_name IN ('Seminar','Examination');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E2003', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50274' AND ta.activity_name='Seminar';

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E2001', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50413' AND ta.activity_name IN ('Lecture','Seminar','Administration','Examination');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E2002', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50413' AND ta.activity_name='Examination';

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E2003', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50413' AND ta.activity_name='Others';

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1002', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50341' AND ta.activity_name IN ('Lecture','Others','Administration','Examination');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E1004', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50341' AND ta.activity_name IN ('Tutorial','Lab','Examination');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E3003', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-50341' AND ta.activity_name='Lab';

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E3002', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-60104' AND ta.activity_name IN ('Lecture','Tutorial','Administration','Examination');

INSERT INTO allocation (employee_id, planned_activity_id)
SELECT 'E3003', pa.planned_activity_id
FROM planned_activity pa
JOIN teaching_activity ta ON ta.teaching_activity_id=pa.teaching_activity_id
WHERE pa.course_instance_id='2025-60104' AND ta.activity_name='Others';

COMMIT;
