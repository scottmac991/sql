if not exists (select * from sysobjects where name='cars' and xtype='U')
    CREATE TABLE cars (
        car_id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        built_date DATE NOT NULL,
        num_doors INT NOT NULL,
        engine_type VARCHAR(10) NOT NULL
    )
go

if not exists (select * from sysobjects where name='dealerships' and xtype='U')
    CREATE TABLE dealerships (
        dealership_id INT NOT NULL,
        car_id INT NOT NULL,
        location VARCHAR(50) NOT NULL
    )
go

INSERT INTO cars (car_id, name, built_date, num_doors, engine_type)
VALUES
(1, 'bmw', 			'2018-04-16', 2, 'I6'),
(2, 'lexus', 		'2018-05-23', 4, 'V6'),
(3, 'jeep', 		'2019-01-10', 5, 'I4'),
(4, 'maserati', 	'2019-03-05', 2, 'V10'),
(5, 'ford', 		'2020-06-09', 4, 'V6'),
(6, 'audi', 		'2020-07-20', 3, 'I4');

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