-- 1. Create a table called employees with the following structure?
-- emp_id (integer, should not be NULL and should be a primary key)Q
-- emp_name (text, should not be NULL)Q
--- age (integer, should have a check constraint to ensure the age is at least 18)Q
-- email (text, should be unique for each employee)Q
-- salary (decimal, with a default value of 30,000).
-- Write the SQL query to create the above table with all constraints.

CREATE database Assignment;
use Assignment;
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INT CHECK (age >= 18),
    email TEXT UNIQUE,
    salary DECIMAL(10, 2) DEFAULT 30000.00
);

-- 2.Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
-- examples of common types of constraints;
-- Purpose of Constraints in MySQL
 -- Constraints in MySQL are rules applied to table columns that help maintain the integrity, accuracy, and consistency of the data stored in a database. They serve several important purposes:

 -- Data Integrity: Constraints ensure that the data entered into the database adheres to specific rules, preventing invalid data from being stored. This is crucial for maintaining the reliability of the database.

 -- Consistency: By enforcing rules across the database, constraints help maintain consistency in the data. This means that the data remains uniform and adheres to the defined standards.

-- Error Prevention: Constraints prevent the entry of invalid or duplicate data, reducing the likelihood of errors and inconsistencies in the database.

-- Business Rules Enforcement: Constraints can enforce business rules at the database level, ensuring that the data complies with organizational policies and requirements.

-- Common Types of Constraints in MySQL
-- Primary Key Constraint:
CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY,
    username VARCHAR(50)
);


-- A primary key uniquely identifies each record in a table and cannot contain NULL values. It ensures that each row is distinct.
-- Example: In a users table, the user_id column can be defined as a primary key.

-- 2. Foreign Key Constraint:

-- A foreign key establishes a relationship between two tables by ensuring that a value in one table matches a value in another table. This maintains referential integrity.
-- Example: In an orders table, the customer_id column can be a foreign key referencing the customer_id in a customers table.

CREATE TABLE orders (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 3. Unique Constraint:

-- A unique constraint ensures that all values in a column are distinct across the table, preventing duplicate entries.
-- Example: In a products table, the product_code column can be defined as unique.
-- sql

CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    product_code VARCHAR(20) UNIQUE
);

-- 4. Check Constraint:

-- A check constraint ensures that all values in a column satisfy a specific condition, enforcing domain integrity.
-- Example: In an employees table, a check constraint can ensure that the age column contains values greater than or equal to 18.

CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    age INT CHECK (age >= 18)
);

-- 5. Not Null Constraint:

-- A not null constraint ensures that a column cannot contain NULL values, meaning that a value must be provided for that column.
-- Example: In a students table, the name column can be defined as NOT NULL.

CREATE TABLE students (
    student_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
-- your answer.

-- Applying the NOT NULL Constraint
-- The NOT NULL constraint is applied to a column in a database table to ensure that it cannot contain NULL values. This constraint is important for several reasons:

-- Data Integrity: By enforcing the NOT NULL constraint, you ensure that every record in the table has a valid value for that column. This is crucial for maintaining the integrity of the data, as NULL values can lead to ambiguity and inconsistency.

-- Business Logic: In many cases, certain fields are essential for the business logic of the application. For example, in a users table, the username or email fields are often required for user identification and communication. Applying the NOT NULL constraint ensures that these critical fields are always populated.

-- Simplified Queries: When a column is defined as NOT NULL, it simplifies query logic. You do not need to account for NULL values in your queries, which can make them easier to write and understand.

-- Performance: In some cases, NOT NULL constraints can improve performance. Indexes on NOT NULL columns can be more efficient because the database engine does not have to handle NULL values.

-- Can a Primary Key Contain NULL Values?
-- No, a primary key cannot contain NULL values. This is a fundamental rule in relational database design for the following reasons:

-- Uniqueness Requirement: A primary key is used to uniquely identify each record in a table. If a primary key could contain NULL values, it would violate the uniqueness requirement, as NULL is not considered a value and cannot be used to distinguish between records.

-- Referential Integrity: Primary keys are often referenced by foreign keys in other tables to establish relationships. If a primary key could be NULL, it would create ambiguity in these relationships, making it difficult to maintain referential integrity.

-- Data Consistency: Allowing NULL values in a primary key would lead to inconsistencies in the data. It would be impossible to guarantee that every record can be uniquely identified, which is a core principle of relational databases.

-- 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
-- example for both adding and removing a constraint.

-- Steps and SQL Commands to Add or Remove Constraints on an Existing Table in MySQL
-- In MySQL, you can modify existing tables to add or remove constraints using the ALTER TABLE statement. Below are the steps and SQL commands for both adding and removing constraints.

-- Adding a Constraint
 -- To add a constraint to an existing table, you can use the ALTER TABLE statement followed by the ADD CONSTRAINT clause. Here are the steps:

-- Identify the Table: Determine which table you want to modify.
-- Define the Constraint: Specify the type of constraint you want to add (e.g., PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL).
-- Execute the SQL Command: Use the appropriate SQL command to add the constraint.
-- Example: Adding a UNIQUE Constraint
-- Suppose you have a table called employees and you want to add a UNIQUE constraint to the email column to ensure that all email addresses are unique.

ALTER  TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);
-- Removing a Constraint
-- To remove a constraint from an existing table, you can also use the ALTER TABLE statement, but this time you will use the DROP CONSTRAINT clause. Here are the steps:

-- Identify the Table: Determine which table you want to modify.
-- Identify the Constraint Name: You need to know the name of the constraint you want to remove. If you did not specify a name when creating the constraint, MySQL automatically generates one.
-- Execute the SQL Command: Use the appropriate SQL command to drop the constraint.
-- Example: Removing a UNIQUE Constraint
-- Continuing with the previous example, if you want to remove the UNIQUE constraint from the email column, you would execute the following command. Note that you need to know the name of the constraint (in this case, unique_email).
ALTER TABLE employees
DROP CONSTRAINT unique_email;

-- 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
-- Provide an example of an error message that might occur when violating a constraint.

-- Consequences of Violating Constraints in MySQL
-- When you attempt to insert, update, or delete data in a way that violates constraints in MySQL, several consequences can occur:

-- Transaction Failure: The operation will fail, and the database will not execute the insert, update, or delete command. This ensures that the integrity of the database is maintained.

-- Error Messages: MySQL will generate an error message indicating the nature of the violation. This message helps developers and database administrators understand what went wrong.

-- Data Integrity Issues: Violating constraints can lead to data integrity issues, such as duplicate entries, orphaned records, or invalid data. The database management system (DBMS) prevents these issues by enforcing constraints.

-- Rollback of Changes: If the operation is part of a transaction, the entire transaction may be rolled back, meaning that any changes made during that transaction will be undone.

-- Example of Constraint Violation
-- Scenario: Unique Constraint Violation
-- Suppose you have a table called users with a UNIQUE constraint on the username column. If you try to insert a new user with a username that already exists in the table, you will violate the UNIQUE constraint.

-- Table Structure:
CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY,
    username VARCHAR(50) UNIQUE
);
-- Inserting Data:
INSERT INTO users (user_id, username) VALUES (1, 'john_doe');
INSERT INTO users (user_id, username) VALUES (2, 'john_doe');  -- This will violate the UNIQUE constraint

-- Error Message
-- When you attempt to execute the second INSERT statement, you will receive an error message similar to the following:

-- ERROR 1062 (23000): Duplicate entry 'john_doe' for key 'username'

-- 6. You created a products table without constraints as follows:
-- To modify the existing products table to set product_id as a primary key and to set a default value of 50.00 for the price column, you can use the ALTER TABLE statement in MySQL. Here’s how you can do it:

-- Step 1: Add Primary Key Constraint
-- You will need to alter the product_id column to set it as a primary key.

-- Step 2: Set Default Value for Price
-- You will also need to alter the price column to set its default value to 50.00.

-- Here are the SQL commands to achieve both modifications:
-- Step 1: Set product_id as the primary key
ALTER TABLE products
ADD PRIMARY KEY (product_id);

-- Step 2: Set default value for price
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;
-- Complete Example
-- If you want to combine these changes into a single session, you can run the following commands after creating the table:
-- Create the products table
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Set product_id as the primary key
ALTER TABLE products
ADD PRIMARY KEY (product_id);

-- Set default value for price
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;
-- Note
-- If you are using MySQL version 8.0 or later, you can use the ALTER COLUMN syntax as shown above. If you are using an earlier version, you might need to use the following syntax to set the default value:
ALTER TABLE products
MODIFY price DECIMAL(10, 2) DEFAULT 50.00;
ALTER TABLE products
MODIFY price DECIMAL(10, 2) DEFAULT 50.00;
-- Verify Changes
-- After executing the above commands, you can verify the changes by describing the table:
DESCRIBE products;
-- This will show you the structure of the products table, including the primary key and the default value for the price column.

-- 7. You have two tables:

-- Students:

-- student_id | student_name | class_id
-- 1          | Alice        | 101
-- 2          | Bob          | 102
-- 3          | charlie      | 101

-- classes:

-- class_id  | class_name
-- 101       | Math
-- 102       | Science
-- 103       | History 

-- Write a query to fetch the student_name and class_name for each student using on INNER JOIN 

-- To fetch the student_name and class_name for each student using an INNER JOIN in MySQL, you can use the following SQL query:
SELECT 
    s.student_name, 
    c.class_name
FROM 
    Students s
INNER JOIN 
    classes c ON s.class_id = c.class_id;
    
    -- Explanation:
-- SELECT s.student_name, c.class_name: This part specifies the columns you want to retrieve, which are the student_name from the Students table and the class_name from the classes table.
-- FROM Students s: This indicates that the main table we are querying from is Students, and we are giving it an alias s for easier reference.
-- INNER JOIN classes c ON s.class_id = c.class_id: This part performs the INNER JOIN operation between the Students table and the classes table based on the matching class_id in both tables. The classes table is given an alias c.
-- When you run this query, it will return the names of the students along with the names of the classes they are enrolled in.

-- 8. Consider the following three tables:
-- orders:
-- order_id  |   order_date | customer_id
-- 1         | 2024-01-01   | 101
-- 2         | 2024_01_03   | 102

-- Customers:

-- customer_id | Customer_name
-- 101         | Alice
-- 102         | Bob

-- Products:

-- product_id | product_name | order_id
--  1          | Laptop         | 1
--  2         | phone        | Null

-- Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order
-- Hint: (use INNER JOIN and LEFT JOIN).

SELECT 
    o.order_id, 
    c.Customer_name, 
    p.product_name
FROM 
    Products p
LEFT JOIN 
    orders o ON p.order_id = o.order_id
LEFT JOIN 
    Customers c ON o.customer_id = c.customer_id;
    
    -- Explanation:
-- FROM Products p: This indicates that we are starting with the Products table and giving it an alias p.
-- LEFT JOIN orders o ON p.order_id = o.order_id: This LEFT JOIN ensures that all products are included in the result set, even if they do not have a corresponding order. If a product does not have an associated order, the order_id will be NULL.
-- LEFT JOIN Customers c ON o.customer_id = c.customer_id: This LEFT JOIN connects the orders table to the Customers table. If there is no order associated with a product, the customer_name will also be NULL.

-- To find the total sales amount for each product using an INNER JOIN and the SUM() function in MySQL, you can use the following SQL query:
-- SELECT 
   --  p.product_name, 
   --  SUM(s.Amount) AS total_sales_amount
-- FROM 
   --  Sales s
-- INNER JOIN 
--     products p ON s.product_id = p.product_id
-- GROUP BY 
   --  p.product_name;
   
   -- Explanation:
-- SELECT p.product_name, SUM(s.Amount) AS total_sales_amount: This part selects the product name and calculates the total sales amount for each product using the SUM() function. The result of the sum is given an alias total_sales_amount.

-- FROM Sales s: This indicates that the main table we are querying from is Sales, and we are giving it an alias s.

-- INNER JOIN products p ON s.product_id = p.product_id: This INNER JOIN connects the Sales table with the products table based on the matching product_id in both tables.

-- GROUP BY p.product_name: This groups the results by product_name, allowing the SUM() function to calculate the total sales amount for each product.

-- 10. You are given three tables:
-- Orders:

-- order_id | order_name  | customer_id
-- 1        | 2024-01-02  | 1
-- 2        | 2024-01-05  | 2

-- Customers:

-- Customer_id  |  customer_name 
--  1           |  Alice
--  2           | Bob

-- order_details:

-- order_id     |  product_id    | quantity
-- 1            | 101            | 2 
-- 1            |  102           | 1
-- 2            | 101            | 3

-- write a query to disply the orders_id, customer_name, and the quantity of products of products ordered by each customer using on INNER JOIN between all three tables: 
-- To display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between the three tables (Orders, Customers, and order_details), you can use the following SQL query:

SELECT 
    o.order_id, 
    c.customer_name, 
    od.quantity
FROM 
    Orders o
INNER JOIN 
    Customers c ON o.customer_id = c.customer_id
INNER JOIN 
    order_details od ON o.order_id = od.order_id;
    
    
    -- 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
   --  In a typical database schema for a movie database like "Maven Movies," you would generally have several tables, each with its own primary keys and foreign keys. Below, I will outline the common primary keys and foreign keys you might find in such a database, along with a discussion of their differences.

-- Primary Keys
-- A primary key is a unique identifier for a record in a table. It ensures that each record can be uniquely identified and cannot be null. Here are some examples of primary keys you might find in a Maven Movies database:

-- Movies Table

-- Primary Key: movie_id (unique identifier for each movie)
--  Actors Table

-- Primary Key: actor_id (unique identifier for each actor)
-- Directors Table
-- Primary Key: director_id (unique identifier for each director)
-- Genres Table

-- Primary Key: genre_id (unique identifier for each genre)
-- Reviews Table

-- Primary Key: review_id (unique identifier for each review)
-- Foreign Keys
-- A foreign key is a field (or a collection of fields) in one table that uniquely identifies a row of another table. It establishes a relationship between the two tables. Here are some examples of foreign keys you might find in a Maven Movies database:

-- Movies Table

-- Foreign Key: director_id (references director_id in the Directors table)
-- Foreign Key: genre_id (references genre_id in the Genres table)
-- Movie_Actors Table (a junction table for many-to-many relationships between Movies and Actors)

-- Foreign Key: movie_id (references movie_id in the Movies table)
-- Foreign Key: actor_id (references actor_id in the Actors table)
-- Reviews Table

-- Foreign Key: movie_id (references movie_id in the Movies table)
-- Foreign Key: user_id (references user_id in the Users table, if applicable)
-- Differences Between Primary Keys and Foreign Keys
-- Purpose:

-- Primary Key: Serves as a unique identifier for records within its own table. It ensures that no two records can have the same primary key value.
-- Foreign Key: Establishes a link between two tables. It allows for the creation of relationships between records in different tables.
-- Uniqueness:

-- Primary Key: Must contain unique values and cannot contain NULL values.
-- Foreign Key: Can contain duplicate values and can also contain NULL values (unless specified otherwise). It does not have to be unique in the table where it is defined.
-- Table Relationship:

-- Primary Key: Exists within a single table and defines the identity of records in that table.
-- Foreign Key: Exists in one table and references the primary key of another table, thereby creating a relationship between the two tables.
-- Data Integrity:

-- Primary Key: Ensures that each record is unique and identifiable.
-- Foreign Key: Enforces referential integrity between tables, ensuring that relationships between records are valid.
    
    -- 2- List all details of actors
    -- To list all details of actors from a typical movie database, you would typically query the Actors table. The specific details available in the Actors table can vary depending on the database schema, but common attributes might include:

-- actor_id (Primary Key)
-- first_name
-- last_name
-- date_of_birth
-- gender
-- nationality
-- biography
-- profile_picture (URL or path to the actor's image)
-- SQL Query
-- Assuming the table is named Actors, you can use the following SQL query to retrieve all details of actors:

SELECT *
FROM Actors;

-- Explanation:
-- SELECT * retrieves all columns from the Actors table.
-- FROM Actors specifies the table from which to retrieve the data.
-- Example Output
-- The output of this query might look something like this (assuming some sample data):

-- actor_id	first_name	last_name	date_of_birth	gender	nationality	biography	profile_picture
-- 1	Robert	Downey Jr.	1965-04-04	Male	American	An American actor...	/images/robert.jpg
-- 2	Scarlett	Johansson	1984-11-22	Female	American	An American actress...	/images/scarlett.jpg
-- 3	Chris	Hemsworth	1983-08-11	Male	Australian	An Australian actor...	/images/chris.jpg
-- Note
-- The actual column names and data types may vary based on the specific implementation of the database.
-- If you want to filter or sort the results, you can add WHERE, ORDER BY, or other clauses to the query as needed. For example, to sort actors by their last name, you could modify the query as follows:
-- sql


SELECT *
FROM Actors
ORDER BY last_name;
-- This will return all actor details sorted alphabetically by their last name.
-- 3 List all customer information from DB.


-- To list all customer information from a database, you would typically query the Customers table. The specific details available in the Customers table can vary depending on the database schema, but common attributes might include:

-- customer_id (Primary Key)
-- customer_name
-- email
-- phone_number
-- address
-- registration_date
-- SQL Query
--  the table is named Customers, you can use the following SQL query to retrieve all details of customers:

-- sql
-- SELECT *
-- FROM Customers;
-- Explanation:
-- SELECT * retrieves all columns from the Customers table.
-- FROM Customers specifies the table from which to retrieve the data.
-- Example Output
-- The output of this query might look something like this (assuming some sample data):

-- 4 -List different countries.
-- To list different countries from a database, you would typically query a table that contains country information. The specific table and its structure can vary depending on the database schema, but common attributes might include:

-- country_id (Primary Key)
-- country_name
-- country_code
-- Assuming there is a table named Countries, you can use the following SQL query to retrieve a list of different countries:

-- SQL Query 
-- SELECT DISTINCT country_name
-- FROM Countries;
-- Explanation:
-- SELECT DISTINCT country_name retrieves unique country names from the Countries table, ensuring that each country is listed only once.
-- FROM Countries specifies the table from which to retrieve the data.
-- Example Output
-- The output of this query might look something like this (assuming some sample data):

-- country_name
-- United States
-- Canada
-- United Kingdom
-- Australia
-- Germany
-- France
-- Japan
-- India
-- Note
-- The actual table name and column names may vary based on the specific implementation of the database.
-- If you want to sort the countries alphabetically, you can modify the query as follows:
-- sql 
-- SELECT DISTINCT country_name
-- FROM Countries
-- ORDER BY country_name;
-- This will return a list of unique country names sorted in alphabetical order. If your database schema includes additional details about countries, you can adjust the query to include those as well.
 -- 5 -Display all active customers.
 -- To display all active customers, you would typically query the customers table. Assuming there is a column that indicates whether a customer is active (e.g., is_active), the query might look like this:
SELECT *
FROM customers
WHERE is_active = 1;  -- Assuming 1 indicates active customers
-- If there is no is_active column, you may need to define what "active" means based on your database schema (e.g., customers who have made a rental in the last year).

-- 6 -List of all rental IDs for customer with ID 1.
-- To get all rental IDs for a specific customer, you would typically join the rentals table with the customers table. Here’s how you can do it:
SELECT rental_id
FROM rentals
WHERE customer_id = 1;  -- Assuming customer ID is 1

-- 7 - Display all the films whose rental duration is greater than 5 .
-- To display films with a rental duration greater than 5, you would query the films table. Assuming there is a column named rental_duration, the query would look like this:


SELECT *
FROM films
WHERE rental_duration > 5;
-- Summary
-- Active Customers: Query the customers table for active status.
-- Rental IDs for Customer ID 1: Query the rentals table for rentals associated with customer ID 1.
-- Films with Rental Duration > 5: Query the films table for rental durations greater than 5.
-- Make sure to adjust the table and column names according to your actual database schema.

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.

-- To count the number of films with a replacement cost in the specified range, you can use the following query:


SELECT COUNT(*) AS total_films
FROM films
WHERE replacement_cost > 15 AND replacement_cost < 20;

-- 9 - Display the count of unique first names of actors.
-- To count the unique first names of actors, you would typically query the actors table (or whatever table contains actor information). Here’s how you can do it:


SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actors;

-- 10- Display the first 10 records from the customer table .
 To retrieve the first 10 records from the customers table, you can use the following query. Note that the exact syntax may vary slightly depending on the SQL dialect you are using (e.g., MySQL, PostgreSQL, etc.):

sql

SELECT *
FROM customers
LIMIT 10;  -- For MySQL and PostgreSQL

-- If you are using SQL Server, you would use:

-- SELECT TOP 10 *
-- FROM customers;
-- Summary
-- Total Films with Replacement Cost: Count films with a replacement cost between $15 and $20.
-- Count of Unique First Names of Actors: Count distinct first names in the actors table.
-- First 10 Records from Customer Table: Retrieve the first 10 records from the customers table.
-- Make sure to adjust the table and column names according to your actual database schema.

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
-- To retrieve the first 3 records of customers whose first name starts with the letter 'b', you can use the following query:


-- SELECT *
-- FROM customers
-- WHERE first_name LIKE 'b%'
-- LIMIT 3;  -- For MySQL and PostgreSQL
-- If you are using SQL Server, you would use:

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.
-- To get the names of the first 5 movies rated as 'G', you can use the following query:


SELECT title  -- Assuming the column for movie names is 'title'
FROM films
WHERE rating = 'G'
LIMIT 5;  -- For MySQL and PostgreSQL
 -- For SQL Server, you would use:

-- SELECT TOP 5 title
-- FROM films
-- WHERE rating = 'G';


-- SELECT TOP 3 *
-- FROM customers
-- WHERE first_name LIKE 'b%';

-- 13-Find all customers whose first name starts with "a".
-- To find all customers whose first name starts with the letter 'a', you can use the following query:

SELECT *
FROM customers
WHERE first_name LIKE 'a%';
-- Summary
-- First 3 Customers with First Name Starting with 'b': Retrieve the first 3 records from the customers table where the first name starts with 'b'.
-- First 5 Movies Rated 'G': Retrieve the names of the first 5 movies with a rating of 'G'.
-- Customers with First Name Starting with 'a': Retrieve all customers whose first name starts with 'a'.
-- Make sure to adjust the table and column names according to your actual database schema.

-- 14- Find all customers whose first name ends with "a".
-- To find all customers whose first name ends with the letter 'a', you can use the following query:


SELECT *
FROM customers
WHERE first_name LIKE '%a';

-- 15- Display the list of first 4 cities which start and end with ‘a’ .
-- To retrieve the first 4 cities that start and end with the letter 'a', you can use the following query:


SELECT city  -- Assuming the column for city names is 'city'
FROM cities  -- Assuming the table name is 'cities'
WHERE city LIKE 'a%' AND city LIKE '%a'
LIMIT 4;  -- For MySQL and PostgreSQL
-- For SQL Server, you would use:


-- SELECT TOP 4 city
-- FROM cities
-- WHERE city LIKE 'a%' AND city LIKE '%a';

-- 16- Find all customers whose first name have "NI" in any position.
-- To find all customers whose first name contains "NI" in any position, you can use the following query:


SELECT *
FROM customers
WHERE first_name LIKE '%NI%';

-- 17- Find all customers whose first name have "r" in the second position
-- To find all customers whose first name has the letter 'r' in the second position, you can use the following query:

SELECT *
FROM customers
WHERE first_name LIKE '_r%';  -- The underscore represents a single character
-- Summary
-- Customers with First Name Ending with 'a': Retrieve all customers whose first name ends with 'a'.
-- First 4 Cities Starting and Ending with 'a': Retrieve the first 4 cities that start and end with 'a'.
-- Customers with "NI" in First Name: Retrieve all customers whose first name contains "NI".
-- Customers with 'r' in Second Position: Retrieve all customers whose first name has 'r' in the second position.
-- Make sure to adjust the table and column names according to your actual database schema.

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT *
FROM customers
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

-- 19- Find all customers whose first name starts with "a" and ends with "o".
SELECT *
FROM customers
WHERE first_name LIKE 'a%o';
 
 -- 20 - Get the films with pg and pg-13 rating using IN operator.
 -- SELECT *
-- FROM films
-- WHERE rating IN ('PG', 'PG-13');

-- 21 - Get the films with length between 50 to 100 using between operator.
-- SELECT *
-- FROM films
-- WHERE length BETWEEN 50 AND 100;

-- 22 - Get the top 50 actors using limit operator.
-- SELECT *
-- FROM actors
 --  LIMIT 50;
  
  -- 23 - Get the distinct film ids from inventory table.
  -- SELECT DISTINCT film_id
-- FROM inventory;
-- Notes:
-- Replace actors and inventory with the actual table names in your database if they differ.
-- The LIMIT clause is used in databases like MySQL and PostgreSQL. If you are using SQL Server, you would use TOP instead:

-- SELECT TOP 50 *
-- FROM actors;
-- Ensure that the column names (film_id) match those in your database schema.


-- Functions 


-- Question 1:
-- Retrieve the total number of rentals made in the Sakila database.
-- Hint: Use the COUNT() function.
-- To get the total number of rentals, you would typically query the rental table, which records each rental transaction.
SELECT COUNT(*) AS total_rentals
FROM rental;

-- Question 2:
-- Find the average rental duration (in days) of movies rented from the Sakila database.
-- Hint: Utilize the AVG() function.
-- To find the average rental duration, you would typically look at the rental table and use the rental_duration column from the film table, which is linked to the rental table through the inventory table.

-- Here’s how you can do it:


SELECT AVG(f.rental_duration) AS average_rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id;
-- Notes:
-- Ensure that the table names (rental, film, inventory) and column names (rental_duration) match those in your Sakila database schema.
-- The COUNT() function counts the number of rows, while the AVG() function calculates the average of a specified column.

-- String Functions:

-- Question 3:
-- Display the first name and last name of customers in uppercase.
-- Hint: Use the UPPER () function.

-- To display the first name and last name of customers in uppercase, you can use the UPPER() function as follows:

-- SELECT UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper
-- FROM customer;

-- Question 4:
-- Extract the month from the rental date and display it alongside the rental ID.
-- Hint: Employ the MONTH() function
-- To extract the month from the rental date, you can use the MONTH() function. Here’s how you can do it:

SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;
-- Notes:
-- Ensure that the table names (customer, rental) and column names (first_name, last_name, rental_date) match those in your Sakila database schema.
-- The UPPER() function converts the string to uppercase, while the MONTH() function extracts the month from a date.



-- Group by

-- Question 5:
-- Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
-- To find the total revenue generated by each store, you would typically join the rental, inventory, film, and store tables to calculate the revenue based on rental fees. Here’s how you can do it:


SELECT s.store_id, SUM(f.rental_rate) AS total_revenue
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id
GROUP BY s.store_id;
-- Notes:
-- Ensure that the table names (rental, inventory, film, store) and column names (customer_id, rental_rate, store_id) match those in your Sakila database schema.
-- The COUNT() function counts the number of rentals per customer, while the SUM() function calculates the total revenue for each store.
-- Hint: Use COUNT () in conjunction with GROUP BY.
-- To get the count of rentals for each customer, you can use the COUNT() function along with GROUP BY on the customer_id:
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

-- Question 6:
-- Find the total revenue generated by each store.
-- Hint: Combine SUM() and GROUP BY.
--  To find the total revenue generated by each store, you would typically need to join the store, rental, and payment tables. The payment table contains the revenue information, while the rental table links rentals to stores. You can then use the SUM() function to calculate the total revenue and GROUP BY to aggregate the results by store.

-- Here’s how you can write the SQL query for this:

--  Total Revenue Generated by Each Store


SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store AS s
JOIN inventory AS i ON s.store_id = i.store_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN payment AS p ON r.rental_id = p.rental_id
GROUP BY s.store_id;
-- Explanation:
-- store AS s: This is the main table representing the stores.
-- JOIN inventory AS i ON s.store_id = i.store_id: This joins the inventory table to link each store to its inventory.
-- JOIN rental AS r ON i.inventory_id = r.inventory_id: This joins the rental table to link rentals to the inventory.
-- JOIN payment AS p ON r.rental_id = p.rental_id: This joins the payment table to get the revenue associated with each rental.
-- SUM(p.amount) AS total_revenue: This calculates the total revenue for each store.
-- GROUP BY s.store_id: This groups the results by store ID to aggregate the revenue for each store.
-- This query will return the total revenue generated by each store in your database.

-- Question 7:
-- Determine the total number of rentals for each category of movies.
-- Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.

SELECT fc.category_id, COUNT(r.rental_id) AS total_rentals
FROM film_category AS fc
JOIN film AS f ON fc.film_id = f.film_id
JOIN rental AS r ON f.film_id = r.film_id
GROUP BY fc.category_id;

-- Question 8:
-- Find the average rental rate of movies in each language.
-- Hint: JOIN film and language tables, then use AVG () and GROUP BY.
SELECT l.language_id, AVG(f.rental_rate) AS average_rental_rate
FROM film AS f
JOIN language AS l ON f.language_id = l.language_id
GROUP BY l.language_id;

-- Joins


-- Question 9 
-- Display the title of the movie, customer s first name, and last name who rented it.
-- Hint: Use JOIN between the film, inventory, rental, and customer tables.
SELECT f.title, c.first_name, c.last_name
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id;

-- Question 10:
-- Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
--  Hint: Use JOIN between the film actor, film, and actor tables.
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

-- Question 11:
-- Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name;
 
 -- Question 12:
-- List the titles of movies rented by each 
-- Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY
 SELECT c.first_name, c.last_name, f.title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.first_name, c.last_name, f.title;

-- Advanced Joins and GROUP BY:

-- Question 13:
-- Display the top 5 rented movies along with the number of times they've been rented.
-- Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Question 14:
-- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;


-- Window function :

-- 1. Rank the customers based on the total amount they've spent on rentals.
-- To rank customers based on their total spending, you can use the SUM() function along with the RANK() window function. Here's how you can do it:


SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
JOIN 
    rental r ON p.rental_id = r.rental_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    spending_rank;
    
    -- 2. Calculate the cumulative revenue generated by each film over time.
-- To calculate the cumulative revenue generated by each film, you can use the SUM() function along with the OVER() clause to create a running total. Here's how you can do it:

SELECT 
    f.title, 
    SUM(p.amount) AS total_revenue,
    SUM(SUM(p.amount)) OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS cumulative_revenue
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    payment p ON r.rental_id = p.rental_id
GROUP BY 
    f.film_id, f.title, r.rental_date
ORDER BY 
    f.title;
-- Explanation:
-- Query 1: This query calculates the total amount spent by each customer and ranks them in descending order of their spending. The RANK() function assigns a rank based on the total spending.

-- Query 2: This query calculates the total revenue for each film and then computes the cumulative revenue over time. The PARTITION BY clause is used to reset the cumulative sum for each film, and the ORDER BY clause within the OVER() function ensures that the cumulative sum is calculated in the order of rental dates.

-- Make sure to adjust any table or column names according to your specific database schema if they differ.


-- 3. Determine the average rental duration for each film, considering films with similar lengths.
-- Step 3: Determine the Average Rental Duration for Each Film
-- Group Films by Length: First, categorize the films into groups based on their lengths. You might want to define ranges (e.g., 0-90 minutes, 91-120 minutes, etc.) to group similar lengths together.

-- Calculate Average Rental Duration: For each group, calculate the average rental duration. This can be done by summing the rental durations of all films in the group and dividing by the number of films in that group.
--  Example:

-- Group 1 (0-90 minutes): Film A (5 days), Film B (3 days), Film C (4 days)
-- Average = (5 + 3 + 4) / 3 = 4 days

-- 4. Identify the top 3 films in each category based on their rental counts.
-- Step 4: Identify the Top 3 Films in Each Category Based on Rental Counts
-- Define Categories: Identify the categories you want to analyze (e.g., genre, release year, etc.).

-- Count Rentals: For each film in the defined categories, count the number of rentals.

-- Sort and Select Top Films: For each category, sort the films based on their rental counts in descending order and select the top 3 films.

-- Example:

-- Category: Action
-- Film X: 150 rentals
-- Film Y: 120 rentals
-- Film Z: 100 rentals
-- Top 3: Film X, Film Y, Film Z
-- Example Summary
-- Average Rental Duration:

-- Action Films (0-90 minutes): 4 days
-- Drama Films (91-120 minutes): 5 days
-- Comedy Films (121-150 minutes): 3 days
-- Top 3 Films by Category:

-- Action: Film A, Film B, Film C
-- Drama: Film D, Film E, Film F
-- Comedy: Film G, Film H, Film I
-- Note
-- To perform these analyses, you would typically use a database or a data analysis tool (like SQL, Python with Pandas, or Excel) to manipulate and analyze the data effectively. If you have specific data or a dataset in mind, please provide it, and I can help you with more detailed calculations or code examples

-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals
-- ncreasing Trend: If the revenue is consistently increasing, it indicates growth in the rental business.
-- Decreasing Trend: A consistent decrease may indicate issues that need to be addressed.
-- Seasonal Trends: Look for patterns that repeat at certain times of the year (e.g., higher rentals during holidays).

-- 6. Find the monthly revenue trend for the entire rental store over time.
-- Summarize your findings in a report or presentation, highlighting key trends, any anomalies, and potential reasons for changes in revenue.

-- Example Visualization
-- You can create a line graph with the months on the x-axis and revenue on the y-axis to visually represent the trend.

-- Conclusion
-- By following these steps, you can effectively analyze the monthly revenue trend for your rental store over time, allowing you to make informed business decisions based on the data. If you have specific data or need further assistance with calculations, feel free to share!

-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers
-- Steps:

-- Calculate Total Spending for Each Customer: Sum the rental amounts for each customer.
-- Determine the 80th Percentile: Calculate the threshold for the top 20% of customers based on total spending.Example Calculation:

-- Assume you have the following total spending for customers:

-- Customer A: $200
-- Customer B: $300
-- Customer C: $150
-- Customer D: $500
-- Customer E: $400
-- Total Spending: $200, $300, $150, $500, $400

-- 8. Calculate the running total of rentals per category, ordered by rental count.
--  Steps:

-- Group Rentals by Category: Sum the total rentals for each category.
-- Sort by Rental Count: Order the categories by the total rental count.
-- Calculate Running Total: Create a running total of rentals for the ordered categories.
-- Example Calculation:

-- Assume categories and their rental counts:

-- Action: 100 rentals
-- Comedy: 150 rentals
-- Drama: 80 rentals
-- Ordered by rental count:

-- Comedy: 150
 -- Action: 100
 -- Drama: 80
 --  Running Total:

-- Comedy: 150
-- Action: 150 + 100 = 250
-- Drama: 250 + 80 = 330
-- Sort and find the 80th percentile (in this case, the top spending would be $400 and above).

-- 9. Find the films that have been rented less than the average rental count for their respective categories.
-- Steps:

-- Calculate Average Rentals per Category: For each category, calculate the average rental count.
-- Identify Films: For each film, check if its rental count is less than the average for its category.
-- Example Calculation:

-- Assume the following rental counts:

-- Action: Film A (30), Film B (20)
-- Comedy: Film C (10), Film D (40)
-- Average for Action: (30 + 20) / 2 = 25

-- Average for Comedy: (10 + 40) / 2 = 25

-- Films rented less than average:

-- Action: Film B (20 < 25)
-- Comedy: Film C (10 < 25)

-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
-- Steps:

-- Aggregate Revenue by Month: Sum the total revenue for each month.
-- Sort by Revenue: Order the months by total revenue in descending order.
-- Select Top 5: Identify the top 5 months with the highest revenue.
-- Example Calculation:

-- Assume monthly revenues:

-- January: $500
-- February: $700
-- March: $600
-- April: $800
-- May: $900
-- Sorted by revenue:

-- May: $900
-- April: $800
-- February: $700
-- March: $600
-- January: $500
-- Top 5 Months:

-- May: $900
-- April: $800
-- February: $700
-- March: $600
-- January: $500

-- Normalisation & CTE

-- 1. First Normal Form (1NF):
 -- a. Identify a table in the Sakila database that violates 1NF. Explain how you
 -- would normalize it to achieve 1NF.
 -- Table Example: film Table

-- The film table in the Sakila database contains various attributes, including actor_id, which can lead to a violation of 1NF if it allows multiple values (e.g., if an actor can be associated with multiple films in a single row).

-- Example of Violation:



-- | film_id | title         | actor_id         |
-- |---------|---------------|------------------|
-- | 1       | Film A       | 1, 2             |
-- | 2       | Film B       | 3                |
-- In this example, the actor_id column contains multiple values (1, 2) for a single film, which violates 1NF because each column must contain atomic (indivisible) values.

-- 
-- Create a New Table: Create a new table to represent the many-to-many relationship between films and actors.
-- Separate Rows: Each film-actor relationship should be represented in a separate row.
-- Normalized Structure:

-- Film Table:


 --  | film_id | title         |
-- |---------|---------------|
-- | 1       | Film A       |
-- | 2       | Film B       |
-- Film_Actor Table:



-- | film_id | actor_id |
-- |---------|----------|
-- | 1       | 2        |
-- | 2       | 3        |

-- 2. Second Normal Form (2NF):
 -- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
 -- If it violates 2NF, explain the steps to normalize it.
 
 -- 3. Third Normal Form (3NF):
 -- a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
 -- present and outline the steps to normalize the table to 3NF.
 
 -- a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.

-- Table Example: customer Table

-- The customer table in the Sakila database may contain the following columns:

-- customer_id
-- first_name
-- last_name
-- email
-- address_id
-- store_id
-- active
-- create_date
-- last_update
-- address (derived from address_id)
-- city (derived from address_id)
-- country (derived from address_id)
-- Transitive Dependencies: In this table, there are transitive dependencies:

-- address_id → address, city, country
-- This means that address, city, and country depend on address_id, which in turn depends on customer_id. Therefore, address, city, and country are not directly dependent on the primary key (customer_id), violating 3NF.
-- Normalization Steps to Achieve 3NF:

-- Identify Transitive Dependencies: Recognize that address, city, and country depend on address_id.
-- Create New Table for Address: Move the address-related columns to a new address table.
-- Update the customer Table: Remove the address-related columns from the customer table.
-- Normalized Structure:

-- 4. Normalization Process:
 -- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial 
 -- unnormalized form up to at least 2NF.
-- Customer Table:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.

-- Table Example: film Table (Unnormalized Form)

-- Assume the film table has the following unnormalized structure:



-- | film_id | title         | description         | actors                |
-- |---------|---------------|----------------------|-----------------------|
-- | 1       | Film A       | A great film         | Actor 1, Actor 2     |
-- | 2       | Film B       | Another great film   | Actor 3               |
-- Step 1: Convert to 1NF

-- Remove repeating groups (i.e., the actors column).
-- Create a new table to represent the many-to-many relationship between films and actors.
-- Normalized Structure (1NF):

-- Film Table:


-- | film_id | title         | description         |
-- |---------|---------------|----------------------|
-- | 1       | Film A       | A great film         |
-- | 2       | Film B       | Another great film   |
-- Film_Actor Table:


-- | film_id | actor_id |
-- |---------|----------|
-- | 1       | 1        |
-- | 1       | 2        |
-- | 2       | 3        |
-- Step 2: Convert to 2NF

-- Ensure that all non-key attributes are fully functionally dependent on the primary key.
-- In this case, both tables are already in 2NF since there are no partial dependencies.
-- Final Structure (2NF):

-- Film Table remains the same.
-- Film_Actor Table remains the same.

-- | customer_id | first_name | last_name | email          | address_id | store_id | active | create_date | last_update |
-- |-------------|------------|-----------|----------------|------------|----------|--------|--------------|--------------|
-- | 1           | John       | Doe       | john@example.com| 1          | 1        | 1      | 2023-01-01   | 2023-01-01   |
-- Address Table:


-- | address_id | address         | city_id | postal_code | country_id | last_update |
-- |------------|------------------|---------|-------------|------------|--------------|
-- | 1          | 123 Main St      | 1       | 12345       | 1          | 20

-- 5. CTE Basics:
 -- a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 
--  have acted in from the actor and film_actor tables.

-- Here’s a SQL query using a Common Table Expression (CTE) to achieve this:


-- WITH ActorFilmCount AS (
    SELECT 
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    LEFT JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    -- GROUP BY 
   --      a.actor_id, a.first
   
   
   
-- 6. CTE with Joins:
 -- a. Create a CTE that combines information from the film and language tables to display the film title, 
 -- language name, and rental rate.
--  WITH FilmLanguage AS (
 --    SELECT 
 --        f.title AS film_title,
  --       l.name AS language_name,
   --      f.rental_rate
   --  FROM 
  --       film f
  --   JOIN 
  --       language l ON f.language_id = l.language_id
-- )
-- SELECT * FROM FilmLanguage;

--  7.  c\ CTE for Aggregation:
 -- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) 
 -- from the customer and payment tables.
 
-- WITH FilmLanguage AS (
    -- SELECT 
       --  f.title AS film_title,
       --  l.name AS language_name,
       --  f.rental_rate
    --  FROM 
      --   film f
    -- JOIN 
    --     language l ON f.language_id = l.language_id
-- )
-- SELECT * FROM FilmLanguage;

-- 8.CTE with Window Functions:
 -- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table
 -- WITH CustomerRevenue AS (
   --  SELECT 
      --   c.customer_id,
       --  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       --  SUM(p.amount) AS total_revenue
   --  FROM 
    --     customer c
    -- JOIN 
    --     payment p ON c.customer_id = p.customer_id
   --  GROUP BY 
   --      c.customer_id, c.first_name, c.last_name
-- )
-- SELECT * FROM CustomerRevenue;

-- 9 CTE and Filtering:
 -- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 
 -- customer table to retrieve additional customer details
 -- WITH CustomerRentals AS (
  --   SELECT 
      --   c.customer_id,
       --  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
      --   COUNT(r.rental_id) AS rental_count
   --  FROM 
     --    customer c
    -- JOIN 
      --  rental r ON c.customer_id = r.customer_id
    -- GROUP BY 
      --   c.customer_id, c.first_name, c.last_name
    -- HAVING 
     --    COUNT(r.rental_id) > 2
-- )
-- SELECT 
 --    cr.customer_id,
  --   cr.customer_name,
  --   c.email,
   --  c.create_date
-- FROM 
  --   CustomerRentals cr
-- JOIN 
  --   customer c ON cr.customer_id = c.customer_id;
  
  -- 10 CTE for Date Calculations:
 -- a. Write a query using a CTE to find the total number of rentals made each month, considering the 
 -- rental_date from the rental table 
 -- WITH MonthlyRentals AS (
    -- SELECT 
       -- DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
       --  COUNT(rental_id) AS total_rentals
   --  FROM 
   --      rental
   --  GROUP BY 
    --    rental_month
-- )
-- SELECT 
  --   rental_month,
   --  total_rentals
-- FROM 
 --    MonthlyRentals
-- ORDER BY 
--     rental_month;

--  11 EE' CTE and Self-Join:
 -- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 
 -- together, using the film_actor table.
 
 -- WITH ActorPairs AS (
  --   SELECT 
    --     fa1.actor_id AS actor1_id,
     --    fa2.actor_id AS actor2_id,
      --   fa1.film_id
   --   FROM 
    --     film_actor fa1
   --  JOIN 
   --      film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
-- )
-- SELECT 
 --    ap.actor1_id,
 --    ap.actor2_id,
 --    f.title
-- FROM 
   --  ActorPairs ap
-- JOIN 
--     film f ON ap.film_id = f.film_id
-- ORDER BY 
   --  f.title;
   
   -- 12. CTE for Recursive Search:
 -- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, 
 -- considering the reports_to column
 -- Assuming you want to find all employees who report to a specific manager (for example, manager_id = 1):
 
 -- WITH RECURSIVE EmployeeHierarchy AS (
   --  SELECT 
    --     staff_id,
     --   first_name,
       --  last_name,
       --  reports_to
   --  FROM 
   --      staff
   --  WHERE 
   --      reports_to = 1  -- Change this to the specific manager's ID

   --  UNION ALL

   --  SELECT 
   --      s.staff_id,
   --      s.first_name,
   --      s.last_name,
   -      s.reports_to
   --  FROM 
    --     staff s
   --  INNER JOIN 
    -- m    EmployeeHierarchy eh ON s.reports_to = eh.staff_id
-- )
-- SELECT 
    -- staff_id,
   --  CONCAT(first_name, ' ', last_name) AS employee_name
 -- FROM 
 --    EmployeeHierarchy;