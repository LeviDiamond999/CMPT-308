Insert into courses VALUES(435, 'ALGORITHIMS', 3);

Select s.name 
from students s
Where student_id IN(
	select student_id 
	from enrollments 
	Where course_id = 308 AND term = 'SPRNG2026')

Select c.course_id, c.title 
from courses c
Where EXISTS (select 1
	From enrollments e
	Where e.term = 'SPRNG2026')

Select s.name, s.student_id 
from students s
Where s.student_id IN(
	select e.student_id
	from enrollments e 
	group by e.student_id
	Having count(e.student_id) > 1)

Select student_id, name
From Students
Where major = 'DS'
UNION
Select student_id, name
From Students
Where major = 'CS'

Select student_id, name, major
From Students
Where major = 'DS'
UNION
Select student_id, name, major
From Students
Where major = 'CS'

Select s.student_id, s.name
from students s
Where major = 'CS'
EXCEPT
Select s.student_id, s.name
from students s
Left Join enrollments e
on s.student_id = e.student_id
Where term = 'SPRNG2026' AND e.course_id = 308
