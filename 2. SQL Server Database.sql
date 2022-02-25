/*
    Server Database:----------------
*/
create database TestDB;


/*
    create table:----
*/
USE TestDB;
CREATE TABLE TestDB.dbo.employee(
    id INT NOT NULL,
    fname VARCHAR(50),
    lname VARCHAR(70),
    age INT,
    city VARCHAR(20),
    salary INT,
    PRIMARY KEY(id)
);
CREATE TABLE TEstDB.dbo.course(
    id INT NOT NULL,
    course_name VARCHAR(100),
    PRIMARY KEY(id)
);
CREATE TABLE TestDB.dbo.student(
    id INT NOT NULL,
    full_name VARCHAR(100),
    age INT,
    study_hrs INT,
    course_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(course_id) REFERENCES TestDB.dbo.course(id)

);
CREATE TABLE TestDB.dbo.Tabl1(
    id INT NOT NULL,
    tab_name VARCHAR(100),
    PRIMARY KEY(id)
);
CREATE TABLE TestDB.dbo.Tabl2(
    id INT NOT NULL,
    tab_name VARCHAR(100),
    PRIMARY KEY(id)
);
CREATE TABLE TestDB.dbo.Tabl3(
    id INT NOT NULL,
    tab_name VARCHAR(100),
    PRIMARY KEY(id)
);
CREATE TABLE TestDB.dbo.Tabl4(
    id INT NOT NULL,
    tab_name VARCHAR(100),
    PRIMARY KEY(id)
);
CREATE TABLE TestDB.dbo.Tabl5(
    id INT NOT NULL,
    tab_name VARCHAR(100),
    PRIMARY KEY(id)
);




/*
    Drop table:------
*/
DROP TABLE TestDB.dbo.Tabl1;
DROP TABLE TestDB.dbo.Tabl2, Tabl3, Tabl4, Tabl5;




/*
    Insert Data into table:----------
*/
INSERT INTO TestDB.dbo.course VALUES
    (101, 'Web Development'),
    (102, 'Machine Learning'),
    (103, 'Deep Learning'),
    (104, 'Natural Langauge processing'),
    (105, 'Python Development'),
    (106, 'Java Development'),
    (107, 'Javascript Development');


INSERT INTO TestDB.dbo.student VALUES
    (1, 'Dibyendu Biswas', 23, 16, 102),
    (2, 'Arko Biswas', 24, 14, 101),
    (3, 'Ram Paul', 21, 12, 103),
    (4, 'Shyam Sharma', 27, 11, 101),
    (5, 'Ramesh Sen', 32, 14, 104),
    (6, 'Jadu Sengupta', 28, 12, 105),
    (7, 'Nandini Sen', 26, 11, 106),
    (8, 'Dr. D B Paul', 24, 18, 107),
    (9, 'Jems', 25, 13, 107),
    (10, 'Holks', 21, 14, 106),
    (11, 'Arpita Sen', 23, 19, 105),
    (12, 'Jonny Paul', 33, 8, 104),
    (13, 'Peter Huges', 34, 6, 103),
    (14, 'Laura Bennet', 24, 9, 102),
    (15, 'Jolly Evans', 27, 11, 101),
    (16, 'Alan Simmons', 28, 19, 104);


INSERT INTO TestDB.dbo.employee VALUES
    (1, 'Alan', 'Simmons', 28, 'Kolkata', 23500),
    (2, 'Jooly', 'Evans', 22, 'Pune', 45200),
    (3, 'Laura', 'Beneet', 24, 'Delhi', 31000),
    (4, 'Peter', 'Huges', 27, 'Kolkata', 22000),
    (5, 'Jonny', 'Paul', 38, 'Bangalore', 32000),
    (6, 'Arpita', 'Sen', 35, 'Pune', 23000),
    (7, 'Holks', 'Solly', 32, 'Mumbai', 42000),
    (8, 'Jems', 'Holks', 28, 'Delhi', 23450),
    (9, 'Nandini', 'Sen', 33, 'Kolkata', 32540),
    (10, 'Jadu', 'Sen', 29, 'Kolkata', 21540),
    (11, 'Namrita', 'Paul', 27, 'Bangalore', 36500),
    (12, 'Dibyendu', 'Biswas', 34, 'Delhi', 47500),
    (13, 'Arko', 'Paul', 42, 'Pune', 36500),
    (14, 'Shyam', 'Sharma', 32, 'Mumbai', 17850),
    (15, 'Ramesh', 'Sharma', 27, 'Kolkata', 19750),
    (16, 'Gopal', 'Sengupta', 36, 'Bangalore', 75000);



SELECT * FROM TestDB.dbo.employee;
SELECT * FROM TestDB.dbo.course;
SELECT * FROM TestDB.dbo.student;




/*
    Update Data:-----------
*/
UPDATE TestDB.dbo.course 
SET course_name='Machine Learning (ML)' WHERE id=102;

UPDATE TestDB.dbo.course 
SET course_name='Deep Learning (DL)' WHERE id=103;

UPDATE TestDB.dbo.course 
SET course_name='Natural Langauge Processing (NLP)' WHERE id=104;

SELECT * FROM TestDB.dbo.course;




/*
    Delete Data or Record:-------------
*/
DELETE FROM TestDB.dbo.student WHERE id=16;
SELECT * FROM TestDB.dbo.student;

--delete top 2 recods where study_hrs > 18.
DELETE TOP (2) FROM TestDB.dbo.student 
WHERE study_hrs > 18;
SELECT * FROM TestDB.dbo.student;

--delete top 2o percent recods where study_hrs > 18.
DELETE Top (20) PERCENT FROM TestDB.dbo.student
WHERE study_hrs > 12;
SELECT * FROM TestDB.dbo.student;




/*
    ALTER Table:---------
*/
-- ADD New Column with Datatype:----
ALTER TABLE TestDB.dbo.student ADD my_name INT NULL;
ALTER TABLE TestDB.dbo.student ADD my_name1 INT NULL;
ALTER TABLE TestDB.dbo.student ADD my_name2 INT NULL;
ALTER TABLE TestDB.dbo.student ADD my_name3 INT NULL;


ALTER TABLE TestDB.dbo.student ADD phone VARCHAR(10) NULL;
ALTER TABLE TestDB.dbo.student ADD math_marks INT NULL;
ALTER TABLE TestDB.dbo.student ADD phy_marks INT NULL;
ALTER TABLE TestDB.dbo.student ADD che_marks INT NULL;
ALTER TABLE TestDB.dbo.student ADD eng_marks INT NULL;
ALTER TABLE TestDB.dbo.student ADD bng_marks INT NULL;
ALTER TABLE TestDB.dbo.student ADD his_marks INT NULL;

SELECT * FROM TestDB.dbo.student;


-- Delete Column from a particular table:----
ALTER TABLE TestDB.dbo.student DROP COLUMN my_name;
ALTER TABLE TestDB.dbo.student DROP COLUMN my_name1, my_name2, my_name3;
SELECT * FROM TestDB.dbo.student;

-- Get details about particular table:----
EXEC sp_help 'TestDB.dbo.student';  
EXEC sp_help 'TestDB.dbo.course';
EXEC sp_help 'TestDB.dbo.employee';


-- Modify the column DataType:----
ALTER TABLE TestDB.dbo.student ALTER COLUMN math_marks VARCHAR(10);
ALTER TABLE TestDB.dbo.student ALTER COLUMN phy_marks VARCHAR(10);
ALTER TABLE TestDB.dbo.student ALTER COLUMN che_marks VARCHAR(10);
EXEC sp_help 'TestDB.dbo.student';

ALTER TABLE TestDB.dbo.student ALTER COLUMN math_marks INT;
ALTER TABLE TestDB.dbo.student ALTER COLUMN phy_marks INT;
ALTER TABLE TestDB.dbo.student ALTER COLUMN che_marks INT;
EXEC sp_help 'TestDB.dbo.student';


/*
    Now add(update) the data in student table:--------
*/
-- UPDATE TestDB.dbo.student SET
--     phone=7895851, math_marks=69, phy_marks=75, che_marks=66, eng_marks=66, bng_marks=42,
--     his_marks=66 WHERE id=3;

-- UPDATE TestDB.dbo.student SET
--     phone=7895852, math_marks=59, phy_marks=75, che_marks=86, eng_marks=46, bng_marks=42,
--     his_marks=55 WHERE id=4;

-- UPDATE TestDB.dbo.student SET
--     phone=7895853, math_marks=89, phy_marks=75, che_marks=96, eng_marks=86, bng_marks=72,
--     his_marks=36 WHERE id=5;

-- UPDATE TestDB.dbo.student SET
--     phone=7895854, math_marks=49, phy_marks=755, che_marks=64, eng_marks=76, bng_marks=82,
--     his_marks=96 WHERE id=6;

-- UPDATE TestDB.dbo.student SET
--     phone=7895855, math_marks=79, phy_marks=65, che_marks=68, eng_marks=66, bng_marks=92,
--     his_marks=66 WHERE id=7;

-- UPDATE TestDB.dbo.student SET
--     phone=7895858, math_marks=79, phy_marks=85, che_marks=60, eng_marks=66, bng_marks=37,
--     his_marks=36 WHERE id=8;

-- UPDATE TestDB.dbo.student SET
--     phone=7895859, math_marks=19, phy_marks=75, che_marks=66, eng_marks=24, bng_marks=42,
--     his_marks=21 WHERE id=9;

-- UPDATE TestDB.dbo.student SET
--     phone=7895810, math_marks=79, phy_marks=95, che_marks=66, eng_marks=86, bng_marks=34,
--     his_marks=51 WHERE id=10;

-- UPDATE TestDB.dbo.student SET
--     phone=7895812, math_marks=61, phy_marks=71, che_marks=66, eng_marks=43, bng_marks=72,
--     his_marks=86 WHERE id=12;

-- UPDATE TestDB.dbo.student SET
--     phone=7895813, math_marks=79, phy_marks=85, che_marks=46, eng_marks=23, bng_marks=42,
--     his_marks=36 WHERE id=13;

-- UPDATE TestDB.dbo.student SET
--     phone=7895814, math_marks=49, phy_marks=75, che_marks=46, eng_marks=61, bng_marks=42,
--     his_marks=65 WHERE id=14;

-- UPDATE TestDB.dbo.student SET
--     phone=7895815, math_marks=99, phy_marks=75, che_marks=76, eng_marks=86, bng_marks=42,
--     his_marks=27 WHERE id=15;

-- SELECT * from TestDB.dbo.student;



-- Create a Views:---------
-- example 1
CREATE VIEW Age_morethan_25 
AS 
SELECT * FROM TestDB.dbo.student 
WHERE age > 25;

SELECT * FROM Age_morethan_25;


-- example 2
CREATE VIEW my_view_1
AS
SELECT id, full_name, age, study_hrs FROM TestDB.dbo.student
WHERE age > 26;

SELECT * FROM my_view_1;

-- (rename the view)
SP_RENAME my_view_1, new_view;
SELECT * FROM new_view;



-- example 3
CREATE VIEW study_hrs_view
AS
SELECT id, full_name, age, study_hrs, phone FROM TestDB.dbo.student
WHERE study_hrs > 12;

SELECT * FROM study_hrs_view;


-- (using ALTER add some columns in particular view)
ALTER VIEW study_hrs_view
AS
SELECT id, full_name, age, study_hrs, phone, math_marks, phy_marks
FROM TestDB.dbo.student
WHERE study_hrs > 12;

SELECT * FROM study_hrs_view;


/*
    Get views definition:--------
*/
SP_HELPTEXT Age_morethan_25;
SP_HELPTEXT new_view;
SP_HELPTEXT study_hrs_view;

