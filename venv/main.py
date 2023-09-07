import sqlite3
from faker import Faker
import random
import datetime

fake = Faker()

def create_and_connect_to_db():
    with open('venv\dbscript.sql', 'r') as fh:
        sql = fh.read()
        return sql
    
def insert_data(conn):
    cursor = conn.cursor()

    group_names = ['Group A', 'Group B', 'Group C']
    for group_name in group_names:
        cursor.execute("INSERT INTO groups (group_name) VALUES (?)", (group_name,))

    for _ in range(random.randint(30, 50)):
        cursor.execute("INSERT INTO students (first_name, last_name) VALUES (?, ?)", (fake.first_name(), fake.last_name()))

    for _ in range(random.randint(5, 8)):
        cursor.execute("INSERT INTO teachers (first_name, last_name) VALUES (?, ?)", (fake.first_name(), fake.last_name()))

    subject_names = [fake.word() for _ in range(random.randint(5, 8))]
    for subject_name in subject_names:
        teacher_id = random.randint(1, len(group_names))
        cursor.execute("INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)", (subject_name, teacher_id))

    for student_id in range(1, random.randint(30, 50) + 1):
        for subject_id in range(1, len(subject_names) + 1):
            cursor.execute("INSERT INTO student_grades (student_id, subject_id, grade, grade_date) VALUES (?, ?, ?, ?)",
                           (student_id, subject_id, random.randint(2, 5), fake.date_between(start_date='-1y', end_date='today')))
    
    conn.commit()

def execute_query(conn):
    cur = conn.cursor()
    for i in range(1,11):
        path = f'venv\query{i}.sql'
        with open(path, 'r') as fh:
            sql = fh.read()
            cur.execute(sql)
            print(f'query {i}:{cur.fetchall()}')

        if i == 10: return
    
if __name__ == '__main__':
    with sqlite3.connect('school.db') as conn:
        cur = conn.cursor()
        cur.executescript(create_and_connect_to_db())
        insert_data(conn)
        execute_query(conn)


