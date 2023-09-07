SELECT DISTINCT subject_name
FROM student_grades sg
JOIN subjects s ON sg.subject_id = s.subject_id
WHERE sg.student_id = 1
