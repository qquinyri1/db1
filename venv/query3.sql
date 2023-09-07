SELECT g.group_name, AVG(sg.grade) as avg_grade
FROM student_grades sg
JOIN students s ON sg.student_id = s.student_id
JOIN groups g ON s.student_id = g.group_id
WHERE sg.subject_id = 1
GROUP BY g.group_id
ORDER BY avg_grade DESC
