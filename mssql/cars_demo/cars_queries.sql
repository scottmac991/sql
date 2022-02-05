use classicmodels;

SELECT * FROM customers;

SELECT * FROM cars;
SELECT * FROM vehicles;
SELECT * FROM autos;


#DROP TABLE cars;
#DROP TABLE vehicles;

CREATE TABLE IF NOT EXISTS cars (
    car_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    built_date DATE NOT NULL,
    num_doors INT NOT NULL,
    engine_type VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehicles (
    car_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    built_date DATE NOT NULL,
    num_doors INT NOT NULL,
    engine_type VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS autos (
    car_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    built_date DATE NOT NULL,
    num_doors INT NOT NULL,
    engine_type VARCHAR(10) NOT NULL
);

DROP TABLE dealerships;
CREATE TABLE IF NOT EXISTS dealerships (
    dealership_id INT NOT NULL,
    car_id INT NOT NULL,
    location VARCHAR(50) NOT NULL
);

INSERT INTO cars (car_id, name, built_date, num_doors, engine_type)
VALUES
(1, 'bmw', 			'2018-04-16', 2, 'I6'),
(2, 'lexus', 		'2018-05-23', 4, 'V6'),
(3, 'jeep', 		'2019-01-10', 5, 'I4'),
(4, 'maserati', 	'2019-03-05', 2, 'V10'),
(5, 'ford', 		'2020-06-09', 4, 'V6'),
(6, 'audi', 		'2020-07-20', 3, 'I4');
SELECT * FROM cars;


DELETE FROM dealerships;
select * FROM dealerships where location='Dallas';
INSERT INTO dealerships (dealership_id, car_id, location)
VALUES
(10, 1, 'NY'),
(10, 3, 'NY'),
(10, 4, 'NY'),
(10, 9, 'NY'),
(20, 2, 'California'),
(20, 5, 'California'),
(20, 9, 'California'),
(30, 1, 'Dallas'),
(30, 2, 'Dallas'),
(30, 4, 'Dallas'),
(30, 6, 'Dallas'),
(30, 7, 'Dallas'),
(30, 8, 'Dallas');

# Find all dealerships that don't carry jeeps - as a subquery
SELECT *
 	  FROM dealerships 
 	  WHERE car_id = 3;
 	  
SELECT  d.location
FROM dealerships d
WHERE NOT EXISTS 
(
	SELECT dealership_id
 	FROM dealerships 
 	WHERE car_id = 3 AND dealership_id = d.dealership_id
)
GROUP BY d.location
;

SELECT DISTINCT c.*, d.location
FROM dealerships d
LEFT JOIN cars c ON d.car_id = c.car_id AND d.car_id = 3;


SELECT MAX(car_id)
FROM dealerships d1 
WHERE location='Dallas'
AND car_id NOT IN 
	(SELECT max(car_id) FROM dealerships WHERE location=d1.location)
;

SELECT location, AVG(car_id) as avg_id
FROM dealerships
GROUP BY location
HAVING avg_id > 4.5
;

# -- JOINS --
# Inner join
SELECT c.car_id as 'Car ID', c.name as carname, c.built_date as builtdate, d.dealership_id, d.location, d.car_id as 'Dealership Car ID'  
FROM cars c
INNER JOIN dealerships d
ON c.car_id = d.car_id;


# Left outer join on Cars
SELECT *  
FROM cars c
LEFT JOIN dealerships d 
ON c.car_id = d.car_id
ORDER BY c.car_id
;

# Left outer join on Cars
SELECT COUNT(*) FROM cars ;
SELECT *
FROM cars c
LEFT JOIN dealerships d 
ON c.car_id = d.car_id AND d.location = 'Dallas'
;

# Left outer join on Dealerships
SELECT * FROM dealerships;
SELECT * 
FROM dealerships d
LEFT JOIN cars c
ON d.car_id = c.car_id 
;

# Left outer join on Dealerships
SELECT * 
FROM dealerships d
LEFT JOIN cars c
ON d.car_id = c.car_id AND d.location='Dallas';


INSERT INTO vehicles (car_id, name, built_date, num_doors, engine_type)
VALUES
(1, 'bmw', 			'2018-04-16', 2, 'I6'),
(2, 'lexus', 		'2018-05-23', 4, 'V6'),
(3, 'jeep', 		'2019-01-10', 5, 'I4'),
(4, 'maserati', 	'2019-03-05', 2, 'V10'),
(5, 'ford', 		'2020-06-09', 4, 'V6'),
(6, 'audi', 		'2020-07-20', 3, 'I4'),
(7, 'chevy', 		'2020-08-01', 4, 'V8'),
(8, 'kia', 			'2017-12-23', 2, 'I4'),
(9, 'mini', 		'2016-10-17', 3, 'I4');

DELETE FROM autos;
INSERT INTO autos (car_id, name, built_date, num_doors, engine_type)
VALUES
(1, 'bmw', 			'2018-04-16', 2, 'I6'),
(2, 'lexus', 		'2018-05-23', 4, 'V6'),
(4, 'maserati', 	'2019-03-05', 2, 'V10'),
(7, 'chevy', 		'2020-08-01', 4, 'V8'),
(9, 'mini', 		'2016-10-17', 3, 'I4'),
(10, 'mercedes', 	'2016-11-25', 3, 'V6'),
(11, 'toyota', 		'2016-11-27', 3, 'I4');