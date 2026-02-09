CREATE TABLE Students (
 student_id INT PRIMARY KEY,
 name VARCHAR(200),
 major VARCHAR(10),
 class_year INT
);

CREATE TABLE Courses(
 course_id INT PRIMARY KEY,
 title VARCHAR(50),
 credits INT
);

INSERT INTO Students(student_id, name, major, class_year)
Values(516, 'Levi', 'DS', 2028),
(845, 'Saad', 'Math', 2028),
(917, 'Jiwesh', 'Business', 2027),
(220, 'Jack', 'CS', 2029),
(150, 'Jack', 'DS', 2026),
(890, 'Fateh', 'Business', 2028);

INSERT INTO Courses(course_id, title, credits)
Values(308, 'CMPTDBMS', 4 ),
(220, 'DATAINTRO', 4),
(300, 'DATAVIS', 3),
(101, 'PHIL', 3);

CREATE TABLE Enrollments(
 student_id INT,
 course_id INT,
 term VARCHAR(9),
 grade VARCHAR(2),
 PRIMARY KEY (student_id, course_id, term),
 FOREIGN KEY (student_id) REFERENCES Students(student_id),
 FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments (student_id, course_id, term, grade) VALUES
(516,308,'SPRNG2026','A'),
(845,220,'SPRNG2025','+B'),
(917,300,'FALL2025','-A'),
(220,101,'FALL2024','-B'),
(150,220,'SPRNG2025','B'),
(890,101,'FALL2024','A'),
(516,300,'SPRNG2026','-B'),
(845,308,'FALL2025','A'),
(150,300,'SPRNG2026','C');

INSERT INTO Enrollments (student_id, course_id, term, grade) VALUES
(890,308,'SPRNG2026',NULL),
(150,101,'SPRNG2025',NULL);

SELECT * FROM Students

SELECT * FROM Courses

SELECT * FROM Enrollments

Select student_id, name from Students

Select student_id, name from Students
Where major = 'DS'

Select title from Courses
Where credits >= 3

Select student_id, name from Students
Where name like '%J%'

Select * from Enrollments
Where grade is NULL

SELECT class_year,name FROM Students
ORDER BY class_year, name ASC


