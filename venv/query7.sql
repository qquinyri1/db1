SELECT s.first_name, s.last_name, sg.grade
FROM students s
JOIN student_grades sg ON s.student_id = sg.student_id
WHERE s.student_id = 1 AND sg.subject_id = 1
