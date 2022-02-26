
/*
    Stored Procedure:
            When naming user defined stored procedures, microsoft recommends not to use sp_
            as a prefix. All the system stored procedures, are prefixed with sp_. This avoids
            any ambiguity between user defined and stored procedures and any conflicts, with
            some features systems procedures.
*/
SELECT * FROM TestDB.dbo.employee;

-- example 1 (without parameter):
CREATE PROCEDURE GetEmployee
AS
BEGIN
    SELECT id, fname, lname, age FROM TestDB.dbo.employee
END;

EXEC GetEmployee;


-- example 2 (without parameter):
CREATE PROCEDURE GetEmployee2
AS
BEGIN
    SELECT id, fname, lname, age, city FROM TestDB.dbo.employee 
    WHERE city = 'Kolkata'
END;

EXEC GetEmployee2;


-- example 3 (with parameter):
CREATE PROCEDURE GetEmployeeCity
@cty VARCHAR(30)
AS
BEGIN
    SELECT id, fname, lname, salary, city
    FROM TestDB.dbo.employee
    WHERE city = @cty
END;

EXEC GetEmployeeCity 'Kolkata';
EXEC GetEmployeeCity 'Pune';



-- example 4 (with parameter):
CREATE PROCEDURE EmployeeCityAge
@cty VARCHAR(30),
@age INT
AS
BEGIN
    SELECT id, fname, lname, age, salary, city
    FROM TestDB.dbo.employee
    WHERE city = @cty AND age = @age
END;

EXEC EmployeeCityAge 'Pune', 22;


/*
    Drop Stored Procedure:
*/
drop PROCEDURE EmployeeCityAge;



