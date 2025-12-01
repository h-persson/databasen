CREATE TABLE constants (
 constant_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 constant_description VARCHAR(200) NOT NULL,
 constant_value DECIMAL(10,5) NOT NULL
);


CREATE TABLE course_layout (
 course_layout_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 course_code VARCHAR(100) NOT NULL,
 course_name VARCHAR(500) NOT NULL,
 version INT NOT NULL,
 hp DECIMAL(6, 3) NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL
);


CREATE TABLE department (
 department_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 department_name VARCHAR(500) NOT NULL UNIQUE,
 manager_employee_id INT NOT NULL
);


CREATE TABLE job_title (
 job_title_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 job_title VARCHAR(200) NOT NULL UNIQUE
);


CREATE TABLE person (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 personal_number VARCHAR(50) NOT NULL UNIQUE,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 address VARCHAR(100) NOT NULL,
 phone_number VARCHAR(100) NOT NULL
);


CREATE TABLE employee (
 employee_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 person_id INT NOT NULL UNIQUE,
 supervisor_employee_id INT,
 job_title_id INT NOT NULL,
 department_id INT NOT NULL,

 FOREIGN KEY (person_id) REFERENCES person (person_id),
 FOREIGN KEY (supervisor_employee_id) REFERENCES employee (employee_id),
 FOREIGN KEY (job_title_id) REFERENCES job_title (job_title_id),
 FOREIGN KEY (department_id) REFERENCES department (department_id)
);


CREATE TABLE salary (
 employee_id INT NOT NULL,
 salary_date DATE NOT NULL,
 salary DECIMAL(10,2) NOT NULL,

 PRIMARY KEY (employee_id,salary_date),

 FOREIGN KEY (employee_id) REFERENCES employee (employee_id) ON DELETE CASCADE
);


CREATE TABLE skill (
 skill_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 skill_description VARCHAR(500) NOT NULL
);


CREATE TABLE skill_set (
 employee_id INT NOT NULL,
 skill_id INT NOT NULL,

 PRIMARY KEY (employee_id,skill_id),

 FOREIGN KEY (employee_id) REFERENCES employee (employee_id) ON DELETE CASCADE,
 FOREIGN KEY (skill_id) REFERENCES skill (skill_id)
);


CREATE TABLE study_period (
 study_period_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 period_name VARCHAR(50) NOT NULL,
 period_start_date DATE NOT NULL,
 period_end_date DATE NOT NULL
);


CREATE TABLE teaching_activity (
 teaching_activity_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 activity_name VARCHAR(200) NOT NULL,
 factor DECIMAL(10, 5) DEFAULT 1 NOT NULL
);


CREATE TABLE course_instance (
 course_instance_id VARCHAR(100) NOT NULL PRIMARY KEY,
 num_students INT NOT NULL,
 course_layout_id INT NOT NULL,
 study_year INT NOT NULL,
 study_period_id INT NOT NULL,

 FOREIGN KEY (course_layout_id) REFERENCES course_layout (course_layout_id),
 FOREIGN KEY (study_period_id) REFERENCES study_period (study_period_id)
);


CREATE TABLE planned_activity (
 course_instance_id VARCHAR(100) NOT NULL,
 teaching_activity_id INT NOT NULL,
 planned_hours DECIMAL(10, 5) NOT NULL,

 PRIMARY KEY (course_instance_id,teaching_activity_id),

 FOREIGN KEY (course_instance_id) REFERENCES course_instance (course_instance_id),
 FOREIGN KEY (teaching_activity_id) REFERENCES teaching_activity (teaching_activity_id)
);


CREATE TABLE allocation (
 course_instance_id VARCHAR(100) NOT NULL,
 teaching_activity_id INT NOT NULL,
 employee_id INT NOT NULL,
 allocated_hours DECIMAL(10, 5) NOT NULL,

 PRIMARY KEY (course_instance_id,teaching_activity_id,employee_id),

 FOREIGN KEY (course_instance_id,teaching_activity_id) REFERENCES planned_activity (course_instance_id,teaching_activity_id),
 FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);


ALTER TABLE department 
ADD FOREIGN KEY (manager_employee_id) 
REFERENCES employee (employee_id) 
DEFERRABLE INITIALLY DEFERRED;


CREATE OR REPLACE FUNCTION check_max_courses_per_period()
RETURNS trigger AS
$$
DECLARE
    max_courses_per_period integer;
    current_courses integer;
    v_study_period_id int;
    v_study_year int;
    already_has_course boolean;
BEGIN
    -- get constant value
    SELECT constant_value::int
    INTO max_courses_per_period
    FROM constants
    WHERE constant_description = 'max_courses_per_period';

    IF max_courses_per_period IS NULL THEN
        RAISE EXCEPTION 'Constant max_courses_per_period saknas i constants-tabellen';
    END IF;

    -- get period + year for the course on the row
    SELECT study_period_id, study_year
    INTO v_study_period_id, v_study_year
    FROM course_instance
    WHERE course_instance_id = NEW.course_instance_id;

    IF v_study_period_id IS NULL THEN
        RAISE EXCEPTION 'course_instance % does not exist', NEW.course_instance_id;
    END IF;

    -- check if employee already has this course
    SELECT EXISTS (
        SELECT 1
        FROM allocation a
        WHERE a.employee_id = NEW.employee_id
          AND a.course_instance_id = NEW.course_instance_id
    )
    INTO already_has_course;

    -- count current distinct courses with same period + year
    SELECT COUNT(DISTINCT a.course_instance_id)
    INTO current_courses
    FROM allocation a
    JOIN course_instance ci ON ci.course_instance_id = a.course_instance_id
    WHERE a.employee_id = NEW.employee_id
      AND ci.study_period_id = v_study_period_id
      AND ci.study_year     = v_study_year;

    -- if it is a new course for this employee in this period its +1
    IF NOT already_has_course THEN
        current_courses := current_courses + 1;
    END IF;

    -- validate
    IF current_courses > max_courses_per_period THEN
        RAISE EXCEPTION
            'Employee % can only have a maximum of % courses per period, would have been % in year % period %',
            NEW.employee_id,
            max_courses_per_period,
            current_courses,
            v_study_year,
            v_study_period_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_check_max_courses_per_period
BEFORE INSERT OR UPDATE ON allocation
FOR EACH ROW
EXECUTE FUNCTION check_max_courses_per_period();


CREATE OR REPLACE FUNCTION calc_exam_hours(p_course_instance_id varchar)
RETURNS numeric AS
$$
  SELECT
      c_base.constant_value
    + c_factor.constant_value * ci.num_students
  FROM course_instance ci
  JOIN constants c_base
    ON c_base.constant_description   = 'exam_base_hours'
  JOIN constants c_factor
    ON c_factor.constant_description = 'exam_student_factor'
  WHERE ci.course_instance_id = p_course_instance_id;
$$ LANGUAGE sql STABLE;


CREATE OR REPLACE FUNCTION calc_admin_hours(p_course_instance_id varchar)
RETURNS numeric AS
$$
  SELECT
      c_hp.constant_value   * cl.hp
    + c_base.constant_value
    + c_stud.constant_value * ci.num_students
  FROM course_instance ci
  JOIN course_layout cl
    ON cl.course_layout_id = ci.course_layout_id
  JOIN constants c_hp
    ON c_hp.constant_description   = 'admin_hp_factor'
  JOIN constants c_base
    ON c_base.constant_description = 'admin_base_hours'
  JOIN constants c_stud
    ON c_stud.constant_description = 'admin_student_factor'
  WHERE ci.course_instance_id = p_course_instance_id;
$$ LANGUAGE sql STABLE;
