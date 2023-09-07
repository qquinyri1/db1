SELECT AVG(grade) as avg_grade
FROM student_grades sg
JOIN subjects s ON sg.subject_id = s.subject_id
WHERE s.teacher_id = 2
