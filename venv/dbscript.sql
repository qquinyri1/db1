CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE IF NOT EXISTS groups (
    group_id INTEGER PRIMARY KEY,
    group_name TEXT
);

CREATE TABLE IF NOT EXISTS teachers (
    teacher_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE IF NOT EXISTS subjects (
    subject_id INTEGER PRIMARY KEY,
    subject_name TEXT,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id)
);

CREATE TABLE IF NOT EXISTS student_grades (
    grade_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    grade INTEGER,
    grade_date DATE,
    FOREIGN KEY (student_id) REFERENCES students (student_id),
        FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);