INSERT INTO Students (student_id, name, major, class_year) VALUES
(201, 'James', 'CS', 2028),(202, 'Maria', 'Biology', 2028),(203, 'Robert', 'Physics', 2025),
(204, 'Linda', 'Math', 2028),(205, 'Michael', 'Engin.', 2026),(206, 'Elizabeth', 'Psych', 2028),
(207, 'David', 'History', 2027),(208, 'Jennifer', 'CS', 2028),(209, 'William', 'Chemistry', 2025),
(210, 'Barbara', 'Biology', 2028),(211, 'Richard', 'Economics', 2026),(212, 'Susan', 'Art', 2028),
(213, 'Joseph', 'Physics', 2027),(214, 'Jessica', 'CS', 2028),(215, 'Thomas', 'Math', 2025),
(216, 'Sarah', 'Psych', 2028),(217, 'Charles', 'Engin.', 2026),(218, 'Karen', 'Biology', 2028),
(219, 'Chris', 'History', 2027),(320, 'Nancy', 'CS', 2028),(221, 'Matthew', 'Philos.', 2025),
(222, 'Lisa', 'Chemistry', 2028),(223, 'Daniel', 'Physics', 2026),(224, 'Betty', 'Math', 2028),
(225, 'Anthony', 'Engin.', 2027),(226, 'Margaret', 'Art', 2028),(227, 'Mark', 'Biology', 2025),
(228, 'Sandra', 'CS', 2028),(229, 'Donald', 'Economics', 2026),(230, 'Ashley', 'Psych', 2028),
(231, 'Steven', 'Math', 2027),(232, 'Kimberly', 'Physics', 2028),(233, 'Paul', 'History', 2025),
(234, 'Emily', 'Engin.', 2028),(235, 'Andrew', 'CS', 2026),(236, 'Donna', 'Biology', 2028),
(237, 'Joshua', 'Chemistry', 2027),(238, 'Michelle', 'Art', 2028),(239, 'Kenneth', 'Economics', 2025),
(240, 'Laura', 'Philos.', 2028),(241, 'Kevin', 'CS', 2026),(242, 'Amanda', 'Biology', 2028),
(243, 'Brian', 'Math', 2027),(244, 'Stephanie', 'Psych', 2028),(245, 'Edward', 'Engin.', 2025),
(246, 'Rebecca', 'Physics', 2028),(247, 'Ronald', 'History', 2026),(248, 'Sharon', 'CS', 2028),
(249, 'Timothy', 'Chemistry', 2027),(250, 'Cynthia', 'Biology', 2028),(251, 'Jason', 'Economics', 2025),
(252, 'Kathleen', 'Art', 2028),(253, 'Jeffrey', 'Physics', 2026),(254, 'Amy', 'CS', 2028),
(255, 'Gary', 'Math', 2027),(256, 'Shirley', 'Psych', 2028),(257, 'Ryan', 'Engin.', 2025),
(258, 'Angela', 'Biology', 2028),(259, 'Nicholas', 'History', 2026),(260, 'Anna', 'CS', 2028),
(261, 'Eric', 'Philos.', 2027),(262, 'Brenda', 'Chemistry', 2028),(263, 'Stephen', 'Physics', 2025),
(264, 'Pamela', 'Math', 2028),(265, 'Gregory', 'Engin.', 2026),(266, 'Nicole', 'Art', 2028),
(267, 'Justin', 'Biology', 2027),(268, 'Emma', 'CS', 2028),(269, 'Raymond', 'Economics', 2025),
(270, 'Helen', 'Psych', 2028),(271, 'Jack', 'Math', 2026),(272, 'Debra', 'Physics', 2028),
(273, 'Dennis', 'History', 2027),(274, 'Alice', 'Engin.', 2028),(275, 'Jerry', 'CS', 2025),
(276, 'Rachel', 'Biology', 2028),(277, 'Tyler', 'Chemistry', 2026),(278, 'Heather', 'Art', 2028),
(279, 'Aaron', 'Economics', 2027),(280, 'Diane', 'Philos.', 2028),(281, 'Henry', 'CS', 2025),(282, 'Julie', 'Biology', 2028),
(283, 'Douglas', 'Math', 2026),(284, 'Joyce', 'Psych', 2028),(285, 'Peter', 'Engin.', 2027),
(286, 'Evelyn', 'Physics', 2028),(287, 'Adam', 'History', 2025),(288, 'Joan', 'CS', 2028),
(289, 'Nathan', 'Chemistry', 2026),(290, 'Kelly', 'Biology', 2028),(291, 'Zachary', 'Economics', 2027),
(292, 'Christina', 'Art', 2028),(293, 'Walter', 'Physics', 2025),(294, 'Lauren', 'CS', 2028),
(295, 'Kyle', 'Math', 2026),(296, 'Martha', 'Psych', 2028),(297, 'Harold', 'Engin.', 2027),(298, 'Judith', 'Biology', 2028),
(299, 'Jeremy', 'History', 2025),(300, 'Megan', 'CS', 2028);

INSERT INTO enrollments (student_id, course_id, term, grade) VALUES
(201, 308, 'FALL2023', 'A'), (201, 101, 'SPRNG2024', '+B'),(202, 220, 'FALL2025', 'B'), (202, 300, 'SPRNG2026', '-A'),
(203, 300, 'FALL2023', '+C'), (203, 435, 'SPRNG2024', 'B'),(204, 101, 'FALL2025', 'A'), (204, 210, 'SPRNG2026', 'A'),
(205, 435, 'FALL2023', '-B'), (205, 308, 'SPRNG2024', 'C'),(206, 210, 'FALL2025', '-A'), (206, 220, 'SPRNG2026', '+B'),
(207, 308, 'FALL2023', 'B'), (207, 101, 'SPRNG2024', 'A'),(208, 220, 'FALL2025', 'A'), (208, 300, 'SPRNG2026', '-B'),
(209, 300, 'FALL2023', 'C'), (209, 435, 'SPRNG2024', '+B'),(210, 101, 'FALL2025', '+B'), (210, 210, 'SPRNG2026', '-A'),
(211, 435, 'FALL2024', 'A'), (211, 308, 'SPRNG2025', 'B'),(212, 210, 'FALL2023', '+C'), (212, 220, 'SPRNG2024', 'A'),
(213, 308, 'FALL2025', '-B'), (213, 101, 'SPRNG2026', 'C'),(214, 220, 'FALL2024', '-A'), (214, 300, 'SPRNG2025', '+B'),
(215, 300, 'FALL2023', 'B'), (215, 435, 'SPRNG2024', 'A'),(216, 101, 'FALL2025', 'A'), (216, 210, 'SPRNG2026', '-B'),
(217, 435, 'FALL2024', 'C'), (217, 308, 'SPRNG2025', '+B'),(218, 210, 'FALL2023', '+B'), (218, 220, 'SPRNG2024', '-A'),
(219, 308, 'FALL2025', 'A'), (219, 101, 'SPRNG2026', 'B'),(220, 220, 'FALL2024', '+C'), (220, 300, 'SPRNG2025', 'A'),
(221, 300, 'FALL2023', '-B'), (221, 435, 'SPRNG2024', 'C'),(222, 101, 'FALL2025', '-A'), (222, 210, 'SPRNG2026', '+B'),
(223, 435, 'FALL2024', 'B'), (223, 308, 'SPRNG2025', 'A'),(224, 210, 'FALL2023', 'A'), (224, 220, 'SPRNG2024', '-B'),
(225, 308, 'FALL2025', 'C'), (225, 101, 'SPRNG2026', '+B'),(226, 220, 'FALL2024', '+B'), (226, 300, 'SPRNG2025', '-A'),
(227, 300, 'FALL2023', 'A'), (227, 435, 'SPRNG2024', 'B'),(228, 101, 'FALL2025', '+C'), (228, 210, 'SPRNG2026', 'A'),
(229, 435, 'FALL2024', '-B'), (229, 308, 'SPRNG2025', 'C'),(230, 210, 'FALL2023', '-A'), (230, 220, 'SPRNG2024', '+B'),
(231, 308, 'FALL2025', 'B'), (231, 101, 'SPRNG2026', 'A'),(232, 220, 'FALL2024', 'A'), (232, 300, 'SPRNG2025', '-B'),
(233, 300, 'FALL2023', 'C'), (233, 435, 'SPRNG2024', '+B'),(234, 101, 'FALL2025', '+B'), (234, 210, 'SPRNG2026', '-A'),
(235, 435, 'FALL2024', 'A'), (235, 308, 'SPRNG2025', 'B'),(236, 210, 'FALL2023', '+C'), (236, 220, 'SPRNG2024', 'A'),
(237, 308, 'FALL2025', '-B'), (237, 101, 'SPRNG2026', 'C'),(238, 220, 'FALL2024', '-A'), (238, 300, 'SPRNG2025', '+B'),
(239, 300, 'FALL2023', 'B'), (239, 435, 'SPRNG2024', 'A'),(240, 101, 'FALL2025', 'A'), (240, 210, 'SPRNG2026', '-B'),
(241, 435, 'FALL2024', 'C'), (241, 308, 'SPRNG2025', '+B'),(242, 210, 'FALL2023', '+B'), (242, 220, 'SPRNG2024', '-A'),
(243, 308, 'FALL2025', 'A'), (243, 101, 'SPRNG2026', 'B'),(244, 220, 'FALL2024', '+C'), (244, 300, 'SPRNG2025', 'A'),
(245, 300, 'FALL2023', '-B'), (245, 435, 'SPRNG2024', 'C'),(246, 101, 'FALL2025', '-A'), (246, 210, 'SPRNG2026', '+B'),
(247, 435, 'FALL2024', 'B'), (247, 308, 'SPRNG2025', 'A'),(248, 210, 'FALL2023', 'A'), (248, 220, 'SPRNG2024', '-B'),
(249, 308, 'FALL2025', 'C'), (249, 101, 'SPRNG2026', '+B'),(250, 220, 'FALL2024', '+B'), (250, 300, 'SPRNG2025', '-A'),
(251, 300, 'FALL2023', 'A'), (251, 435, 'SPRNG2024', 'B'),(252, 101, 'FALL2025', '+C'), (252, 210, 'SPRNG2026', 'A'),
(253, 435, 'FALL2024', '-B'), (253, 308, 'SPRNG2025', 'C'),(254, 210, 'FALL2023', '-A'), (254, 220, 'SPRNG2024', '+B'),
(255, 308, 'FALL2025', 'B'), (255, 101, 'SPRNG2026', 'A'),(256, 220, 'FALL2024', 'A'), (256, 300, 'SPRNG2025', '-B'),
(257, 300, 'FALL2023', 'C'), (257, 435, 'SPRNG2024', '+B'),(258, 101, 'FALL2025', '+B'), (258, 210, 'SPRNG2026', '-A'),
(259, 435, 'FALL2024', 'A'), (259, 308, 'SPRNG2025', 'B'),(260, 210, 'FALL2023', '+C'), (260, 220, 'SPRNG2024', 'A'),
(261, 308, 'FALL2025', '-B'), (261, 101, 'SPRNG2026', 'C'),(262, 220, 'FALL2024', '-A'), (262, 300, 'SPRNG2025', '+B'),
(263, 300, 'FALL2023', 'B'), (263, 435, 'SPRNG2024', 'A'),(264, 101, 'FALL2025', 'A'), (264, 210, 'SPRNG2026', '-B'),
(265, 435, 'FALL2024', 'C'), (265, 308, 'SPRNG2025', '+B'),(266, 210, 'FALL2023', '+B'), (266, 220, 'SPRNG2024', '-A'),
(267, 308, 'FALL2025', 'A'), (267, 101, 'SPRNG2026', 'B'),(268, 220, 'FALL2024', '+C'), (268, 300, 'SPRNG2025', 'A'),
(269, 300, 'FALL2023', '-B'), (269, 435, 'SPRNG2024', 'C'),(270, 101, 'FALL2025', '-A'), (270, 210, 'SPRNG2026', '+B'),
(271, 435, 'FALL2024', 'B'), (271, 308, 'SPRNG2025', 'A'),(272, 210, 'FALL2023', 'A'), (272, 220, 'SPRNG2024', '-B'),
(273, 308, 'FALL2025', 'C'), (273, 101, 'SPRNG2026', '+B'),(274, 220, 'FALL2024', '+B'), (274, 300, 'SPRNG2025', '-A'),
(275, 300, 'FALL2023', 'A'), (275, 435, 'SPRNG2024', 'B'),(276, 101, 'FALL2025', '+C'), (276, 210, 'SPRNG2026', 'A'),
(277, 435, 'FALL2024', '-B'), (277, 308, 'SPRNG2025', 'C'),(278, 210, 'FALL2023', '-A'), (278, 220, 'SPRNG2024', '+B'),
(279, 308, 'FALL2025', 'B'), (279, 101, 'SPRNG2026', 'A'),(280, 220, 'FALL2024', 'A'), (280, 300, 'SPRNG2025', '-B'),
(281, 300, 'FALL2023', 'C'), (281, 435, 'SPRNG2024', '+B'),(282, 101, 'FALL2025', '+B'), (282, 210, 'SPRNG2026', '-A'),
(283, 435, 'FALL2024', 'A'), (283, 308, 'SPRNG2025', 'B'),(284, 210, 'FALL2023', '+C'), (284, 220, 'SPRNG2024', 'A'),
(285, 308, 'FALL2025', '-B'), (285, 101, 'SPRNG2026', 'C'),(286, 220, 'FALL2024', '-A'), (286, 300, 'SPRNG2025', '+B'),
(287, 300, 'FALL2023', 'B'), (287, 435, 'SPRNG2024', 'A'),(288, 101, 'FALL2025', 'A'), (288, 210, 'SPRNG2026', '-B'),
(289, 435, 'FALL2024', 'C'), (289, 308, 'SPRNG2025', '+B'),(290, 210, 'FALL2023', '+B'), (290, 220, 'SPRNG2024', '-A'),
(291, 308, 'FALL2025', 'A'), (291, 101, 'SPRNG2026', 'B'),(292, 220, 'FALL2024', '+C'), (292, 300, 'SPRNG2025', 'A'),
(293, 300, 'FALL2023', '-B'), (293, 435, 'SPRNG2024', 'C'),(294, 101, 'FALL2025', '-A'), (294, 210, 'SPRNG2026', '+B'),
(295, 435, 'FALL2024', 'B'), (295, 308, 'SPRNG2025', 'A'),(296, 210, 'FALL2023', 'A'), (296, 220, 'SPRNG2024', '-B'),
(297, 308, 'FALL2025', 'C'), (297, 101, 'SPRNG2026', '+B'),(298, 220, 'FALL2024', '+B'), (298, 300, 'SPRNG2025', '-A'),
(299, 300, 'FALL2023', 'A'), (299, 435, 'SPRNG2024', 'B'),(300, 101, 'FALL2025', '+C'), (300, 210, 'SPRNG2026', 'A');

EXPLAIN
SELECT *
FROM Enrollments
WHERE term = 'SPRNG2026' AND course_id = 308;

EXPLAIN
SELECT *
FROM Enrollments
WHERE term = 'SPRNG2026' AND student_id = 1001;

EXPLAIN
SELECT s.name, c.title, e.term
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id
WHERE e.term = 'SPRNG2026';

CREATE INDEX idx_enrollments_student_id on Enrollments(student_id);

CREATE INDEX idx_enrollments_course_id on Enrollments(course_id);

CREATE INDEX idx_students_name_major_classyear on Students(name, major, class_year);

EXPLAIN
SELECT *
FROM Enrollments
WHERE term = 'SPRNG2026' AND course_id = 308;

EXPLAIN
SELECT *
FROM Enrollments
WHERE term = 'SPRNG2026' AND student_id = 1001;

EXPLAIN
SELECT s.name, c.title, e.term
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id
WHERE e.term = 'SPRNG2026';

EXPLAIN
SELECT *
FROM Students
WHERE major = 'CS';
