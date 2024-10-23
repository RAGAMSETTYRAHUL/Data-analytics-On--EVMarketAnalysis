CREATE DATABASE EVMarketAnalysis;
USE EVMarketAnalysis;

CREATE TABLE EV_Manufacturers (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    manufacturer_name VARCHAR(100),
    country VARCHAR(50),
    year_established INT
);

INSERT INTO EV_Manufacturers (manufacturer_name, country, year_established)
VALUES 
('Tesla', 'USA', 2003),
('BYD', 'China', 1995),
('Nio', 'China', 2014),
('Rivian', 'USA', 2009),
('BMW', 'Germany', 1916);

CREATE TABLE EV_Models (
    model_id INT PRIMARY KEY AUTO_INCREMENT,
    manufacturer_id INT,
    model_name VARCHAR(100),
    battery_capacity_kWh DECIMAL(5,2),
    range_km DECIMAL(5,1),
    price_usd DECIMAL(10,2),
    year_released INT,
    FOREIGN KEY (manufacturer_id) REFERENCES EV_Manufacturers(manufacturer_id)
);

INSERT INTO EV_Models (manufacturer_id, model_name, battery_capacity_kWh, range_km, price_usd, year_released)
VALUES 
(1, 'Model S', 100.0, 647.0, 79990.00, 2012),
(1, 'Model 3', 75.0, 500.0, 46990.00, 2017),
(2, 'Tang EV', 86.4, 520.0, 31000.00, 2021),
(3, 'ES8', 100.0, 580.0, 68000.00, 2018),
(4, 'R1T', 135.0, 505.0, 73000.00, 2021),
(5, 'i4', 80.7, 590.0, 56000.00, 2020);

CREATE TABLE Sales_Data (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    model_id INT,
    country VARCHAR(50),
    year INT,
    units_sold INT,
    revenue_usd DECIMAL(12,2),
    FOREIGN KEY (model_id) REFERENCES EV_Models(model_id)
);

INSERT INTO Sales_Data (model_id, country, year, units_sold, revenue_usd)
VALUES 
(1, 'USA', 2023, 40000, 3199600000.00),
(2, 'Germany', 2023, 35000, 1644650000.00),
(3, 'China', 2023, 50000, 1550000000.00),
(4, 'USA', 2023, 12000, 816000000.00),
(5, 'Germany', 2023, 18000, 1008000000.00),
(6, 'UK', 2023, 14000, 784000000.00);

CREATE TABLE Charging_Stations (
    station_id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(50),
    city VARCHAR(50),
    station_count INT,
    total_capacity_kWh DECIMAL(10,2),
    year INT
);

INSERT INTO Charging_Stations (country, city, station_count, total_capacity_kWh, year)
VALUES 
('USA', 'Los Angeles', 150, 5000.00, 2023),
('Germany', 'Berlin', 100, 3000.00, 2023),
('China', 'Shanghai', 200, 6000.00, 2023),
('UK', 'London', 120, 3600.00, 2023),
('USA', 'New York', 170, 5400.00, 2023);

