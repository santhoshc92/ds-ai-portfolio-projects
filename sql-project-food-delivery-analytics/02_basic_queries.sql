/*Project: Food Delivery Platform Analytics (Jomato)

Description:
This project analyzes a simulated dataset provided by a food delivery platform similar to Jomato.
The dataset contains information about restaurants, restaurant types, cuisines and ratings within a city.
The objective is to use SQL queries to extract actionable insights to support data-driven business decisions.
*/

--   ** This file covers simple queries, clauses and operators


USE jomato_db;

--Simple Queries

--List all details from the location, customer and jomato tables.
SELECT * FROM location;
SELECT * FROM customer;
SELECT * FROM Jomato;

--List the age and salary of customers
SELECT 
    age, salary 
FROM customer;

--List  customers who earn more than 1 lakh 
SELECT * 
FROM customer 
WHERE salary >100000;

--Update the age of customers whose salary > 140000
UPDATE customer 
SET age = age +5
WHERE salary >140000;


--*****************************************************************************************************

--                                     ** Clauses **
--list out customer whose name starts with 'S'
SELECT * 
FROM customer 
WHERE customer_name LIKE 'S%';

--List out the restaurants  in area code 10, 20 and 30 and as well as those not in that code
SELECT restaurant_name 
FROM jomato 
WHERE area_code IN (10,20,30);

SELECT restaurant_name 
FROM jomato 
WHERE area_code NOT IN (10,20,30);

--List out the restaurants whose rating > 4 and number of rating > 500
SELECT restaurant_name 
FROM jomato 
WHERE rating > 4 
      AND num_of_ratings > 500;

--
--select top 5 restaurants by ratings
SELECT TOP 5 * 
FROM jomato 
ORDER BY rating DESC;

-- List out the total number of orders by restaurant types having count > 50 and location in 'HSR','BTM', 'MG Road'
SELECT 
    restaurant_type,
	COUNT(order_id) AS order_count
FROM jomato
WHERE local_address IN ('HSR','BTM', 'MG Road')
GROUP BY restaurant_type 
HAVING count(order_id) > 50
ORDER BY restaurant_type;


--Display the restaurant type and total average cost using rollup.

SELECT  
   COALESCE (restaurant_type, 'All type') AS restaurant_types,
   AVG(average_cost) AS avg_cost
FROM jomato
GROUP BY
ROLLUP (restaurant_type, avg_cost);
--**********************************************************************************************************
-- Set operators
SELECT area_code FROM location
UNION
SELECT area_code FROM jomato;


SELECT area_code FROM location
UNION ALL
SELECT area_code FROM jomato;

SELECT area_code FROM location
INTERSECT
SELECT area_code FROM jomato;

SELECT area_code FROM customer
EXCEPT
SELECT area_code FROM jomato;

--------------------------------------------------------------------------------------------------------------------------------------
