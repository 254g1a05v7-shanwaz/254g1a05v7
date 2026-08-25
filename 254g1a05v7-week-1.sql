--1. Create all tables without constraint
CREATE TABLE STUDENT (
    Name VARCHAR(50),
    Student_number INT,
    Class INT,
    Major VARCHAR(10)
);

CREATE TABLE COURSE (
    Course_name VARCHAR(100),
    Course_number VARCHAR(20),
    Credit_hours INT,
    Department VARCHAR(20)
);

CREATE TABLE SECTION (
    Section_identifier INT,
    Course_number VARCHAR(20),
    Semester VARCHAR(20),
    Year INT,
    Instructor VARCHAR(50)
);

CREATE TABLE GRADE_REPORT (
    Student_number INT,
    Section_identifier INT,
    Grade CHAR(1)
);

CREATE TABLE PREREQUISITE (
    Course_number VARCHAR(20),
    Prerequisite_number VARCHAR(20)
);

--2. Insert all values into the tables
-- STUDENT
INSERT INTO STUDENT (Name, Student_number, Class, Major)
VALUES ('Smith', 17, 1, 'CS');

INSERT INTO STUDENT (Name, Student_number, Class, Major)
VALUES ('Brown', 8, 2, 'CS');


-- COURSE
INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department)
VALUES ('Intro to Computer Science', 'CS1310', 4, 'CS');

INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department)
VALUES ('Data Structures', 'CS3320', 4, 'CS');

INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department)
VALUES ('Discrete Mathematics', 'MATH2410', 3, 'MATH');

INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department)
VALUES ('Database', 'CS3380', 3, 'CS');


-- SECTION
INSERT INTO SECTION
(Section_identifier, Course_number, Semester, Year, Instructor)
VALUES (85, 'MATH2410', 'Fall', 7, 'King');

INSERT INTO SECTION
(Section_identifier, Course_number, Semester, Year, Instructor)
VALUES (92, 'CS1310', 'Fall', 7, 'Anderson');

INSERT INTO SECTION
(Section_identifier, Course_number, Semester, Year, Instructor)
VALUES (102, 'CS3320', 'Spring', 8, 'Knuth');

INSERT INTO SECTION
(Section_identifier, Course_number, Semester, Year, Instructor)
VALUES (112, 'MATH2410', 'Fall', 8, 'Chang');

INSERT INTO SECTION
(Section_identifier, Course_number, Semester, Year, Instructor)
VALUES (119, 'CS1310', 'Fall', 8, 'Anderson');

INSERT INTO SECTION
(Section_identifier, Course_number, Semester, Year, Instructor)
VALUES (135, 'CS3380', 'Fall', 8, 'Stone');


-- GRADE_REPORT
INSERT INTO GRADE_REPORT
(Student_number, Section_identifier, Grade)
VALUES (17, 112, 'B');

INSERT INTO GRADE_REPORT
(Student_number, Section_identifier, Grade)
VALUES (17, 119, 'C');

INSERT INTO GRADE_REPORT
(Student_number, Section_identifier, Grade)
VALUES (8, 85, 'A');

INSERT INTO GRADE_REPORT
(Student_number, Section_identifier, Grade)
VALUES (8, 92, 'A');

INSERT INTO GRADE_REPORT
(Student_number, Section_identifier, Grade)
VALUES (8, 102, 'B');

INSERT INTO GRADE_REPORT
(Student_number, Section_identifier, Grade)
VALUES (8, 135, 'A');


-- PREREQUISITE
INSERT INTO PREREQUISITE
(Course_number, Prerequisite_number)
VALUES ('CS3380', 'CS3320');

INSERT INTO PREREQUISITE
(Course_number, Prerequisite_number)
VALUES ('CS3380', 'MATH2410');

INSERT INTO PREREQUISITE
(Course_number, Prerequisite_number)
VALUES ('CS3320', 'CS1310');

COMMIT;


--3. Describe all tables

DESC STUDENT;
DESC COURSE;
DESC SECTION;
DESC GRADE_REPORT;
DESC PREREQUISITE;

-- 4. List the created tables
SHOW TABLES;

--5. Display the values of each table
SELECT * FROM STUDENT;

SELECT * FROM COURSE;

SELECT * FROM SECTION;

SELECT * FROM GRADE_REPORT;

SELECT * FROM PREREQUISITE;

--6. Delete all tables
DROP TABLE STUDENT;
DROP TABLE COURSE;
DROP TABLE SECTION;
DROP TABLE GRADE_REPORT;
DROP TABLE PREREQUISITE;
