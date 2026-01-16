/*Project: Food Delivery Platform Analytics (Jomato)

Description:
This project analyzes a simulated dataset provided by a food delivery platform similar to Jomato.
The dataset contains information about restaurants, restaurants type, cuisines and ratings within a city.
The objective is to use SQL queries to extract actionable insights to support data-driven business decisions.
*/

--   ** This file covers different joins and update and delete a record using joins.


USE jomato_db;
-------Inner Join - picks record matching in both the tables

--List Customers with their area names.
SELECT c.customer_name, l.area_name
FROM customer AS c
INNER JOIN location AS l
	on c.area_code = l.area_code


--List distinct customers residing in same area code using self join
SELECT DISTINCT c.customer_name
FROM customer AS c
INNER JOIN customer AS a
	on c.area_code = a.area_code
	AND c.customer_id <> a.customer_id

--Select customers who ordered from restaurants in bellandur
SELECT c.customer_name, j.restaurant_name, l.area_name
FROM customer AS c
INNER JOIN jomato AS j 
on c.customer_id = j.customer_id
INNER JOIN location AS l
ON j.area_code = l.area_code
WHERE l.area_name = 'Bellandur';

--List the restaurants with exactly one order with their area names

SELECT
	j.restaurant_name, 
	l.area_name, 
	COUNT(j.order_id) as order_count
FROM 
	jomato AS j
INNER JOIN 
	location  AS l
ON j.area_code =l.area_code
GROUP BY 	j.restaurant_name, l.area_name
HAVING COUNT(j.order_id) = 1
ORDER BY j.restaurant_name;



--Display all customer details from Bellandur OR Basavanagudi.
SELECT * 
FROM customer AS c
INNER JOIN
location AS l
on c.area_code = l.area_code
WHERE l.area_name IN ('Bellandur','Basavanagudi');
--------------------------------------------------------------------------------------------------------------------------------------
---LEFT JOIN -- pick all records from left table and matching records from right table

SELECT c.customer_name, l.area_name
FROM customer AS c
LEFT JOIN location AS l
	on c.area_code = l.area_code

--RIGHT JOIN --pick all records from right table and matching records from left table

SELECT c.customer_name, l.area_name
FROM customer AS c
RIGHT JOIN location AS l
	on c.area_code = l.area_code

--FULL OUTER JOIN/FULL JOIN   - Includes all rows from both tables, showing NULL for unmatched columns.”
SELECT c.customer_name, l.area_name
FROM customer AS c
FULL JOIN location AS l
	on c.area_code = l.area_code

--CROSS JOIN --Returns the Cartesian product (every row from table A × every row from table B)
SELECT c.customer_name, l.area_name
FROM customer AS c
CROSS JOIN location AS l

-----------------------------------------------------------------------------------------------------------------------------

--Update age of customer residing in Banashankari using join
UPDATE c 
SET c.age = c.age +20
FROM customer as c
INNER JOIN 
location AS l
ON c.area_code = l.area_code
WHERE l.area_name = 'Banashankari'

--DELETE with JOIN
--Delete customers from 'HSR' using Join

DELETE customer from
customer AS c
INNER JOIN
location as l
ON c.area_code = l.area_code
WHERE l.area_name = 'HSR'



