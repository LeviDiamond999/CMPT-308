DROP TABLE IF EXISTS lab8_enrollment_audit;
DROP TABLE IF EXISTS lab8_enrollments;
DROP TABLE IF EXISTS lab8_courses;
DROP TABLE IF EXISTS lab8_students;

CREATE TABLE lab8_students (
  student_id INT PRIMARY KEY,
  student_name TEXT NOT NULL
);

CREATE TABLE lab8_courses (
  course_id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  capacity INT NOT NULL CHECK (capacity > 0),
  enrolled_count INT NOT NULL DEFAULT 0 CHECK (enrolled_count >= 0 AND enrolled_count <= capacity)
);

CREATE TABLE lab8_enrollments (
  student_id INT NOT NULL REFERENCES lab8_students(student_id),
  course_id TEXT NOT NULL REFERENCES lab8_courses(course_id),
  enrolled_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (student_id, course_id)
);

CREATE TABLE lab8_enrollment_audit (
  audit_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  action_type TEXT NOT NULL,
  student_id INT NOT NULL,
  course_id TEXT NOT NULL,
  action_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Adding 4 Students
INSERT INTO lab8_students (student_id, student_name) VALUES
(101, 'Alice Johnson'),
(102, 'Bob Smith'),
(103, 'Charlie Davis'),
(104, 'Diana Prince');

-- Adding 3 Courses
INSERT INTO lab8_courses (course_id, title, capacity, enrolled_count) VALUES
('CS101', 'Intro to Computer Science', 30, 0),
('HIS202', 'World History', 15, 0),
('ALC303', 'Advanced Alchemy', 2, 0);

-- Creating Roles
CREATE ROLE advisor_role WITH LOGIN PASSWORD 'iLUVdata';
CREATE ROLE registrar_role WITH LOGIN PASSWORD 'LLCodd';

-- Giving accses to certain roles
GRANT SELECT ON lab8_students TO advisor_role
GRANT SELECT ON lab8_courses TO advisor_role
GRANT SELECT ON lab8_enrollments TO advisor_role

GRANT SELECT ON lab8_students TO registrar_role
GRANT SELECT ON lab8_courses TO registrar_role
GRANT SELECT ON lab8_enrollments TO registrar_role

GRANT INSERT ON lab8_enrollments TO registrar_role

GRANT UPDATE ON lab8_enrollments TO registrar_role

REVOKE DELETE ON lab8_enrollments FROM registrar_role

-- Creating Procedures
CREATE OR REPLACE PROCEDURE register_student(p_student_id INT, p_course_id TEXT)
LANGUAGE plpgsql AS $$
DECLARE
    v_capacity      INT;
    v_enrolled      INT;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM lab8_students WHERE student_id = p_student_id) THEN
        RAISE EXCEPTION 'Student % does not exist.', p_student_id;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM lab8_courses WHERE course_id = p_course_id) THEN
        RAISE EXCEPTION 'Course % does not exist.', p_course_id;
    END IF;

    IF EXISTS (
        SELECT 1 FROM lab8_enrollments
        WHERE student_id = p_student_id AND course_id = p_course_id
    ) THEN
        RAISE EXCEPTION 'Student % is already enrolled in course %.', p_student_id, p_course_id;
    END IF;

    SELECT capacity, enrolled_count INTO v_capacity, v_enrolled
    FROM lab8_courses WHERE course_id = p_course_id;

    IF v_enrolled >= v_capacity THEN
        RAISE EXCEPTION 'Course % has reached max capacity.', p_course_id;
    END IF;

    INSERT INTO lab8_enrollments(student_id, course_id)
    VALUES (p_student_id, p_course_id);

    UPDATE lab8_courses
    SET enrolled_count = enrolled_count + 1
    WHERE course_id = p_course_id;

END;
$$;

-- Testing Procedures
CALL register_student(101, 'CS101');

CALL register_student(101, 'CS101');

CALL register_student(999, 'CS101');

-- Creating Triggers
CREATE OR REPLACE FUNCTION log_enrollment()
RETURNS TRIGGER
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO lab8_enrollment_audit(action_type, student_id, course_id, action_time)
    VALUES ('ENROLLED', NEW.student_id, NEW.course_id, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$

CREATE TRIGGER enrollment_audit_trigger
AFTER INSERT
ON lab8_enrollments
FOR EACH ROW
EXECUTE FUNCTION log_enrollment();

-- Testing and Querying the Audit table
CALL register_student(104, 'CS101')

SELECT * FROM lab8_enrollment_audit;

-- Part D
SELECT s.student_name, c.course_id , c.title, enrolled_at FROM lab8_students s
JOIN lab8_enrollments e ON e.student_id = s.student_id
JOIN lab8_courses c ON c.course_id = e.course_id;

Select * from lab8_courses 

SELECT * FROM lab8_enrollment_audit 
ORDER BY action_time ASC

SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN ('advisor_role', 'registrar_role')
AND table_name LIKE 'lab8_%'


