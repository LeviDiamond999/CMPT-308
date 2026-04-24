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

