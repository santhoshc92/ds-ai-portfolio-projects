/*
Project: Food Delivery Platform Analytics (Jomato)

Description:
This project analyzes a simulated dataset provided by a food delivery platform similar to Jomato.
The dataset contains information about restaurants, restaurants type, cuisines and ratings within a city.
The objective is to use SQL queries to extract actionable insights to support data-driven business decisions.
*/

--     ** This file covers 
--          * data base creation, rename columns
--		    * create, insert, update and alter tables
--          * Data types and constraints

CREATE DATABASE jomato_db;
USE jomato_db;
----------------------------------------------------------------------------------------------------------------------------------------

--Import the jomato dataset CSV file and query the data
SELECT * FROM jomato;

-- Rename the columns in required format
EXEC sp_rename 'jomato.[OrderId]',        'order_id',		'COLUMN';
EXEC sp_rename 'jomato.[Resta_ant_Name]', 'restaurant_name','COLUMN';
EXEC sp_rename 'jomato.[R_staurantType]', 'restaurant_type','COLUMN';
EXEC sp_rename 'jomato.[Rating]',		  'rating',			'COLUMN';
EXEC sp_rename 'jomato.[No_of_Rating]',   'num_of_ratings', 'COLUMN';
EXEC sp_rename 'jomato.[AverageCost]',    'average_cost',   'COLUMN';
EXEC sp_rename 'jomato.[OnlineOrder]',    'online_order',   'COLUMN';
EXEC sp_rename 'jomato.[TableBooking]',   'table_booking',  'COLUMN';
EXEC sp_rename 'jomato.[CuisinesType]',   'cuisine_type',   'COLUMN';
EXEC sp_rename 'jomato.[LocalA_dress]',   'local_address',  'COLUMN';
EXEC sp_rename 'jomato.[Area]',           'area',			'COLUMN';
EXEC sp_rename 'jomato.[Delivery_time]',  'delivery_time',  'COLUMN';
EXEC sp_rename 'jomato.[Ordertimetime]',  'order_time',     'COLUMN';
---------------------------------------------------------------------------------------------------------------------------------------

-- Query to get column names

SELECT column_name 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'jomato';
------------------------------------------------------------------------------------------------------------------------

/* Objective 1: 
   As there is only single dataset jomato. Create a Customer table with customer id(1 to 50 ),customer name, 
   email, age and salary column. Assign these customer ID randomly to jomato dataset.*/

--Create customer table and insert data

CREATE TABLE customer (customer_id   INT PRIMARY KEY,
                       customer_name VARCHAR(50) NOT NULL,
					   email         VARCHAR(50) NOT NULL,
					   age           INT,
					   salary        INT);

--add constraints
ALTER TABLE customer ADD CONSTRAINT uq_email UNIQUE(email);


INSERT INTO customer (customer_id, customer_name, email, age, salary) VALUES
(1, 'Aarav Sharma', 'aaravsharma@gmail.com', 24, 48000),
(2, 'Ananya Singh', 'ananyasingh@yahoo.com', 32, 75000),
(3, 'Vivaan Patel', 'vivaanpatel@outlook.com', 27, 102000),
(4, 'Diya Kapoor', 'diyakapoor@gmail.com', 19, 60000),
(5, 'Arjun Mehta', 'arjunmehta@yahoo.com', 45, 120000),
(6, 'Isha Reddy', 'ishareddy@outlook.com', 38, 90000),
(7, 'Rohan Verma', 'rohanverma@gmail.com', 21, 35000),
(8, 'Saanvi Nair', 'saanvinaire@yahoo.com', 29, 70000),
(9, 'Krishna Iyer', 'krishnaier@outlook.com', 33, 85000),
(10, 'Mira Joshi', 'mirajoshi@gmail.com', 26, 65000),
(11, 'Aditya Rao', 'adityarao@yahoo.com', 41, 130000),
(12, 'Anika Sharma', 'anikasharma@outlook.com', 22, 50000),
(13, 'Sai Kumar', 'saikumar@gmail.com', 36, 98000),
(14, 'Tanvi Gupta', 'tanvigupta@yahoo.com', 28, 72000),
(15, 'Karan Malhotra', 'karanmalhotra@outlook.com', 47, 140000),
(16, 'Pooja Desai', 'poojadesai@gmail.com', 30, 80000),
(17, 'Aryan Choudhary', 'aryanchoudhary@yahoo.com', 20, 40000),
(18, 'Riya Singh', 'riyasingh@outlook.com', 34, 91000),
(19, 'Devansh Mehra', 'devanshmehra@gmail.com', 25, 62000),
(20, 'Anaya Verma', 'anayaverma@yahoo.com', 39, 110000),
(21, 'Vivaan Kapoor', 'vivaankapoor@outlook.com', 23, 47000),
(22, 'Aditi Sharma', 'aditisharma@gmail.com', 31, 78000),
(23, 'Reyansh Jain', 'reyanshjain@yahoo.com', 42, 125000),
(24, 'Ira Reddy', 'irareddy@outlook.com', 27, 68000),
(25, 'Kabir Iyer', 'kabiriyer@gmail.com', 35, 95000),
(26, 'Diya Joshi', 'diyajoshi@yahoo.com', 18, 36000),
(27, 'Shivansh Rao', 'shivanshrao@outlook.com', 37, 102000),
(28, 'Myra Sharma', 'myrasharma@gmail.com', 29, 71000),
(29, 'Arnav Kumar', 'arnavkumar@yahoo.com', 40, 118000),
(30, 'Anvi Gupta', 'anvigupta@outlook.com', 26, 63000),
(31, 'Rudra Malhotra', 'rudramalhotra@gmail.com', 33, 89000),
(32, 'Kiara Desai', 'kiaradesai@yahoo.com', 21, 45000),
(33, 'Advik Choudhary', 'advikchoudhary@outlook.com', 54, 145000),
(34, 'Sara Singh', 'sarasingh@gmail.com', 28, 74000),
(35, 'Aarush Mehra', 'aarushmehra@yahoo.com', 39, 112000),
(36, 'Tara Verma', 'taraverma@outlook.com', 22, 52000),
(37, 'Neil Kapoor', 'neilkapoor@gmail.com', 31, 81000),
(38, 'Anika Rao', 'anikarao@yahoo.com', 24, 48000),
(39, 'Dhruv Iyer', 'dhruvier@outlook.com', 27, 67000),
(40, 'Meera Joshi', 'meerajoshi@gmail.com', 36, 97000),
(41, 'Raghav Sharma', 'raghavsharma@yahoo.com', 60, 142000),
(42, 'Kiara Singh', 'kiarasingh@outlook.com', 30, 82000),
(43, 'Aryan Malhotra', 'aryanmalhotra@gmail.com', 19, 39000),
(44, 'Isha Desai', 'ishadesai@yahoo.com', 38, 105000),
(45, 'Vihaan Choudhary', 'vihaanchoudhary@outlook.com', 25, 61000),
(46, 'Anaya Gupta', 'anayagupta@gmail.com', 32, 79000),
(47, 'Arjun Rao', 'arjunrao@yahoo.com', 41, 124000),
(48, 'Myra Iyer', 'myraiyer@outlook.com', 29, 70000),
(49, 'Kabir Joshi', 'kabirjoshi@gmail.com', 34, 93000),
(50, 'Diya Sharma', 'diyasharma@yahoo.com', 23, 46000);

--Add the customer_id column to jomato dataset
ALTER TABLE jomato add customer_id INT;

--Randomly assign customer Id to Jomato Dataset
UPDATE Jomato
SET customer_id = CAST(ABS(CHECKSUM(NEWID())) % 50 + 1 AS INT);

--NEWID() generates a unique GUID for each row.

--CHECKSUM(NEWID()) converts the GUID into an integer (so we can do math on it).

--ABS(... % 50 + 1) maps it to a number between 1 and 50. This creates a random distribution of customer IDs for all 7,500 records.

---------------------------------------------------------------------------------------------------------------------------

/*Objective 2: 
  Create a new location table with area code and area name. Update the area code in jomato and drop area column */

CREATE TABLE location (area_code INT IDENTITY(1,1) PRIMARY KEY,
                       area_name VARCHAR(100) NOT NULL UNIQUE);



INSERT INTO location(area_name)
SELECT DISTINCT area 
FROM Jomato;


--Insert the area_code to jomato table and drop area column
ALTER TABLE jomato ADD area_code INT;

UPDATE j
SET j.area_code = l.area_code
FROM jomato AS j
INNER JOIN location AS l
	ON j.area = l.area_name;

--drop area column in jomato

ALTER TABLE jomato drop column area;

--Insert area_code column to customer table and update the column with area_code matching with customer ID from jomato table

ALTER TABLE customer ADD area_code INT;

UPDATE c
SET c.area_code = j.area_code
FROM customer AS c
INNER JOIN jomato AS j
	ON c.customer_id = j.customer_id;


--add constraints
ALTER TABLE jomato
ADD CONSTRAINT fk_jomato_location
FOREIGN KEY (area_code)
REFERENCES location(area_code);

SELECT * FROM jomato;
