BEGIN;

INSERT INTO constants (constant_description, constant_value) VALUES
  ('max_courses_per_period', 4.00000),
  ('exam_base_hours',        32.00000),
  ('exam_student_factor',     0.72500),
  ('admin_base_hours',       28.00000),
  ('admin_student_factor',    0.20000),
  ('admin_hp_factor',         2.00000);

INSERT INTO job_title (job_title) VALUES
  ('Boss'),              -- id 1
  ('Professor'),         -- id 2
  ('Associate Professor'), -- id 3
  ('Lecturer'),          -- id 4
  ('Teaching Assistant'),-- id 5
  ('PhD Student');       -- id 6

INSERT INTO person (personal_number, first_name, last_name, address, phone_number) VALUES
  ('19780101-1234', 'Fadil',    'Kovacevic', 'Lindstedtsvagen 1, 114 28 Stockholm', '+46-70-0000001'), -- id 1
  ('19830515-5678', 'Paris',    'Carbone',   'Valhallavagen 79, 114 28 Stockholm',  '+46-70-0000002'), -- id 2
  ('19751212-9012', 'Leif',     'Lindback',  'Drottning Kristinas vag 15, 114 28 Stockholm', '+46-70-0000003'), -- id 3
  ('19900130-3456', 'Niharika', 'Gauraha',   'Teknikringen 33, 114 28 Stockholm',  '+46-70-0000004'), -- id 4
  ('19930520-7890', 'Brian',    'Nguyen',    'Brinellvagen 8, 114 28 Stockholm',    '+46-70-0000005'), -- id 5
  ('19981111-1111', 'Adam',     'Svensson',  'Osquars backe 12, 114 28 Stockholm',  '+46-70-0000006'), -- id 6
  ('19740202-2222', 'Sara', 'Johansson',  'Lindstedtsvagen 5, 114 28 Stockholm', '+46-70-0000007'), -- id 7
  ('19881120-3333', 'Olof', 'Pettersson', 'Brinellvagen 20, 114 28 Stockholm',   '+46-70-0000008'), -- id 8
  ('19970214-4444', 'Maja', 'Ek',         'Teknikringen 50, 114 28 Stockholm',   '+46-70-0000009'); -- id 9

INSERT INTO department (department_name, manager_employee_id) VALUES
  ('Mathematics', 1),
  ('Technology',  1);

INSERT INTO employee (person_id, supervisor_employee_id, job_title_id, department_id) VALUES
  (1, NULL, 1, 2), -- Fadil, Boss, Technology, no supervisor, not allocated anywhere
  (2, 1,    3, 2), -- Paris Carbone, Associate Professor, supervisor Fadil, Technology
  (3, 2,    4, 1), -- Leif Lindback, Lecturer, supervisor Paris, Mathematics
  (4, 2,    4, 2), -- Niharika Gauraha, Lecturer, supervisor Paris, Technology
  (5, 3,    6, 1), -- Brian Nguyen, PhD Student, supervisor Leif, Mathematics
  (6, 3,    5, 1), -- Adam Svensson, Teaching Assistant, supervisor Leif, Mathematics
  (7, 2,    2, 1), -- Sara, Professor, Mathematics, supervisor Paris
  (8, 7,    4, 1), -- Olof, Lecturer, Mathematics, supervisor Sara
  (9, 2,    5, 2); -- Maja, TA, Technology, supervisor Paris

INSERT INTO salary (employee_id, salary_date, salary) VALUES
  (1, '2025-01-31', 500.00), -- Fadil
  (2, '2025-01-31', 450.00), -- Paris
  (3, '2025-01-31', 400.00), -- Leif
  (4, '2025-01-31', 400.00), -- Niharika
  (5, '2025-01-31', 250.00), -- Brian
  (6, '2025-01-31', 220.00), -- Adam
  (7, '2025-01-31', 480.00),
  (8, '2025-01-31', 390.00),
  (9, '2025-01-31', 230.00),

  (1, '2025-05-28', 550.00),
  (2, '2025-06-20', 460.00),
  (3, '2025-04-28', 420.00),
  (4, '2025-05-21', 420.00),
  (5, '2025-05-22', 260.00),
  (6, '2025-05-24', 230.00),
  (7, '2025-02-28', 490.00),
  (8, '2025-02-28', 395.00),
  (9, '2025-02-28', 235.00);

INSERT INTO skill (skill_description) VALUES
  ('Database Systems'),     -- id 1
  ('Functional Programming'), -- id 2
  ('Discrete Mathematics'), -- id 3
  ('Algorithms'),           -- id 4
  ('Teaching Support');     -- id 5

INSERT INTO skill_set (employee_id, skill_id) VALUES
  (2, 1), (2, 2),           -- Paris
  (3, 3), (3, 4),           -- Leif
  (4, 1), (4, 4),           -- Niharika
  (5, 3),                   -- Brian
  (6, 5),                   -- Adam
  (7, 3), (7, 4),  -- Sara: Discrete Math, Algorithms
  (8, 1), (8, 3),  -- Olof: Database Systems, Discrete Math
  (9, 5);          -- Maja: Teaching Support

INSERT INTO study_period (period_name, period_start_date, period_end_date) VALUES
  ('P1', '2025-01-15', '2025-03-20'), -- id 1
  ('P2', '2025-03-21', '2025-06-01'), -- id 2
  ('P3', '2025-08-25', '2025-10-25'), -- id 3
  ('P4', '2025-10-26', '2025-12-22'); -- id 4

INSERT INTO course_layout (course_code, course_name, version, hp, min_students, max_students) VALUES
  ('IV1351', 'Data Storage Paradigms',             1, 7.5, 50, 250), -- id 1
  ('IX1500', 'Discrete Mathematics',               1, 7.5, 50, 150), -- id 2
  ('ID2214', 'Algorithms and Data Structures',     1, 7.5, 40, 200), -- id 3
  ('SF1624', 'Algebra and Geometry',               1, 7.5, 60, 250), -- id 4
  ('DD1310', 'Programming Techniques',             1, 7.5, 80, 300); -- id 5

INSERT INTO teaching_activity (activity_name, factor) VALUES
  ('Lecture',         3.60000), -- id 1
  ('Lab',             2.40000), -- id 2
  ('Tutorial',        2.40000), -- id 3
  ('Seminar',         1.80000), -- id 4
  ('Other Overhead',  1.00000), -- id 5
  ('Admin',           1.00000), -- id 6
  ('Exam',            1.00000); -- id 7

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-50273', 200, 1, 2025, 2), -- IV1351, P2 2025
  ('2025-50413', 150, 2, 2025, 1), -- IX1500, P1 2025
  ('2025-50341',  80, 3, 2025, 2), -- ID2214, P2 2025
  ('2025-60104', 140, 4, 2025, 3), -- SF1624, P3 2025
  ('2025-60201', 180, 5, 2025, 4), -- DD1310, P4 2025
  ('2025-50399',  60, 3, 2025, 3); -- extra ID2214, P3 2025

INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
-- IV1351 (2025-50273, P2)
  ('2025-50273', 1, 40.0), -- Lecture
  ('2025-50273', 2, 50.0), -- Lab
  ('2025-50273', 3, 30.0), -- Tutorial
  ('2025-50273', 4, 24.0), -- Seminar
  ('2025-50273', 5, 40.0), -- Other Overhead
  ('2025-50273', 6, calc_admin_hours('2025-50273')), -- Admin (derived)
  ('2025-50273', 7, calc_exam_hours('2025-50273')), -- Exam  (derived)

  -- IX1500 (2025-50413, P1)
  ('2025-50413', 1, 36.0), -- Lecture
  ('2025-50413', 3, 32.0), -- Tutorial
  ('2025-50413', 5, 20.0), -- Other Overhead
  ('2025-50413', 6, calc_admin_hours('2025-50413')), -- Admin (derived)
  ('2025-50413', 7, calc_exam_hours('2025-50413')), -- Exam  (derived)

  -- ID2214 (2025-50341, P2)
  ('2025-50341', 1, 24.0), -- Lecture
  ('2025-50341', 2, 24.0), -- Lab
  ('2025-50341', 3, 24.0), -- Tutorial
  ('2025-50341', 5, 16.0), -- Other Overhead
  ('2025-50341', 6, calc_admin_hours('2025-50341')), -- Admin (derived)
  ('2025-50341', 7, calc_exam_hours('2025-50341')), -- Exam  (derived)

  -- SF1624 (2025-60104, P3)
  ('2025-60104', 1, 40.0), -- Lecture
  ('2025-60104', 4, 10.0), -- Seminar
  ('2025-60104', 5, 20.0), -- Other Overhead
  ('2025-60104', 6, calc_admin_hours('2025-60104')), -- Admin (derived)
  ('2025-60104', 7, calc_exam_hours('2025-60104')), -- Exam  (derived)

  -- ID2214 extra (2025-50399, P3)
  ('2025-50399', 1, 12.0), -- Lecture
  ('2025-50399', 2, 30.0), -- Lab
  ('2025-50399', 3, 18.0), -- Tutorial
  ('2025-50399', 5, 12.0), -- Other Overhead
  ('2025-50399', 6, calc_admin_hours('2025-50399')), -- Admin (derived)
  ('2025-50399', 7, calc_exam_hours('2025-50399')), -- Exam  (derived)

  -- DD1310 (2025-60201, P4)
  ('2025-60201', 1, 24.0), -- Lecture
  ('2025-60201', 2, 24.0), -- Lab
  ('2025-60201', 3, 16.0), -- Tutorial
  ('2025-60201', 5, 24.0), -- Other Overhead
  ('2025-60201', 6, calc_admin_hours('2025-60201')), -- Admin (derived)
  ('2025-60201', 7, calc_exam_hours('2025-60201')); -- Exam  (derived)

INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  -- IV1351 (2025-50273, P2 2025)
  ('2025-50273', 1, 2, 25.0), -- Paris, Lecture
  ('2025-50273', 1, 4, 15.0), -- Niharika, Lecture
  ('2025-50273', 2, 5, 60.0), -- Brian, Lab
  ('2025-50273', 3, 4, 15.0), -- Niharika, Tutorial
  ('2025-50273', 3, 6, 10.0), -- Adam, Tutorial
  ('2025-50273', 4, 2, 20.0), -- Paris, Seminar
  ('2025-50273', 5, 2, 20.0), -- Paris, Overhead
  ('2025-50273', 5, 4, 30.0), -- Niharika, Overhead
  ('2025-50273', 6, 2, 30.0), -- Paris, Admin
  ('2025-50273', 7, 3, 60.0),  -- Leif, Exam


  -- IX1500 (2025-50413, P1 2025)
  ('2025-50413', 1, 3, 40.0), -- Leif, Lecture
  ('2025-50413', 3, 6, 10.0), -- Adam, Tutorial
  ('2025-50413', 3, 5, 10.0), -- Brian, Tutorial
  ('2025-50413', 5, 3, 15.0), -- Leif, Overhead
  ('2025-50413', 5, 6, 10.0), -- Adam, Overhead
  ('2025-50413', 6, 3, 10),  -- Leif, Admin
  ('2025-50413', 7, 3, 140),  -- Leif, Exam


  -- ID2214 (2025-50341, P2 2025)
  ('2025-50341', 1, 2, 10.0), -- Paris, Lecture
  ('2025-50341', 2, 5, 24.0), -- Brian, Lab
  ('2025-50341', 3, 4, 30.0), -- Niharika, Tutorial
  ('2025-50341', 5, 2, 18.0), -- Paris, Overhead
  ('2025-50341', 6, 2, 10.5),  -- Paris, Admin
  ('2025-50341', 7, 4, 20.0),  -- Niharika, Exam


  -- SF1624 (2025-60104, P3 2025)
  ('2025-60104', 1, 7, 10.0), -- Sara, Lecture
  ('2025-60104', 1, 8,  8.0), -- Olof, Lecture
  ('2025-60104', 4, 8, 10.0), -- Olof, Seminar
  ('2025-60104', 4, 3, 10.0), -- Leif, Seminar
  ('2025-60104', 5, 7, 20.0), -- Sara, Overhead
  ('2025-60104', 6, 7, 10.0),  -- Sara, Admin
  ('2025-60104', 7, 3, 30.0),  -- Leif, Exam


  -- ID2214 extra (2025-50399, P3 2025)
  ('2025-50399', 1, 3, 15.0), -- Leif, Lecture
  ('2025-50399', 2, 5, 20.0), -- Brian, Lab
  ('2025-50399', 3, 6, 10.0), -- Adam, Tutorial
  ('2025-50399', 5, 3, 12.0), -- Leif, Overhead
  ('2025-50399', 6, 7, 42.0),  -- Sara, Admin
  ('2025-50399', 7, 3, 100.0),  -- Leif, Exam


  -- DD1310 (2025-60201, P4 2025)
  ('2025-60201', 1, 2, 15.0), -- Paris, Lecture
  ('2025-60201', 1, 4, 12.0), -- Niharika, Lecture
  ('2025-60201', 2, 5, 18.0), -- Brian, Lab
  ('2025-60201', 3, 6,  8.0), -- Adam, Tutorial
  ('2025-60201', 3, 9,  8.0), -- Maja, Tutorial
  ('2025-60201', 5, 2, 30.0), -- Paris, Overhead
  ('2025-60201', 6, 4, 10.5),  -- Niharika, Admin
  ('2025-60201', 7, 2, 300.0);  -- Paris, Exam
         

COMMIT;
