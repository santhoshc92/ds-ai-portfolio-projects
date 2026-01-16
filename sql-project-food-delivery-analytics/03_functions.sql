/*Project: Food Delivery Platform Analytics (Jomato)

Description:
This project analyzes a simulated dataset provided by a food delivery platform similar to Jomato.
The dataset contains information about restaurants, restaurants type, cuisines and ratings within a city.
The objective is to use SQL queries to extract actionable insights to support data-driven business decisions.
*/

--   ** This file covers Functions(Aggregate, Date Time, Mathematical, String, Windows, User defined) and conditional statement


USE jomato_db;

--                              ** Aggregate Functions **
-- Aggregate stats fo each restaurant 
SELECT 
    restaurant_name,
    MIN(rating)         AS min_rating,
    MAX(num_of_ratings) AS max_rate_count,
    AVG(num_of_ratings) AS avg_rating,
	SUM(average_cost)   AS total_sum,
    COUNT (*) AS total_count
FROM jomato
GROUP BY restaurant_name;

--Count of online orders
SELECT 
  COUNT(online_order) AS online_orders 
FROM jomato 
WHERE online_order = 1;

-- Maximum number of ratings per address
SELECT 
   local_address,  
   MAX(num_of_ratings) AS max_rating
FROM jomato 
GROUP BY local_address 
ORDER BY local_address ;
-----------------------------------------------------------------------------------------------------------------------------------------
--								** Date  and Time Functions**

--Extract date and time

SELECT 
	CAST(order_time AS DATE) AS order_date,
	CAST(order_time AS TIME) AS order_time
FROM jomato;

--Extract day, month, year, hour, minute, second
SELECT 
    DAY(order_time)             AS order_day,
	MONTH(order_time)           AS order_month, 
	DATENAME(MONTH,order_time)  AS month_name,
	YEAR(order_time)            AS order_year,
	DATEPART(hour,order_time)   AS order_hour, 
	DATEPART(MINUTE,order_time) AS order_minute, 
	DATEPART(SECOND,order_time) AS order_second
FROM jomato;

 -- List out the number of orders grouped with respect to year and month. 
SELECT 
      YEAR(order_time)  AS year_order,
	  MONTH(order_time) AS month_order,
	  COUNT(*)          As order_count
FROM jomato
GROUP BY YEAR(order_time), MONTH(order_time)
ORDER BY YEAR(order_time), MONTH(order_time);

--Give the total weekly order value with the address and restaurant name details. Use roll-up to pull the data in hierarchical order.
SELECT 
     DATEPART(week, order_time) AS week_date,
	 local_address,
	 COUNT(order_id) AS weekly_orders
FROM jomato
GROUP BY (DATEPART(week, order_time)),local_address WITH ROLLUP;

--Find the differene between curent date and order time

SELECT *,
      DATEDIFF(WEEK, getdate(), order_time) AS week_diff,
	  DATEDIFF(DAY,  getdate(), order_time) AS day_diff,
	  DATEDIFF(MONTH,getdate(), order_time) AS month_diff,
	  DATEDIFF(YEAR, getdate(), order_time) AS year_diff
FROM jomato;

-- ADD 1  week, month and year and subtract 1 from day
SELECT 
      DATEADD(WEEK, 1, CAST(order_time AS DATE)) AS week_new,
	  DATEADD(DAY, -1, order_time) AS day_new,
	  DATEADD(MONTH,1, order_time) AS month_new,
	  DATEADD(YEAR, 1, order_time) AS year_new
FROM jomato;


--Write a query to calculate the total number of ratings for each restaurant type where the order was placed in March (any year),
--and the time was in the morning (i.e., before 12:00 PM). 
SELECT 
     restaurant_type, 
	 COUNT(num_of_ratings ) as rating_count
FROM jomato
WHERE MONTH(order_time) = 3 AND DATEPART(HOUR,order_time) <12
GROUP BY restaurant_type;


--Write a query to find the top 5 most rated restaurant for each restaurant type, but only for orders palced in the first week of each month
--(i.e., from the 1st to the 7th day) during the year 2017.
SELECT top 5
     restaurant_name,
	 restaurant_type,
	 rating
FROM jomato
WHERE YEAR(order_time) = 2017 AND DAY(order_time) BETWEEN 1 AND 7
GROUP BY restaurant_name, restaurant_type,rating
ORDER BY rating DESC;
----------------------------------------------------------------------------------------------------------------------------------------

--                                      ** Mathematical functions **

--Find the Ceiling, floor and absolute values, rounding of the rating column 

SELECT 
     rating, 
	 CEILING (rating) AS ceiling_value,
	 FLOOR(rating)    AS floor_value,
     ABS (rating)     AS abs_value ,
	 ROUND(rating,3)    AS rounded
FROM jomato;
----------------------------------------------------------------------------------------------------------------------------------------

--                                    ** String functions **
SELECT 
     SUBSTRING(restaurant_type, 7,5) as sub_string
FROM jomato
WHERE order_id = 1
-----------------------------------------------------------------------------------------------------------------------------------------

--                                    ** Window functions **

-- Find the rank based on delivery time and group the orders to bins based on delivery time
SELECT *,
       RANK() OVER (PARTITION BY restaurant_name ORDER BY delivery_time )        AS rnk, 
       DENSE_RANK () OVER (PARTITION BY restaurant_name ORDER BY delivery_time ) AS dense_rnk,
	   NTILE(5) OVER (ORDER BY delivery_time )                                   AS bins
FROM Jomato; 
		  
--------------------------------------------------------------------------------------------------------------------------------------
--                                   ** User defined functions **

-- Create a user-defined function to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.

CREATE FUNCTION stuff_fn (@string VARCHAR(50))
RETURNS TABLE
AS
RETURN
(	SELECT STUFF(restaurant_type, 7, 0, 'chicken ') AS stuff_chicken
	FROM jomato 
	WHERE restaurant_type = @string
);
GO

SELECT * 
FROM dbo.stuff_fn ('quick bites');

-- Using table valued function and scalar function, display the restaurant name and cuisine type which has maximum number of rating.

--Table valued function
CREATE FUNCTION dbo.max_rate()
RETURNS TABLE
AS
RETURN
(
	SELECT restaurant_name, cuisine_type 
	FROM jomato 
	WHERE num_of_ratings = (SELECT MAX(num_of_ratings) FROM jomato)
);


SELECT * 
FROM dbo.max_rate()

--Scalar function
CREATE FUNCTION dbo.maxrat()
RETURNS INT
AS
BEGIN
    DECLARE @MaxRating INT;
    SELECT @MaxRating = MAX(num_of_ratings)
    FROM jomato;

    RETURN @MaxRating;
END;


SELECT restaurant_name,cuisine_type
FROM jomato
WHERE num_of_ratings = dbo.maxrat();
---------------------------------------------------------------------------------------------------------------------------------------
 --                                 ** Conditional expression **

--Label delivery speed using IIF.

SELECT *,
	IIF (delivery_time >40, 'slow', 'quick') AS speed_delivery
FROM Jomato 
ORDER BY delivery_time;                             

--Create a rating status column to display the rating AS ‘Excellent’ if it has more the 4 start rating, --‘Good’ if it has above 3.5
--and below 4 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating

SELECT *,
	CASE
		WHEN rating < 3   THEN 'Bad'
		WHEN rating < 3.5 THEN 'Average'
		WHEN rating < 4   THEN 'Good'
		ELSE 'Excellent'
	END AS rating_status 
FROM jomato
ORDER BY rating_status DESC ;