<h1 align="left">Answer</h1>

###

<h2 align="left">What is PostgreSQL?</h2>

###

<p align="left">A: PostgreSQL is a free open-source, object-relational database system.</p>

###

<h2 align="left">What is the purpose of a database schema in PostgreSQL?</h2>

###

<p align="left">A:  Schemas in PostgreSQL are logical containers that allow you to organize database objects such as tables, stored procedures, functions, etc.</p>

###

<h2 align="left">Explain the Primary Key and Foreign Key concepts in PostgreSQL.</h2>

###

<p align="left">A:  A primary key is a column (or group of columns) that uniquely identifies each row in a table. It cannot be empty (NULL) and must be unique.<br><br>A foreign key is a column in one table that refers to the primary key of another table. It helps create a relationship between two tables.</p>

###

<h2 align="left">What is the difference between the VARCHAR and CHAR data types?</h2>

###

<p align="left">A:  VARCHAR (Variable Character): Stores variable-length strings. You specify a maximum length, like VARCHAR(50), but the actual storage depends on the length of the data you put in.<br><br>CHAR (Character): Stores fixed-length strings. You specify a length, like CHAR(10), and it always uses exactly that many characters.</p>

###

<h2 align="left">Explain the purpose of the WHERE clause in a SELECT statement.</h2>

###

<p align="left">A:  The WHERE clause is used to filter rows from a table when you run a SELECT query. It lets you specify a condition so that only the rows that meet the condition are returned.</p>

###

<h2 align="left">What are the LIMIT and OFFSET clauses used for?</h2>

###

<p align="left">A:  In PostgreSQL, LIMIT and OFFSET are used to control the number of rows returned by a query. LIMIT specifies how many rows to return. OFFSET skips a number of rows before starting to return results.</p>

###

<h2 align="left">How can you modify data using UPDATE statements?</h2>

###

<p align="left">A:  The UPDATE statement is used to change existing data in a table. You specify: Which table you want to update, Which columns to change and their new values, And a condition to decide which rows should be updated.<br>UPDATE table_name<br>SET column1 = new_value1, column2 = new_value2, ...<br>WHERE condition;</p>

###

<h2 align="left">What is the significance of the JOIN operation, and how does it work in PostgreSQL?</h2>

###

<p align="left">A:  **JOIN** in PostgreSQL is used to combine data from multiple tables using related columns (like foreign keys). It helps fetch connected data in one query.</p>

###

<h2 align="left">Explain the GROUP BY clause and its role in aggregation operations.</h2>

###

<p align="left">A:  **GROUP BY** is used to group rows with the same values so we can apply aggregate functions like `COUNT()`, `SUM()`, or `AVG()` to each group.</p>

###

<h2 align="left">How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?</h2>

###

<p align="left">A:  In PostgreSQL, you can calculate aggregate functions using SQL queries:<br><br>COUNT() → counts rows<br><br>SUM() → adds values<br><br>AVG() → calculates average<br><br><br>SELECT COUNT(*), SUM(price), AVG(price)<br>FROM products;</p>

###