/*
    Server Operators:--------------------------------------------
*/
SELECT * FROM TestDB.dbo.employee;
SELECT * FROM TestDB.dbo.student;
SELECT * FROM TestDB.dbo.course;


/*
    Comparison Operator:---------------
*/
-- example 1 (equal '='):
SELECT * FROM TestDB.dbo.employee WHERE fname='peter';

-- example 2 (not equal '<>'):
SELECT * FROM TestDB.dbo.employee WHERE fname<>'peter';

-- example 3 (not equal '!='):
SELECT * FROM TestDB.dbo.employee WHERE fname != 'peter';

-- example 4 (greater than '>'):
SELECT * FROM TestDB.dbo.employee WHERE age > 35;

-- example 5 (lesser than '>'):
SELECT * FROM TestDB.dbo.employee WHERE age < 35;

-- example 6 (greater than or equal '>='):
SELECT * FROM TestDB.dbo.employee WHERE age >= 35;

-- example 7 (lesser than or equal '<='):
SELECT * FROM TestDB.dbo.employee WHERE age <= 35;




/*
    UNION Operator:--------------------
*/
-- example 1:
SELECT fname FROM TestDB.dbo.employee
UNION -- if you combine more attributes (if not match) then it'll show error
SELECT full_name FROM TestDB.dbo.student;

-- example 2:
SELECT fname FROM TestDB.dbo.employee WHERE age >= 35
UNION
SELECT full_name FROM TestDB.dbo.student WHERE age >= 32;

-- example 3 (UNION ALL : operator is used to allow duplicate values also):
SELECT fname FROM TestDB.dbo.employee
UNION ALL
SELECT full_name FROM TestDB.dbo.student;

-- example 4:
SELECT fname, age FROM TestDB.dbo.employee
UNION ALL
SELECT full_name, age FROM TestDB.dbo.student;




/*
    INTERSECT Operator:-------------------
*/
-- example 1:
SELECT fname FROM TestDB.dbo.employee
INTERSECT
SELECT full_name FROM TestDB.dbo.student;

-- example 2:
SELECT fname, age FROM TestDB.dbo.employee
INTERSECT
SELECT full_name, age FROM TestDB.dbo.student;

-- example 3:
SELECT fname FROM TestDB.dbo.employee WHERE age > 30
INTERSECT
SELECT full_name FROM TestDB.dbo.student;




/*
    IN Condition Operator:----------------
*/
-- example 1:
SELECT id, full_name, age, math_marks FROM TestDB.dbo.student
WHERE math_marks IN (69, 79);

-- example 2:
SELECT id, full_name, age, math_marks, phy_marks 
FROM TestDB.dbo.student
WHERE math_marks IN (69, 79) OR phy_marks in (66, 68, 86);

-- example 3:
SELECT id, full_name, age, math_marks
FROM TestDB.dbo.student
WHERE math_marks IN (69, 79) AND age IN (21, 26);

-- example 4:
SELECT id, full_name, age, math_marks
FROM TestDB.dbo.student
WHERE math_marks NOT IN (69, 79, 59, 89);




/*
    NOT Condition (Operator):------------------
*/
-- example 1:
SELECT id, full_name, age, math_marks
FROM TestDB.dbo.student
WHERE math_marks NOT IN (69, 79, 59, 89);

-- example 2:
SELECT * FROM TestDB.dbo.student
WHERE full_name NOT LIKE 'J%';

-- example 3:
SELECT id, full_name, age, study_hrs, phy_marks
FROM TestDB.dbo.student
WHERE id NOT BETWEEN 4 AND 14;

-- example 4:
SELECT id, full_name, age, study_hrs, phy_marks
FROM TestDB.dbo.student
WHERE id IS NOT NULL;




/*
    IS NULL Condition (Operator):----------------
*/
-- example 1:
SELECT id, full_name, age, study_hrs, math_marks, phy_marks
FROM TestDB.dbo.student
WHERE age IS NULL;

-- example 2:
DELETE FROM TestDB.dbo.student
WHERE age IS NULL;




/*
    LIKE Condition (Operator):---------------------
*/
-- example 1:
SELECT id, full_name, age, study_hrs, math_marks, phy_marks
FROM TestDB.dbo.student
WHERE full_name LIKE 'R%';

-- example 2:
SELECT id, full_name, age, study_hrs, math_marks, phy_marks
FROM TestDB.dbo.student
WHERE full_name LIKE '[sjd]%';

-- example 3:
SELECT id, full_name, age, study_hrs, math_marks, phy_marks
FROM TestDB.dbo.student
WHERE full_name NOT LIKE 'R%';





/*
    EXISTS Conditions:----------------------
*/
































































