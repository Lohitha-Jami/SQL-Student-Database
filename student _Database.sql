-- Student Database Project - By Lohitha Jami

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    course VARCHAR(30)
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(30),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students VALUES
(1, 'Lohitha', 'Visakhapatnam', 'BCA'),
(2, 'Priya', 'Vizag', 'BCA'),
(3, 'Anitha', 'Hyderabad', 'BSc'),
(4, 'Sai', 'Vizag', 'BCA');

INSERT INTO marks VALUES
(1, 1, 'HTML', 95),
(2, 1, 'SQL', 90),
(3, 2, 'HTML', 85),
(4, 2, 'SQL', 88),
(5, 3, 'HTML', 78),
(6, 4, 'SQL', 92);

-- 1. SELECT + WHERE
SELECT * FROM students WHERE city = 'Vizag';

-- 2. JOIN - Student name tho marks
SELECT students.name, marks.subject, marks.marks
FROM students
JOIN marks ON students.student_id = marks.student_id;

-- 3. GROUP BY - Average marks
SELECT students.name, AVG(marks.marks) AS avg_marks
FROM students
JOIN marks ON students.student_id = marks.student_id
GROUP BY students.name;

-- 4. GROUP BY + ORDER BY - Course wise count
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course
ORDER BY total_students DESC;
