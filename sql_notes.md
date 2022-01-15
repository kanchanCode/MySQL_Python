# DBMS
Collection of related information -> Database
Database Management Systems (DBMS) are software systems used to store, retrieve, and run queries on data. 
A DBMS serves as an interface between an end-user and a database, allowing users to create, read, update, and delete data in the database.

# Types of Database
1. Relational Database(SQL) - organize data into one or more tables
2. Non-Relational(noSQL)- traditional table key-value stores, documents(like JSON),graphs,flexible tables 
noSQL DBMS- mongoDB,dynamoDB,firebase etc

# Types of DBMS
1. Hierachial DBMS
2. Network DBMS
3. Realtional DBMS
4. Object Oriented DBMS


# RDMS
RDBMS stands for Relational Database Management System.
RDBMS defines database relationships in the form of tables.The tables are related to each other-based on data common to each.
Relational DataBase Management System (RDBMS) is a software application that −
1. Enables you to implement a database with tables, columns and indexes.
2. Guarantees the Referential Integrity between rows of various tables.
3. Updates the indexes automatically.
4. Interprets an SQL query and combines information from various tables.

# MySQL
MySQL is a widely used relational database management system (RDBMS).
MySQL is free and open-source(Oracle Corporation).
MySQL is ideal for both small and large applications.
MySQL is very fast, reliable, scalable, and easy to use.

# SQL V/s MySQL
1. SQL is a language for querying databases and MySQL is an open source database product. 
2. SQL is used for accessing, updating and maintaining data in a database and MySQL is an RDBMS that allows users to keep the data that exists in a database organized. 
3. SQL does not change (much), as it is a language.


# Terminologies in MySQL
1. Table: A table is a collection of related data entries, and it consists of columns and rows.
2. Column: A column holds specific information about every record in the table.
3. Row: A record (or row) is each individual entry that exists in a table.
4. Redundancy − Storing data twice, redundantly to make the system faster.
5. Primary Key − A primary key is unique. A key value can not occur twice in one table. With a key, you can only find one row.
6. Foreign Key − A foreign key is the linking pin between two tables.
7. Compound Key − A compound key (composite key) is a key that consists of multiple columns, because one column is not sufficiently unique.
8. Index − An index in a database resembles an index at the back of a book.
9. Referential Integrity − Referential Integrity makes sure that a foreign key value always points to an existing row.


# SQL Commands catrgories OR 4 types of languages in SQL:
1. DDL – Data Definition Language
Create,Drop,Alter,Truncate
2. DML – Data Manipulation Language
Insert,Update,Delete,
3. DCL – Data Control Language
Grant,Revoke
4. DQl – Data Query Language 
Select
5. TCL – Transaction Control Language
Commit,Savepoint,Rollback,Set Transaction,Set constraint


# Administrative MySQL Command
1. USE Databasename − This will be used to select a database in the MySQL workarea.
2. SHOW DATABASES − Lists out the databases that are accessible by the MySQL DBMS.
3. SHOW TABLES − Shows the tables in the database once a database has been selected with the use command.
4. SHOW COLUMNS FROM tablename: Shows the attributes, types of attributes, key information, whether NULL is permitted, defaults, and other information for a table.
5. SHOW INDEX FROM tablename − Presents the details of all indexes on the table, including the PRIMARY KEY.
6. SHOW TABLE STATUS LIKE tablename\G − Reports details of the MySQL DBMS performance and statistics.

# Mostly used commands
1. SELECT - extracts data from a database
SELECT * FROM table_name;
OR
SELECT column1, column2, ...
FROM table_name;

2. UPDATE - updates data in a database
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

3. DELETE - deletes data from a database
DELETE FROM table_name WHERE condition;

4. INSERT INTO - inserts new data into a database
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
OR
INSERT INTO table_name
VALUES (value1, value2, value3, ...);

5. CREATE DATABASE - creates a new database
CREATE DATABASE databasename;
    DROP DATABASE-
DROP DATABASE databasename;

6. ALTER DATABASE - modifies a database
ALTER {DATABASE | SCHEMA} [databasename]
alter_option ...

7. CREATE TABLE - creates a new table
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

8. ALTER TABLE - modifies a table
ALTER TABLE table_name
ADD column_name datatype;

9. DROP TABLE - deletes a table
DROP TABLE table_name;

10. CREATE INDEX - creates an index (search key)
CREATE INDEX idx_lastname
ON table (column);

11. DROP INDEX - deletes an index
ALTER TABLE table_name
DROP INDEX index_name;

To filter records

WHERE-
SELECT column1, column2, ...
FROM table_name
WHERE condition;
{
AND Syntax-
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
OR Syntax-
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
NOT Syntax-
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;
}

HAVING-
The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

ORDER BY-
The ORDER BY keyword is used to sort the result-set in ascending or descending order.
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

GROUP BY-
The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

DISTINCT-
The SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT DISTINCT column1, column2, ...
FROM table_name;

NULL & NOT NULL-
SELECT column_names
FROM table_name
WHERE column_name IS NULL|IS NOT NULL;


# MySQL DataTypes:
In MySQL there are three main data types: string, numeric, and date and time.

String                             Integer                         Date & Time

CHAR(size)	                       BIT(size)                       DATE	
VARCHAR(size)	                   TINY(size)	                   DATETIME(fsp)	
BINARY(size)	                   BOOL                            TIMESTAMP(fsp)	
VARBINARY(size)	                   BOOLEAN                         TIME(fsp)	    
TINYBLOB                           SMALLINT(size)	               YEAR	
TINYTEXT                           INT(size)
TEXT(size)		                   INTEGER(size)	
BLOB(size)	                       BIGINT(size)	
MEDIUMTEXT                         FLOAT(size, d)	
MEDIUMBLOB                         FLOAT(p)	
LONGTEXT                           DOUBLE(size, d)	
LONGBLOB                           DOUBLE PRECISION(size, d)
ENUM(val1, val2, val3, ...)	       DECIMAL(size, d)	
SET(val1, val2, val3, ...)	

# Keys:
1. Keys in DBMS is an attribute or set of attributes which helps you to identify a row(tuple) in a relation(table).
2. A table could contain thousands of records. Moreover, the records could be duplicated.So,keys in RDBMS ensure that you can uniquely identify a table record despite these challenges.
3. Allows you to establish a relationship between and identify the relation between tables

# Types of keys:
1. Super Key – A super key is a group of single or multiple keys which identifies rows in a table.

2. Primary Key – is a column or group of columns in a table that uniquely identify every row in that table.A table cannot have more than one primary key.
Two rows can’t have the same primary key value
It must for every row to have a primary key value.
The primary key field cannot be null.
The value in a primary key column can never be modified or updated if any foreign key refers to that primary key.

3. Candidate Key –(minimal set of super key)
A candidate key is an attribute or set of an attribute which can uniquely identify a tuple.
The remaining attributes except for primary key are considered as a candidate key. The candidate keys are as strong as the primary key.

4. Alternate Key – is a column or group of columns in a table that uniquely identify every row in that table(other than primary key).
A table can have multiple choices for a primary key but only one can be set as the primary key. All the keys which are not primary key are called an Alternate Key.

5. Foreign Key – is a column that creates a relationship between two tables. The purpose of Foreign keys is to maintain data integrity and allow navigation between two different instances of an entity.
A foreign key may accept multiple null values.
You can have multiple foreign keys in a table.

6. Compound Key – has two or more attributes that allow you to uniquely recognize a specific record. It is possible that each column may not be unique by itself within the database.
However, when combined with the other column or columns the combination of composite keys become unique.

7. Composite Key – is a combination of two or more columns that uniquely identify rows in a table. The combination of columns guarantees uniqueness, though individual uniqueness is not guaranteed.
The difference between compound and the composite key is that any part of the compound key can be a foreign key, but the composite key may or maybe not a part of the foreign key.

8. Surrogate Key – An artificial key which aims to uniquely identify each record is called a surrogate key. These kind of key are unique because they are created when you don’t have any natural primary key.
Surrogate key in DBMS is usually an integer. A surrogate key is a value generated right before the record is inserted into a table.

# Joins 
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

Types of joins

1. Cross Join
The CARTESIAN JOIN is also known as CROSS JOIN. In a CARTESIAN JOIN there is a join for each row of one table to every row of another table.

SELECT table1.column1 , table1.column2, table2.column1...
FROM table1
CROSS JOIN table2;


2. Natural Join
In Natural Join, The resulting table will contain all the attributes of both the tables but keep only one copy of each common column

SYNTAX: 
SELECT * 
FROM table1 NATURAL JOIN table2;

3. Equi Join OR Inner Join
The INNER JOIN keyword selects records that have matching values in both tables.
In Inner Join, The resulting table will contain all the attribute of both the tables including duplicate columns also

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

4. Self join
A self join is a regular join, but the table is joined with itself.

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

example
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

(<>	Not equal to)

5. Outer Join 
5.1. *Left Join*
Returns all records from the left table, and the matched records from the right table

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

example
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

5.2. *Right Join*
Returns all records from the right table, and the matched records from the left table

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

5.3. *Full Join* 
Returns all records when there is a match in either left or right table
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

example:
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

# Unions
The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

# Stored Procedures and Cursors
A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

To create procedure :-
CREATE PROCEDURE procedure_name
AS
sql_statement
GO;

To execute procedure :-
EXEC procedure_name;

*with one parameter*

Example:
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

EXEC SelectAllCustomers @City = 'London';

*with multiple parameters*

Example:
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';

*subprogram*
A subprogram is a program unit/module that performs a particular task. 
A subprogram can be invoked by another subprogram or program which is called the calling program.

*sub program in PL/SQL*
PL/SQL provides two kinds of subprograms −

Functions − These subprograms return a single value; mainly used to compute and return a value.

Procedures − These subprograms do not return a value directly; mainly used to perform an action.

# Triggers 

A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.
-- CREATE
--     TRIGGER `event_name` BEFORE/AFTER INSERT/UPDATE/DELETE
--     ON `database`.`table`
--     FOR EACH ROW BEGIN
-- 		-- trigger body
-- 		-- this code is applied to every
-- 		-- inserted/updated/deleted row
--     END;

Helps us to automate the data alterations.
Allows us to reuse the queries once written.
Provides a method to check the data integrity of the database.
Helps us to detect errors on the database level.
Allows easy auditing of data.

# Cursors and Table Indexing
*Cursors*
The major function of a cursor is to retrieve data, one row at a time, from a result 

1. Declare a Cursor
DECLARE <cursor_name> CURSOR FOR <select_statement>;  

2. Open a Cursor
OPEN <cursor_name>;

3. Fetch the Cursor
FETCH <cursor_name> INTO <variable_list>;

4. Close the Cursor
CLOSE <cursor_name>;

MySQL cursor has three types of properties.
 
1. Read Only
The data in the underlying table cannot be modified via a cursor.
 
2. Non_Scrollable
Only rows can be retrieved in the order specified by the SELECT statement. In the reverse order, users can not retrieve records. Additionally, in the result set, users cannot skip rows or jump to a particular row.
 
3. Asensitive
An asensitive cursor is used to points the actual data, whereas a temporary copy of the data is used by an insensitive cursor used. An asensitive cursor performs faster than an insensitive cursor because it does not have to make a temporary copy of data.

# *Indexing*
CREATE INDEX tablename_columnname_idx ON table(column_name);
CREATE INDEX tablename_columnnames_idx ON table(column_name1,columnname2);

Saves time ,takes storage 

# ER - DIAGRAM:

1. Entity(Rectangle): An object we want to model & store information about
2. Attribute(Oval): Specific pieces of info. about an entity
3. Primary key(Oval + text underline): An attribute(s) that uniquely identify an entry in the database table.
4. Composite attribute(Oval and broken ) : An attribute that can be broken up into sub-attributes.
5. Multi-valued attribute(Double oval): An attribute that can have more than one value 
6. Derived attribute(Dashed line oval): An attribute that can be derived from the other attributes
7. Weak Entity: An entity that cannot be uniquely identified by its attributes alone. 

Rectangle: Represents Entity sets.
Ellipses: Attributes
Diamonds: Relationship Set
Lines: They link attributes to Entity Sets and Entity sets to Relationship Set
Double Ellipses: Multivalued Attributes
Dashed Ellipses: Derived Attributes
Double Rectangles: Weak Entity Sets
Double Lines: Total participation of an entity in a relationship set

Relationships : Defines a relationship between two entities
Relationship Cardinality
1. One to One - 1:1
2. One to Many - 1:N
3. Many to One - N:1
4. Many to Many - N:M

# Quality Analysis and Optimization

# Data Normalization 

# Import/Export using Python Connectivity DONE 