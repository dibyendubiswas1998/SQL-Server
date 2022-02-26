/*
    Server Keys:----------------------------------------------------
*/


/*
    Creating PRIMARY KEY Using Creating Table:-------
*/
-- example 1 (syntax 1):
CREATE TABLE TestDB.dbo.NewTable(
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT
);
SELECT * FROM TestDB.dbo.NewTable;
DROP TABLE TestDB.dbo.NewTable;

-- example 2 (syntax 2):
CREATE TABLE TestDB.dbo.NewTable(
    id INT ,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    CONSTRAINT NewTable_pk PRIMARY KEY(id)
);
SELECT * FROM TestDB.dbo.NewTable;
DROP TABLE TestDB.dbo.NewTable;

-- example 3 (syntax 3)
CREATE TABLE TestDB.dbo.NewTable(
    id INT ,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    PRIMARY KEY(id)
);
SELECT * FROM TestDB.dbo.NewTable;
DROP TABLE TestDB.dbo.NewTable;




/*
    Enable Primary Key:-----------
*/
CREATE TABLE TestDB.dbo.NewTable(
    id INT ,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    CONSTRAINT table_pk PRIMARY KEY(id)
);
ALTER INDEX table_pk ON TestDB.dbo.NewTable REBUILD; -- enable primary key
DROP TABLE TestDB.dbo.NewTable;




/**/
CREATE TABLE TestDB.dbo.NewTable(
    id INT ,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    CONSTRAINT table_pk PRIMARY KEY(id)
);
SELECT * FROM TestDB.dbo.NewTable;
ALTER INDEX table_pk ON TestDB.dbo.NewTable DISABLE; -- disable primary key
DROP TABLE TestDB.dbo.NewTable;




/*
    DROP Primary Key:----------------
*/
CREATE TABLE TestDB.dbo.NewTable(
    id INT ,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    CONSTRAINT NewTable_pk PRIMARY KEY(id)
);

ALTER TABLE TestDB.dbo.NewTable 
DROP CONSTRAINT NewTable_pk;

SELECT * FROM TestDB.dbo.NewTable;
DROP TABLE TestDB.dbo.NewTable;




/*
    Creating Foreign Key:------------
*/
-- example 1 (only one foreign key)
CREATE TABLE TestDB.dbo.Table1(
    tab1_id INT PRIMARY KEY,
    fname VARCHAR(50),
    age INT,
    loc VARCHAR(100)
);
CREATE TABLE TestDB.dbo.Table2(
    tab2_id INT PRIMARY KEY,
    fname VARCHAR(50),
    age INT,
    loc VARCHAR(100),
    tab1_id INT NOT NULL,
    CONSTRAINT table2_fk FOREIGN KEY(tab1_id) 
        REFERENCES TestDB.dbo.Table1(tab1_id)
);
DROP TABLE TestDB.dbo.Table2;
DROP TABLE TestDB.dbo.Table1;

-- example 2 (more than one foreign keys):------------------
CREATE TABLE TestDB.dbo.Table1(
    tab1_id INT NOT NULL,
    fname1 VARCHAR(50),
    age1 INT,
    loc1 VARCHAR(100) NOT NULL,
    CONSTRAINT table1_pk PRIMARY KEY(tab1_id, loc1)
);
CREATE TABLE TestDB.dbo.Table2(
    tab2_id INT PRIMARY KEY,
    fname2 VARCHAR(50),
    age2 INT,
    loc2 VARCHAR(100),
    tab1_id INT NOT NULL,
    loc1 VARCHAR(100) NOT NULL,
    CONSTRAINT table2_fk FOREIGN KEY(tab1_id, loc1) 
        REFERENCES TestDB.dbo.Table1(tab1_id, loc1)
);
DROP TABLE TestDB.dbo.Table2;
DROP TABLE TestDB.dbo.Table1;

-- example 3 (in one table multiple foreign keys):------------
CREATE TABLE TestDB.dbo.Tab1(
    tab1_id INT NOT NULL,
    tab1_name VARCHAR(100),
    tab1_age INT,
    tab1_loc VARCHAR(50),
    CONSTRAINT tab1_pk PRIMARY KEY(tab1_id)    
);
CREATE TABLE TestDB.dbo.Tab2(
    tab2_id INT NOT NULL,
    tab2_name VARCHAR(100),
    tab2_age INT,
    tab2_loc VARCHAR(50)
    CONSTRAINT tab2_pk PRIMARY KEY(tab2_id) 
);
CREATE TABLE TestDB.dbo.Tab3(
    tab3_id INT NOT NULL,
    tab3_name VARCHAR(100),
    tab3_age INT,
    tab3_loc VARCHAR(50)
    CONSTRAINT tab3_pk PRIMARY KEY(tab3_id) 
);
CREATE TABLE TestDB.dbo.MainTable(
    id INT NOT NULL,
    fname VARCHAR(30),
    lname VARCHAR(30),
    age INT,
    tab1_id INT NOT NULL,
    tab2_id INT NOT NULL,
    tab3_id INT NOT NULL,
    CONSTRAINT main_fk1 FOREIGN KEY(tab1_id)
        REFERENCES TestDB.dbo.Tab1(tab1_id),

    CONSTRAINT main_fk2 FOREIGN KEY(tab2_id)
        REFERENCES TestDB.dbo.Tab2(tab2_id),

    CONSTRAINT main_fk3 FOREIGN KEY(tab3_id)
        REFERENCES TestDB.dbo.Tab3(tab3_id)
);

SELECT * FROM TestDB.dbo.Tab1;
SELECT * FROM TestDB.dbo.Tab2;
SELECT * FROM TestDB.dbo.Tab3;
SELECT * FROM TestDB.dbo.MainTable;

DROP TABLE TestDB.dbo.MainTable;
DROP TABLE TestDB.dbo.Tab1;
DROP TABLE TestDB.dbo.Tab2;
DROP TABLE TestDB.dbo.Tab3;




/*
    Enable and Disable and Drop Foreign Key:--------------
*/
-- Enable Foreign Key:
ALTER TABLE TestDB.dbo.MainTable 
CHECK CONSTRAINT main_fk1, main_fk2, main_fk3;

-- Disable Foreign Key:
ALTER TABLE TestDB.dbo.MainTable
NOCHECK CONSTRAINT main_fk1, main_fk2, main_fk3;

-- Drop Foreign Key:
ALTER TABLE TestDB.dbo.MainTable
DROP CONSTRAINT main_fk1, main_fk2, main_fk3;










