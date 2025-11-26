
INSERT INTO job_title (job_title) VALUES 
('Professor'),
('Associate Professor'),
('Lecturer'),
('Postdoc'),
('PhD Student'),
('Teaching Assistant'),
('Administrator');

INSERT INTO skill (skill_description) VALUES 
('Java'),
('Python'),
('C'),
('Machine Learning'),
('Database Theory'),
('Calculus'),
('Linear Algebra'),
('Physics'),
('Industrial Management'),
('Accounting'),
('Academic Writing');

INSERT INTO teaching_activity (activity_name, factor, hp_factor, student_factor) VALUES 
('Lecture',             4.0, 0,   0),
('Seminar',             2.0, 0,   0),
('Lab Supervision',     1.5, 0,   0),
('Project Supervision', 1.0, 0,   0),
('Examination',         1.0, 0,   0.5),
('Course Admin',        1.0, 2.0, 0.1);

INSERT INTO study_period (period_name, period_start_date, period_end_date) VALUES 
('P1', '2025-08-26', '2025-10-24'),
('P2', '2025-10-27', '2025-01-12'),
('P3', '2026-01-15', '2026-03-14'),
('P4', '2026-03-16', '2026-06-05');

INSERT INTO limits (limit_description, limit_value) VALUES 
('Max courses per period', 4);

INSERT INTO department (department_name) VALUES 
('EECS'), ('SCI'), ('ITM');

INSERT INTO course_layout (course_code, course_name, min_students, max_students, hp, version) VALUES
('DD1337', 'Programming for Experts',       20, 100, 7.5, 1),
('DD2420', 'Probabilistic Graphical Models',10,  80, 7.5, 1),
('ID1018', 'Programming I',                 50, 250, 7.5, 1),
('IV1351', 'Data Storage Paradigms',        40, 200, 7.5, 1),
('SF1624', 'Algebra and Geometry',          50, 300, 7.5, 1),
('SF1625', 'Calculus in One Variable',      50, 300, 7.5, 1),
('SK1120', 'Physics 1',                     30, 150, 9.0, 1),
('ME1003', 'Industrial Management',         40, 250, 6.0, 1),
('ME2016', 'Project Management',            20, 100, 6.0, 1);

COMMIT;
