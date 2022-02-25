/*
    Aggregate Function:-----------------------------------
*/


/*
    MIN() Function:------------
*/
-- example 1
SELECT * FROM TestDB.dbo.student;

-- example 2
SELECT MIN(age) FROM TestDB.dbo.student;
SELECT MIN(age) FROM TestDB.dbo.student WHERE study_hrs > 16;

-- example 3
SELECT MIN(age) AS 'Minimum Age' FROM TestDB.dbo.student;
SELECT MIN(age) AS 'Minimum Age' FROM TestDB.dbo.student WHERE study_hrs > 16;

-- example 4
SELECT id, full_name, age, study_hrs, phone FROM TestDB.dbo.student
WHERE math_marks = (
    SELECT MIN(math_marks) AS 'Minimum Math Mark'
    FROM TestDB.dbo.student    
);

-- example 5
SELECT course_id, MIN(age) AS 'Minimum Age' 
FROM TestDB.dbo.student
GROUP BY course_id;

-- example 6
SELECT course_id, MIN(age) AS 'Minimum Age' 
FROM TestDB.dbo.student
GROUP BY course_id
HAVING MIN(age) > 26;

-- example 7
SELECT course_id, MIN(DISTINCT age) AS 'Minimum Age' 
FROM TestDB.dbo.student
GROUP BY course_id;

-- example 8
SELECT course_id, MIN(age *2) AS 'Minimum Age' 
FROM TestDB.dbo.student
GROUP BY course_id;




/*
    MAX() Function:------------
*/
-- example 1
SELECT * FROM TestDB.dbo.student;

-- example 2
SELECT MAX(age) FROM TestDB.dbo.student;
SELECT MAX(age) FROM TestDB.dbo.student WHERE study_hrs > 16;

-- example 3
SELECT MAX(age) AS 'Maximum Age' FROM TestDB.dbo.student;
SELECT MAX(age) AS 'Maximum Age' FROM TestDB.dbo.student WHERE study_hrs > 16;

-- example 4
SELECT id, full_name, age, study_hrs, phone FROM TestDB.dbo.student
WHERE math_marks = (
    SELECT MAX(math_marks) AS 'Maximum Math Mark'
    FROM TestDB.dbo.student    
);

-- example 5
SELECT course_id, MAX(age) AS 'Maximum Age' 
FROM TestDB.dbo.student
GROUP BY course_id;

-- example 6
SELECT course_id, MAX(age) AS 'Maximum Age' 
FROM TestDB.dbo.student
GROUP BY course_id
HAVING MIN(age) > 26;

-- example 7
SELECT course_id, MAX(DISTINCT age) AS 'Maximum Age' 
FROM TestDB.dbo.student
GROUP BY course_id;

-- example 8
SELECT course_id, MAX(age *2) AS 'Maximum Age' 
FROM TestDB.dbo.student
GROUP BY course_id;




/*
    SUM() Functions:-------------------
*/
SELECT * FROM TestDB.dbo.employee;
SELECT * FROM TestDB.dbo.student;

-- example 1:
SELECT SUM(salary) FROM TestDB.dbo.employee;
SELECT SUM(salary) AS 'All Total Salary' FROM TestDB.dbo.employee;

-- example 2:
SELECT city, SUM(salary) AS 'Total Salary' 
FROM TestDB.dbo.employee 
GROUP BY city;

-- example 3:
SELECT city, SUM(salary) AS 'Total Salary' 
FROM TestDB.dbo.employee 
WHERE age >= 27
GROUP BY city;

-- example 4:
SELECT SUM(salary) AS 'Total Salary' 
FROM TestDB.dbo.employee 
WHERE age > 27;

-- example 5:
SELECT city, SUM(salary) AS 'Total Salary' 
FROM TestDB.dbo.employee 
GROUP BY city
ORDER BY SUM(salary); -- by defaul ascending

SELECT city, SUM(salary) AS 'Total Salary by Ascending' 
FROM TestDB.dbo.employee 
GROUP BY city
ORDER BY SUM(salary) ASC;

SELECT city, SUM(salary) AS 'Total Salary by Descending' 
FROM TestDB.dbo.employee 
GROUP BY city
ORDER BY SUM(salary) DESC;

-- example 6:
SELECT city, SUM(salary) AS 'Total Salary Ascending' 
FROM TestDB.dbo.employee 
GROUP BY city
HAVING SUM(salary) > 100000
ORDER BY SUM(salary) ASC;

-- example 7:
SELECT SUM(salary) AS 'Total Salary'
FROM TestDB.dbo.employee
where salary > 50000;




/*
    AVG() Function:-----------------
*/
SELECT * FROM TestDB.dbo.employee;
SELECT * FROM TestDB.dbo.student;

-- example 1:
SELECT AVG(salary) FROM TestDB.dbo.employee;
SELECT AVG(salary) AS 'Average Salary' FROM TestDB.dbo.employee;

-- example 2:
SELECT AVG(salary) AS 'Average Salary in Kolkata' FROM TestDB.dbo.employee
WHERE city='Kolkata';

SELECT AVG(salary) AS 'Average Salary in Pune' FROM TestDB.dbo.employee
WHERE city='Pune';

SELECT AVG(salary) AS 'Average Salary in Bangalore' FROM TestDB.dbo.employee
WHERE city='Bangalore';

-- example 3:
SELECT city, AVG(salary) AS "Average Salary by City" 
FROM TestDB.dbo.employee
GROUP BY city;

-- example 4:
SELECT city, AVG(salary) AS 'Average Salary by Ascending'
FROM TestDB.dbo.employee
GROUP BY city
ORDER BY AVG(salary);

SELECT city, AVG(salary) AS 'Average Salary by Ascending'
FROM TestDB.dbo.employee
GROUP BY city
ORDER BY AVG(salary) ASC;

SELECT city, AVG(salary) AS 'Average Salary by Descending'
FROM TestDB.dbo.employee
GROUP BY city
ORDER BY AVG(salary) DESC;

-- example 5:
SELECT city, AVG(salary) AS 'Average Salary by Ascending'
FROM TestDB.dbo.employee
GROUP BY city
HAVING AVG(salary) > 30000
ORDER BY AVG(salary) ASC;

-- example 6:
SELECT study_hrs, AVG(DISTINCT math_marks) AS 'Average Marks in Math'
FROM TestDB.dbo.student
GROUP BY study_hrs;

SELECT city, AVG(DISTINCT salary) AS 'Average Salary (Distinct) by City'
FROM TestDB.dbo.employee
GROUP BY city;




/*
    COUNT() Function:------------------
*/
SELECT * FROM TestDB.dbo.employee;
SELECT * FROM TestDB.dbo.student;

-- example 1:
SELECT COUNT(*) AS 'Total Employee' FROM TestDB.dbo.employee;
SELECT COUNT(*) AS 'Total Student' FROM TestDB.dbo.student;

-- example 2:
SELECT COUNT(DISTINCT age) AS 'Total Student' FROM TestDB.dbo.student;
SELECT COUNT(DISTINCT city) AS 'Total Employee' FROM TestDB.dbo.employee;

-- example 3:
SELECT COUNT(*) AS 'Total Employee' 
FROM TestDB.dbo.employee
WHERE age >= 28 AND city='Kolkata';

SELECT COUNT(*) AS 'Total Employee' 
FROM TestDB.dbo.employee
WHERE city='Kolkata';

-- example 4:
SELECT city, COUNT(age) AS 'Total Employee' 
FROM TestDB.dbo.employee
GROUP BY city;

SELECT city, COUNT(DISTINCT age) AS 'Total Employee' 
FROM TestDB.dbo.employee
GROUP BY city;

-- example 5:
SELECT city, COUNT(age) AS 'Total Employee by City (Ascending)' 
FROM TestDB.dbo.employee
GROUP BY city
ORDER BY city ASC;

-- example 6:
SELECT city, COUNT(age) AS 'Total Employee by City' 
FROM TestDB.dbo.employee
GROUP BY city
HAVING COUNT(age) >= 3
ORDER BY city ASC;












