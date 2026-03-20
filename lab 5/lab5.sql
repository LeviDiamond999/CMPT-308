select s.student_id, s.name 
from Students s
Where s.student_id IN(
Select e.student_id 
from enrollments e
where term = 'SPRNG2026' and course_id = 308
)


select c.course_id, title 
from courses c 
where exists(
Select 1
from enrollments e
Where e.course_id = c.course_id
And e.term= 'SPRNG2026'
)


Select s.student_id, name 
from students s
where s.student_id NOT in (
Select e.student_id 
from enrollments e
where term='SPRNG2026'
)


Select e.student_id 
from enrollments e
where term='SPRNG2026' And course_id = 308
UNION
Select e.student_id 
from enrollments e
where term='SPRNG2026' And course_id = 220


Select e.student_id 
from enrollments e
where term='SPRNG2026' And course_id = 308
INTERSECT
Select e.student_id 
from enrollments e
where term='SPRNG2026' And course_id = 220


Select e.student_id 
from enrollments e
where term='SPRNG2026' And course_id = 308
EXCEPT
Select e.student_id 
from enrollments e
where term='SPRNG2026' And course_id = 220
