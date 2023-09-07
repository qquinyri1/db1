SELECT s.first_name, s.last_name, AVG(g.grade) as avg_grade
FROM students s
JOIN student_grades g ON s.student_id = g.student_id
WHERE g.subject_id = 1
GROUP BY s.student_id
ORDER BY avg_grade DESC
LIMIT 1
