/*Project: Food Delivery Platform Analytics (Jomato)

Description:
This project analyzes a simulated dataset provided by a food delivery platform similar to Jomato.
The dataset contains information about restaurants, restaurants type, cuisines and ratings within a city.
The objective is to use SQL queries to extract actionable insights to support data-driven business decisions.
*/

--   ** This file covers Sub-queries, CTE, stored procedure, view, index, transaction and exception handling

---------------------------------------------------------------------------------------------------------------------------
USE jomato_db;
---------------------------------------------------------------------------------------------------------------------------
--                                   ** Sub queries **

-- Display the customer who got the maximum salary.
SELECT * 
FROM customer
WHERE salary = (SELECT MAX(salary) FROM customer);

-- Display the restaurant with top 5 ratings
SELECT * 
FROM jomato
WHERE rating IN (SELECT TOP 5 rating FROM jomato order by rating desc);

--Display the list of customers who are living in Basavanagudi

SELECT *
FROM customer 
WHERE area_code = (SELECT area_code
				  FROM location 
				  WHERE area_name = 'Basavanagudi');
				  
-- Update the salaries of employees who are residing in Brigade Road on the basis of 10%.

UPDATE customer 
SET salary = (salary *1.1)
WHERE area_code  = (SELECT area_code 
					FROM location 
					WHERE area_name = 'Brigade Road');

-- Delete the restaurants from Church Street  
DELETE FROM jomato 
WHERE area_code = (SELECT area_code 
				   FROM location 
				   WHERE area_name = 'Church Street');

--Find the restaurant which delivers quick and late respectively

SELECT restaurant_name
FROM jomato 
WHERE delivery_time = (SELECT MAX(delivery_time) FROM jomato);

SELECT restaurant_name
FROM jomato 
WHERE delivery_time = (SELECT MIN(delivery_time) FROM jomato)
------------------------------------------------------------------------------------------------------------------------------------
--	                           ** CTE - Common Table Expression **

--Generate a row number column and find the top 5 restaurant with the highest rating of restaurants.

WITH tmp_rank AS(
	SELECT *,
		RANK() OVER (ORDER BY num_of_ratings DESC)        AS rnk,
		ROW_NUMBER () OVER (ORDER BY num_of_ratings DESC) AS rnum 
		FROM jomato
)
SELECT TOP 5 * 
FROM tmp_rank;

-- Display the second highest salary drawing customer details. 
WITH tmp_rank AS (
	SELECT*, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank 
	FROM customer
)
SELECT * 
FROM tmp_rank 
WHERE rank = 2;


--multiple cte -- Get restaurants having average of average_cost less than max cost
WITH tmp_avg AS 
(
	SELECT restaurant_name, AVG (average_cost) AS avg_price
	FROM jomato 
	GROUP BY restaurant_name
), 
tmp_max AS
(
	SELECT restaurant_name, MAX (average_cost) AS max_price
	FROM jomato 
	GROUP BY restaurant_name
)
SELECT a.restaurant_name, a.avg_price, b.max_price 
FROM tmp_avg AS a
INNER JOIN
tmp_max AS b
	ON a.restaurant_name = b.restaurant_name
WHERE a.avg_price < b.max_price
ORDER BY A.restaurant_name;

--updating with cte
WITH upd_cte AS
(
	SELECT * FROM customer
)
UPDATE upd_cte 
SET age = 55 
WHERE customer_id = 51;

SELECT * FROM customer;

--deleting with cte

With del_cte AS
(
 SELECT * FROM customer
 )
DELETE FROM del_cte 
WHERE customer_id = 51;

SELECT * FROM customer;
----------------------------------------------------------------------------------------------------------------------------------
--                                ** stored procedure **

--Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.

CREATE PROCEDURE proc_display 
	(@tbook int)
AS
BEGIN	
	SELECT restaurant_name, restaurant_type, cuisine_type, table_booking
	FROM jomato 
	WHERE table_booking <> @tbook
END;

EXEC proc_display 0;

--Create a stored procedure to fetch the result according to the restaurant type.
CREATE PROCEDURE proc_type
	(@rtype VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM jomato 
	WHERE restaurant_type = @rtype
END;

EXEC proc_type 'quick bites';


/*Write a stored procedure called GetRestaurantInfo that accepts an optional parameter @loc (the address of the restaurant).

It should return:
	1. restaurant_name, restaurant_type, local_address,
	2. A column called ordered_date that extracts only the date
	3. A column called rating_summary formatted as: "Min: X | Max: Y" 
	4. If no @loc is provided, return restaurants from all locations. */

CREATE PROCEDURE GetRestaurantInfo
	(@loc VARCHAR(50) = NULL) -- Optional Parameter
AS
BEGIN
	SELECT
		restaurant_name, 
		restaurant_type, 
		local_address,
		CAST(order_time AS DATE) AS ordered_date,
		CONCAT('Min: ',MIN(rating),' | Max: ', MAX(rating)) AS rating_summary
    FROM jomato
	WHERE (@loc is NULL OR local_address = @loc)
	GROUP BY restaurant_name, restaurant_type, local_address, CAST(order_time AS DATE)
	ORDER BY restaurant_name;
 END;

EXEC GetRestaurantInfo 'HSR'  -- For specific location
EXEC GetRestaurantInfo        -- For all location

------------------------------------------------------------------------------------------------------------------------------------------
--                                            ** view **

--Write a query to CREATE a Top rating view to store the generated top 5 highest rating of restaurants.

CREATE VIEW top_rating_view
AS
SELECT  TOP 5 * 
FROM jomato 
ORDER BY num_of_ratings DESC;

SELECT * FROM top_rating_view;
------------------------------------------------------------------------------------------------------------------------------------
--                                         ** Indexes **

--create a Non clustered index on local_address

CREATE NONCLUSTERED INDEX idx_jomato_location
ON jomato (local_address);

--Composite index
CREATE NONCLUSTERED INDEX idx_jomato_location_rating
ON jomato (local_address, rating);

--Clustered Index

CREATE CLUSTERED INDEX idx_jomato_order_time
ON jomato (order_time);

--Check indexes
EXEC sp_helpindex 'jomato';

-------------------------------------------------------------------------------------------------------------------------------------
--                                         ** Triggers **

--CREATE a trigger whenever a new record is inserted.

CREATE TRIGGER trig_jomato 
ON jomato
AFTER INSERT
AS	
BEGIN
	print('New record(s) inserted into jomato')
END;
-------------------------------------------------------------------------------------------------------------------------
--                                    ** Transaction **

--Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.

SELECT * FROM jomato WHERE cuisine_type = 'cafe';

BEGIN TRANSACTION
UPDATE jomato 
SET cuisine_type = 'cafeteria'
WHERE cuisine_type ='cafe';

ROLLBACK TRANSACTION;
	

-- Exception handling
BEGIN TRY
	BEGIN TRANSACTION;
	
	UPDATE customer SET age = age + 10 
	WHERE customer_id  = 1

	COMMIT TRANSACTION  
	PRINT 'Transaction Committed'
END TRY

BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
PRINT 'Transaction Rolled Back';
PRINT ERROR_MESSAGE();
END CATCH;