USE samplesdb;


SELECT * FROM cars;
SELECT * from dealerships;

SELECT c.car_id as 'Car ID', c.name as carname, c.built_date as builtdate, d.dealership_id, d.location, d.car_id as 'Dealership Car ID'  
FROM cars c
INNER JOIN dealerships d
ON c.car_id = d.car_id

SELECT * 
FROM dealerships d
LEFT JOIN cars c
ON d.car_id = c.car_id


-- Find all dealerships that carry Jeeps - correlated subquery
SELECT d.dealership_id, d.location
FROM dealerships d
WHERE EXISTS
(
	SELECT dealership_id
 	FROM dealerships 
 	WHERE car_id = 3 AND dealership_id = d.dealership_id
)
GROUP BY d.dealership_id, d.location
;

-- Find all dealerships that don't carry Jeeps - simple subquery
SELECT d.dealership_id, d.location
FROM dealerships d
WHERE d.dealership_id NOT IN
(
    SELECT dealership_id
 	FROM dealerships
    WHERE car_id = 3
)
GROUP BY d.dealership_id, d.location

-- Find all dealerships that carry BMWs
SELECT *
from dealerships
where car_id = 1

-- Find the 2nd to largest car id for Dallas dealership
SELECT MAX(car_id)
FROM dealerships d1 
WHERE location='Dallas'
AND car_id NOT IN 
	(SELECT max(car_id) FROM dealerships WHERE location=d1.location)

SELECT location, AVG(car_id) as avg_id
FROM dealerships
GROUP BY location
HAVING AVG(car_id) > 4.5

SELECT location, numCars = count(*)
from dealerships
GROUP BY location

-- Find all cars sold by Dallas which are in the Cars inventory master or not
SELECT * 
FROM dealerships d
LEFT JOIN cars c
ON d.car_id = c.car_id
WHERE d.dealership_id = 30

-- Scratchpad

SELECT c.*, d.location
FROM dealerships d
LEFT JOIN cars c ON d.car_id = c.car_id AND d.car_id = 3;






-- JOINS --



-- Left outer join on Cars
SELECT *  
FROM cars c
LEFT JOIN dealerships d 
ON c.car_id = d.car_id
ORDER BY c.car_id


# Left outer join on Cars
SELECT COUNT(*) FROM cars ;
SELECT *
FROM cars c
LEFT JOIN dealerships d 
ON c.car_id = d.car_id AND d.location = 'Dallas'


# Left outer join on Dealerships
SELECT * FROM dealerships;
SELECT * 
FROM dealerships d
LEFT JOIN cars c
ON d.car_id = c.car_id 


# Left outer join on Dealerships
SELECT * 
FROM dealerships d
LEFT JOIN cars c
ON d.car_id = c.car_id AND d.location='Dallas'