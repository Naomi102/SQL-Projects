/*VIDEO 1*/

CREATE DATABASE SQL_Mytut;
CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Age INT,
Gender VARCHAR(50),

)
 

 CREATE TABLE EmployeeSalary
 (EmployeeID int,
 JobTitle varchar(50),
 Salary int

 )

 INSERT INTO EmployeeDemographics VALUES
 (1001, 'Jim','Halpert', 30,'Male')
 INSERT INTO EmployeeDemographics VALUES
 (1002, 'Pam', 'Beasley', 30, 'Female'),
 (1003, 'Dwight', 'Schrute', 29, 'Male'),
 (1004, 'Angela', 'Martin', 31, 'Female'),
 (1005, 'Toby', 'Flenderson', 32, 'Male'),
 (1006, 'Michael', 'Scott', 35, 'Male'),
 (1007, 'Mederith', 'Palmer', 32, 'Female'),
 (1008, 'Stanley', 'Hudson', 38, 'Male'),
 (1009, 'Kevin', 'Malone', 31, 'Male')

 INSERT INTO EmployeeSalary VALUES
 (1001, 'Saleman',45000),
 (1002, 'Receptionist',36000),
 (1003, 'Saleman',63000),
 (1004, 'Accountant',47000),
 (1005, 'HR',50000),
 (1006, 'Regional Manager',65000),
 (1007, 'Supplier Relations',41000),
 (1008, 'Saleman',48000),
 (1009, 'Accountant',42000)


 /*VIDEO 2*/
 /*SELECT AND THE FROM STATEMENT
 Select Statement:
	*, TOP, COUNT, AS, MAX, MIN, AVG

 */
 SELECT FirstName, LastName
 FROM EmployeeDemographics;

 
 SELECT TOP 5 *
 FROM EmployeeSalary;

 SELECT DISTINCT(Gender)
 FROM EmployeeDemographics;

 SELECT COUNT(Gender) AS How_Many --answer= 9
 FROM EmployeeDemographics


 MAX, MIN, AVERAGES (AVG)

 SELECT MAX(Salary) AS Max_Salary
 FROM EmployeeSalary

 SELECT MIN(Salary) AS Min_Salary, EmployeeID
 FROM EmployeeSalary

 SELECT AVG(Salary) AS Average_Salary
 FROM EmployeeSalary

 /*Selecting from a table in adifferent database*/
 SELECT *
 FROM database_name.dbo.table_name

 SELECT *
 FROM SQL_Mytut.dbo.EmployeeSalary

 /*VIDEO 3*/
 /*WHERE statement:
		=, <>, <, >, AND, OR, LIKE, NULL, NOT NULL, IN
 */

SELECT *
FROM EmployeeDemographics
WHERE FirstName ='Jim'

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'  --means not equal to Jim

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male'


SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE '%j%' --not case sensitive
							--These are Wildcards, remember


SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%ott%'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%c%ott%'

/*NOTE THAT WILDCARDS i.e. LIKE keyword CAN 
ALSO BE USED WITH NUMBERS*/

SELECT *
FROM EmployeeSalary
WHERE Salary LIKE '%000'

SELECT *
FROM EmployeeSalary
WHERE Salary LIKE '4%'


SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NULL 

SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL


/*IN Statements
		The IN statement is kinda like the equal sign
		but it is multiple equal statements

		IN operator is a shorthand for 
		multiple OR Statements. 
*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael', 'Toby')

The above statement is the same as:

SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim' OR FirstName = 'Michael' OR FirstName = 'Toby'


/*VIDEO 4*/
/*
	Group By, Order by
*/


/*Group By statement is similar to the 
  the DISTINCT int the select statement
  that it's gonna show the unique values in a COLUMN

  The difference is:
*/
SELECT DISTINCT(Gender) --ONLY shows the very first distinct/ unique value of 
FROM EmployeeDemographics --females and the very first unique value of males


SELECT DISTINCT(Gender), Age
FROM EmployeeDemographics 

WHEREAS:

SELECT Gender, COUNT(Gender) AS Gender_count --Shows all the females lined up in
FROM EmployeeDemographics --one row and all the males lined up
GROUP BY Gender --in one row
aka:
SELECT Gender, COUNT(*) AS Gender_Count
FROM EmployeeDemographics
GROUP BY Gender

/*It looks like you're trying to retrieve the distinct 
values of the "Gender" column along with the count of 
each gender from the "EmployeeDemographics" table. 
However, the DISTINCT keyword in SQL applies to the 
entire row, not just a specific column. If you want to 
get the distinct values of the "Gender" column along 
with their counts, you should use the GROUP BY clause.
*/

/*DISTINCT: So with the distinct, it is only showing us what
values is in there that's unique

But with the GROUP BY: it is showing us what the 
DISTINCT/UNIQUE value isbut it's also rolling them
them up into one column (How many there are)
*/

SELECT *
FROM EmployeeDemographics

SELECT Gender, Age, COUNT(Gender) AS Gender_Count
FROM EmployeeDemographics
GROUP BY Gender, Age

SELECT Gender, COUNT(Gender) AS Gender_Count
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender

 There must be the same number of non-derived
 columns in the select statement and in the
 GROUP BY statement

 SELECT *
 FROM EmployeeDemographics

 SELECT Age, COUNT(*) AS Age_Count, Gender
 FROM EmployeeDemographics
 GROUP BY Age, Gender

 /*ORDER BY*/
 
SELECT Gender, COUNT(Gender) AS Gender_Count
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY Gender_Count DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age

SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender


WE CAN ALSO ORDER BY NUMERICAL VALUES
Each numerical value represents the position of the column
starting from 1
SELECT *
FROM EmployeeDemographics
ORDER BY 2

 SELECT *
 FROM EmployeeDemographics
 ORDER BY 4 DESC, 5 DESC


 /* Intermediate SQL Tutorial | Inner/Outer Joins | Use Cases*/

 /*--INTERMEDIATE
 Joins
 Unions
 Case Statements
 Updating/Deleting Data
 Partition By
 Data Types
 Aliasing
 Creating Views
 Having vs Group By Statement
 GETDATE()
 Primary Key vs Foreign Key
 */


 /*ADVANCED:

 CTEs
 SYS tables
 Subqueries
 Temp Tables
 String Functions (TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower)
 Regular Expression
 Stored Procedures
 Importing Data from different File Types/Sources
 Exporting Data to different yhFile Types
 */

 /*VIDEO 1 of INTERMEDIATE
	Inner Joins, Full/Left/Right Outer Joins
 */




INSERT INTO EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)


SELECT *
FROM EmployeeDemographics

SELECT *
FROM EmployeeSalary


/*--INNER JOIN
SELECT *
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

	Only displays the commonalities
	The commonality is based on the EmployeeID
*/

/*--FULL OUTER JOIN
SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

adds everything, starting with the EmployeeDemographics then add the EmployeeSalary
and adds NULL for all the UNCOMMON values/ entries

*/



/*--LEFT JOIN aka LEFT OUTER JOIN
SELECT *
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

	prints out everything based on the common column which is EmployeeID in this case
	then it prints out all the LEFT uncommon entries and excludes the RIGHT uncommon ones
	IT IS EVERYTHING FROM THE LEFT TABLE AND AND EVERYTHING OVERLAPPING FROM THE LEFT TABLE 

	NB: In the place of the corresponding positions on the LEFT table
	will become NULL

	can be LEFT JOIN or LEFT OUTER JOIN

	In SQL, LEFT JOIN and LEFT OUTER JOIN are essentially the same, 
	and they are used interchangeably.

*/


/*--RIGHT JOIN or RIGHT OUTER JOIN
SELECT *
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

	prints out everything based on the common column which is EmployeeID in this case
	then it prints out all the RIGHT uncommon entries and excludes the RIGHT uncommon ones
	IT IS EVERYTHING FROM THE RIGHT TABLE AND AND EVERYTHING OVERLAPPING FROM THE RIGHT TABLE 

	NB: In the place of the corresponding positions on the RIGHT table
	will become NULL


	can be RIGHT JOIN or RIGHT OUTER JOIN

	In SQL, RIGHT JOIN and RIGHT OUTER JOIN are essentially the same, 
	and they are used interchangeably.
*/


SELECT EmployeeSalary.EmployeeID,FirstName,LastName,JobTitle, Salary
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


SELECT EmployeeDemographics.EmployeeID,FirstName,LastName,JobTitle, Salary
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


/* QXN 1:
Say Robert California (i guess this is a higher authority not in the data entries) is pressuring Michael Scott to meet 
his quarterly quota and Michael is almost there, he needs
a thousand more dollars and he comes up with the genius idea
to deduct pay ffor the highest paid employeeat his branch
besides himself


SELECT *
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael' AND LastName <> 'Scott' 
ORDER BY Salary DESC

I hadn't initially thought of this approach
My approach was to find an employee that had a salary
below the salary of Michael
 this is my version of the solution, I saw it on Chat GPT

Chat GPT:
SELECT *
FROM EmployeeDemographics e
JOIN EmployeeSalary s ON e.EmployeeID = s.EmployeeID
WHERE s.Salary < (SELECT Salary FROM EmployeeSalary WHERE EmployeeID = 1006)
ORDER BY s.Salary DESC;


I did this on my own, I'm so proud <3 :
SELECT *
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
	WHERE Salary < (SELECT MAX(Salary) 
						FROM EmployeeSalary)
	ORDER BY Salary DESC;

*/


/*QXN2:

Calculate the average salary for the Salesman
SELECT AVG(Salary) AS AverageSalemanSalary
FROM EmployeeSalary
WHERE JobTitle = 'Saleman'

OR 

SELECT JobTitle, AVG(Salary) AS AverageSalemanSalary
FROM EmployeeSalary
WHERE JobTitle = 'Saleman'
GROUP BY JobTitle

*/


/*
Union, Union All

	DIFFERENCE BETWEEN JOINS AND UNION
		>The Join: selects & combines tables based off a common column
		>The Union: selects all the data from both tables and put it into one output
					where all the data is in each column and not seperate it out
					and you dont have to choose which table you're choosing it from

	RULES FOR JOINS
		>There must be the same number of columns selected
		>The columns must be of the same data type
*/

me: just checking
but it works
it just orders them in order of Ascending of the first column i.e. EmployeeID in this case
regardless of the table from what i observed:

SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics

SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary

SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary

CREATE TABLE WareHouseEmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(6)

)



INSERT INTO WareHouseEmployeeDemographics VALUES
(1050, 'Ray', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female'),
(1013, 'Derryl', 'Philbin', NULL, 'Male')

UPDATE WareHouseEmployeeDemographics
SET FirstName = 'Darryl'
WHERE FirstName = 'Derryl';
MY ASSUMPTION:
	>ALTER TABLE table_name is made for columns and
	>UPDATE table_name is made for rows


it orders them in order of Ascending of the first column 
 Update: not its does not, it seems. I tried to do it again and it did not arrange,
I think I just need to ask Cha t GPT

UNION also removes any duplicates

i.e. EmployeeID in this case
SELECT EmployeeID, FirstName, LastName, Age, Gender
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics

SELECT * --EmployeeID, FirstName, LastName, Age, Gender
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics

UNION ALL
	Shows us all information regardless if it is a duplicate or not


SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

	The UNION joins these two tables unlike in OUTER JOIN where they are seperate

SELECT *
FROM EmployeeDemographics

SELECT *
FROM WareHouseEmployeeDemographics

SELECT * 
FROM SQL_Mytu t.. EmployeeDemographics
UNION ALL
SELECT *
FROM SQL_Mytut..WareHouseEmployeeDemographics
ORDER BY EmployeeID



/*
CASE STATEMENTS
> Case statements allow you to specify a condition
and what you want returned when that condition is met
*/

SELECT FirstName, LastName, Age,
CASE
	WHEN Age>30 THEN 'Old'
	WHEN Age BETWEEN 27 AND  30 THEN 'Young'
	ELSE 'Baby'
END  
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age
--WHERE continent = '', continent IS NULL
/* REMIDER OF THE GROUP BY function

The GROUP BY statement is often used with aggregate 
functions (COUNT(), MAX(), MIN(), SUM(), AVG()) 
to group the result-set by one or more columns.

SELECT FirstName, COUNT(Gender) AS Counting
FROM EmployeeDemographics
GROUP BY FirstName --Group by one with many rows in the SELECT statement


SELECT *
FROM EmployeeDemographics

SELECT*
FROM EmployeeSalary

SELECT *
FROM WareHouseEmployeeDemographics
*/

/* Partition by
The partition by statement is close to the 
GROUP BY statement. 
NB: The GROUP BY: reduces the number
of rows in the output by rowing them up and calculating
the sums or averages for each group
*/

Group By
The ff: means:
	>How many UNIQUE Genders there are,
	>then How many age counts there are 
	>for every UNIQUE Gender (Group By)
	(UPDATE: THIS IS A GOOD EXPLANATION, I was so confused then I read the explaination, now I understand. Bravo Naomi, bravo!)

SELECT Gender, COUNT(Age) AS Counting
FROM EmployeeDemographics
GROUP BY Gender

SELECT Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Age





--PARTITION BY
SELECT FirstName, LastName, Gender, Salary
, COUNT (Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


GROUP BY
In term of counting you will see that the GROUP BY 
does not show how many total Females therre are,
it inly counts each one and gives 1 as Total Gender
SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) AS TotalGender
, COUNT (Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary 


In term of counting you will see that the GROUP BY 
does not show how many total Females therre are,
it inly counts each one and gives 1 as Total Gender
To acheive sinimalr results you have to do this:

SELECT Gender, COUNT(Gender) AS TotalGender
, COUNT (Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY Gender


/* THE HAVING CLAUSE
It similar to the WHERE statement except the HAVING CLAUSE
is only used with Aggregate Functions
*/
SELECT JobTitle, COUNT(JobTitle) AS TotalJobTitles
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

/* Case Statement*/

SELECT FirstName, LastName, Age,
CASE
	WHEN  Age > 30 THEN 'Old'
	ELSE 'Young'
END AS AgeTitles
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age



BETWEEN
SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young' 
	ELSE 'Baby'
END AS AgeTitles
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age




SELECT FirstName, LastName, Age,
CASE
	WHEN Age = 38 THEN 'Hudson The Dinasaur'
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END AS AgeTitles
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age


/*Aliasing

-Aliasing - pronounced (eiliesing) means temporarily 
changing the table name or column name

-Helps with readability of script in cases of very long
table names or column names

*/

--ALIASING TABLES
SELECT FirstName
FROM EmployeeDemographics

--aka
SELECT FirstName
FROM EmployeeDemographics demo

--aka
SELECT demo.FirstName
FROM EmployeeDemographics demo

--aka
SELECT demo.FirstName
FROM EmployeeDemographics AS demo




ALIASING COLUMNS

SELECT FirstName AS Fname
FROM EmployeeDemographics

--aka
SELECT FirstName Fname
FROM EmployeeDemographics


SELECT FirstName +' '+ LastName AS FullName
FROM EmployeeDemographics

-- aka
SELECT FirstName +' '+ LastName FullName
FROM EmployeeDemographics

SELECT *
FROM EmployeeDemographics
ORDER BY 2 --means order by the second row


/* Advanced SQL Tutorial | CTE (Common Table Expression)

-It is a named temporary result which is used to manipulate 
the complex sub queries data.
-It only exists within a specific scope, once the query is 
cancelled out, it's like it never existed.
-A CTE is also only created in memory rather than a tempd file 
like a temp table would be. 
-But in general a CTE acts very much like a subquery.
-CTEs are sometimes called WITH queries.
*/

SELECT FirstName, LastName, Gender, Salary, 
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Salary > 45000
GROUP BY FirstName, LastName, Gender, Salary 
 

WITH  CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM EmployeeDemographics ed
JOIN EmployeeSalary es
	ON ed.EmployeeID = es.EmployeeID
WHERE Salary > 45000
)
SELECT *
FROM CTE_Employee
SELECT FirstName, AvgSalary
FROM CTE_Employee


The CTEs are not stored anywhere and NEED the CTE query 
 inorder to SELECT and it might be right after the query.


/* Temp Tables
- These are temporary tables and are created the very same way 
that normal tables are created.

-The only difference between a normal table and a temp table 
is the pound sign

-Reduces the Runtime
*/

CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(100),
Salary int,
)

SELECT *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES(
'1001', 'HR', '45000'
)

INSERT INTO #temp_Employee
SELECT *
FROM [SQL Tutorial]..EmployeeSalary
ALSO: SQL Tutorial.dbo.EmployeeSalary
NB: YOU DO NOT ALWAYS TO INSERT VALUES 
YOU CAN JUST INSERT ALL THE DATA FROM ANOTHER TABLE INTO 
THE TEMP TABLE AND THIS IS ONE OF THE BIGGEST USES OF 
A TEMP TABLE



CREATE TABLE #temp_Employee2(
JobTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT
)

DROP TABLE IF EXISTS #temp_Employee2
INSERT INTO #temp_Employee2
INSERTING DATA FROM A TABLE
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics ed
JOIN EmployeeSalary es
	ON ed.EmployeeID = es.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2

SELECT *
FROM #temp_Employee2
Temp Tables are also used a lot in store procedures

The temp tables are stored somewhere in the memory BUT 
NOT IN THE DATABASE so when we SELECT or run it again, it gives 
an error brcause there is already a temp table created


DROP TABLE IF EXISTS #temp_Employee2 --deletes the table if already exists and creates a new one
CREATE TABLE #temp_Employee2(
JobTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT
)


INSERT INTO #temp_Employee2
INSERTING DATA FROM A TABLE
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics ed
JOIN EmployeeSalary es
	ON ed.EmployeeID = es.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2

/*The Error: Msg 2714, Level 16, State 6, Line 844
There is already an object named '#temp_Employee2' in the database.
*/


/* STORED PROCEDURES
-A stored procedure is a group of SQL statements that have been
created and stored in that database.
- A stored procedure can accept input parameters.
- A stored procedure can be used over the network by
several different users ans we can all be using different input data.
-A stored procedure will also reduce network traffic and
increased perfomance.
-If we modify the stored procedure then anyone who
uses the stored procedure wil also be updated.

*/ 

CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

EXEC TEST






CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_Employee2(
JobTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT
)

DROP TABLE IF EXISTS #temp_Employee2
INSERT INTO #temp_Employee2
INSERTING DATA FROM A TABLE
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics ed
JOIN EmployeeSalary es
	ON ed.EmployeeID = es.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2

EXEC Temp_Employee @JobTitle = 'Saleman'

 