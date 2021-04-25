CREATE DATABASE data_query;

-- Instuctors Table
USE data_query;
CREATE TABLE IF NOT EXISTS Instructor (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Dept_name VARCHAR(100) NOT NULL,
    Salary INT NOT NULL 
) ;

-- Values
INSERT INTO Instructor
VALUES
(22222,'Einstein','Physics',95000),
(12121,'Wu','Finance',90000),
(32343,'Ei Said','History',60000),
(45565,'Katz','Comp. Sci',75000),
(98345,'Kim','Elec.Eng',80000),
(76766,'Crick','Biology',72000),
(10101,'Srinivasan','Comp. Sci',65000),
(58583,'Califieri','History',62000),
(83821,'Brandit','Comp. Sci',92000),
(15151,'Mozart','Music',40000),
(33456,'Gold','Physics',87000),
(76543,'Singh','Finance',80000);

-- Teaches Table
USE data_query;
 CREATE TABLE IF NOT EXISTS Teaches (
    ID INT NOT NULL ,
    Course_id VARCHAR(100) NOT NULL ,
    Section_id INT NOT NULL ,
    Semester VARCHAR(100) NOT NULL,
	Year INT NOT NULL 
) ;
 
-- Values 
INSERT INTO Teaches
VALUES
(10101,'CS-101',1,'Fall',2009),
(10101,'CS-315',1,'Spring',2010),
(10101,'CS-347',1,'Fall',2009),
(12121,'FIN-201',1,'Spring',2010),
(15151,'MU-101',1,'Spring',2010),
(22222,'PHY-101',1,'Fall',2009),
(32343,'HIS-351',1,'Spring',2010),
(45565,'CS-101',1,'Spring',2010),
(45565,'CS-319',1,'Spring',2010),
(76766,'BIO-101',1,'Summer',2009),
(76766,'BIO-301',1,'Summer',2010),
(83821,'CS-190',1,'Spring',2009),
(83821,'CS-190',2,'Spring',2009),
(83821,'CS-319',2,'Spring',2010),
(98345,'CS-101',1,'Spring',2009);

-- INVERSE QUERIES
-- -------------------------------------------
-- ------------------------------------------
-- (A) Single Table Query

-- User Query - Q1:
SELECT ID, Name FROM Instructor;
-- -------------------------------------------
-- Inverse Query:
SELECT * FROM instructor 
WHERE  ID IN (SELECT ID FROM Instructor);
-- -------------------------------------------
-- -------------------------------------------
-- (B) Multiple Table Query

-- User Query – Q2:
Select ID,Name, Dept_name,Course_id, Section_id, Semester
FROM Instructor 
NATURAL JOIN Teaches
WHERE salary > 70000;
-- -------------------------------------------
-- Inverse Query
-- Query 1
SELECT * FROM Instructor
WHERE ID IN 
(Select ID
FROM Instructor 
NATURAL JOIN Teaches
WHERE salary > 70000);

-- Query 2
SELECT * FROM Teaches
WHERE ID IN 
(Select ID
FROM Instructor 
NATURAL JOIN Teaches
WHERE salary > 70000);
-- -------------------------------------------
-- -------------------------------------------
-- (C) Aggregate Function Query:

-- User Query – Q3:
SELECT Dept_name, SUM(Salary)
FROM Instructor 
GROUP BY Dept_name ;
-- -------------------------------------------
-- Inverse Query:
SELECT Dept_name,Salary FROM Instructor 
WHERE Dept_name IN
(SELECT Dept_name
FROM Instructor 
GROUP BY Dept_name);
-- -------------------------------------------
-- -------------------------------------------