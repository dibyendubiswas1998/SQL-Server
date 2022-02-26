/*
    Server Clauses:---------------------------------------------------------
*/
SELECT * FROM TestDB.dbo.student;
SELECT * FROM TestDB.dbo.employee;


/*
    DISTINCT Clause:------------------
*/
-- example 1:
SELECT DISTINCT fname, lname, age FROM TestDB.dbo.employee;

-- example 2:
SELECT DISTINCT * FROM TestDB.dbo.employee
WHERE salary > 40000;




/*
    GROUP BY Clause:--------------------
*/
-- example 1:
SELECT city, SUM(salary) AS 'Total Salary by city' FROM TestDB.dbo.employee
GROUP BY city;

-- example 2:
SELECT city, SUM(salary) AS 'Total Salary by city' FROM TestDB.dbo.employee
WHERE age > 32
GROUP BY city;




/*
    WHERE Clause:----------------------
*/
-- example 1:
SELECT * FROM TestDB.dbo.employee
WHERE city = 'Kolkata';

-- example 2:
SELECT * FROM TestDB.dbo.employee
WHERE city = 'Kolkata'
ORDER BY age ASC;

-- example 3:
SELECT * FROM TestDB.dbo.employee
WHERE city = 'Kolkata'
ORDER BY age DESC;

-- example 4:
SELECT * FROM TestDB.dbo.employee
WHERE city='Kolkata' AND age=27;

-- example 5:
SELECT * FROM TestDB.dbo.employee
WHERE city='Kolkata' OR age=27
ORDER BY id DESC;




/*
    ORDER BY Clause:--------------------
*/
-- example 1:
SELECT * FROM TestDB.dbo.employee
WHERE city='Kolkata' OR age=27
ORDER BY id ASC;

-- example 2:
SELECT * FROM TestDB.dbo.employee
WHERE city='Kolkata' OR age=27
ORDER BY id DESC;




/*
    Having Clause:-----------------------
*/
-- example 1:
SELECT city, SUM(salary) AS 'Total Salary' FROM TestDB.dbo.employee
GROUP BY city
HAVING SUM(salary) > 110000;

-- example 2:
SELECT city, SUM(salary) AS 'Total Salary' 
FROM TestDB.dbo.employee
WHERE age > 30
GROUP BY city
HAVING SUM(salary) > 40000;

-- example 3:
SELECT city, SUM(salary) AS 'Total Salary', MIN(salary) AS 'Minimum Salary',
AVG(salary) AS 'Average Salary'
FROM TestDB.dbo.employee
WHERE age > 30
GROUP BY city
HAVING SUM(salary) > 40000;

-- example 4;
SELECT SUM(salary) AS 'Total Salary' 
FROM TestDB.dbo.employee
WHERE city = 'Kolkata'
HAVING SUM(age) > 40;




