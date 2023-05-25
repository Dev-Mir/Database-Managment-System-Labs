CREATE DATABASE music;

USE music;


CREATE TABLE Albums (
  album_id INT PRIMARY KEY,
  album_name VARCHAR(255),
  artist_id INT,
  year INT,
  genre VARCHAR(255),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);


CREATE TABLE Artists (
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(255),
  years_active INT,
  genre VARCHAR(255),
  awards VARCHAR(255)
);


CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(20),
  city VARCHAR(255)
);


CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  album_id INT,
  customer_id INT,
  date DATE,
  purchase_price BIGINT,
  FOREIGN KEY (album_id) REFERENCES Albums(album_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

show tables;

INSERT INTO Albums (album_id, album_name, artist_id, year, genre)
VALUES
  (1, 'OK Computer', 1, 2020, 'Rock'),
  (2, 'Revolver',    2, 2018, 'Pop'),
  (3, 'California',  3, 2019, 'Hip Hop'),
  (4, 'Purple Rain', 2, 2021, 'Pop'),
  (5, 'Bad Days',    1, 2017, 'Rock'),
  (6, 'Dirty Dance', 3, 2016, 'Rock'),
  (7, 'The Beatles', 2, 2022, 'Rock'),
  (8, 'Pink Floyd',  1, 2023, 'Rock'),
  (9, 'Meat Loaf',   3, 2015, 'Rock'),
  (10,'Whitney',     2, 2014, 'Rock');
  
 
INSERT INTO Artists (artist_id, artist_name, years_active, genre, awards)
VALUES
  (1, 'John', 10, 'Rock', 'Grammy Award'),
  (2, 'wiki', 5, 'Pop', 'MTV Music Award'),
  (3, 'justine bibar', 3, 'Hip Hop', 'BET Hip Hop Award');

INSERT INTO Customers (customer_id, customer_name, email, phone_number, city)
VALUES
  (1, 'Customer 1', 'customer1@example.com', '1234567890', 'New York'),
  (2, 'Customer 2', 'customer2@example.com', '9876543210', 'Los Angeles'),
  (3, 'Customer 3', 'customer3@example.com', '4567890123', 'Chicago');

INSERT INTO Sales (sale_id, album_id, customer_id, date, purchase_price)
VALUES
  (1, 1, 1, '2022-01-01', 1000),
  (2, 2, 2, '2022-02-01', 1200),
  (3, 1, 3, '2022-03-01', 1000),
  (4, 3, 2, '2022-04-01', 9000),
  (5, 4, 1, '2022-05-01', 4000),
  (6, 5, 3, '2022-06-01', 1100),
  (7, 2, 3, '2022-07-01', 1200),
  (8, 1, 2, '2022-08-01', 1090),
  (9, 3, 1, '2022-09-01', 9000),
  (10, 4, 3, '2022-10-01', 1400);


select * from Albums;
select * from Artists;
select * from Customers;
select * from Sales;


SELECT a.album_name, ar.artist_name, SUM(s.purchase_price) AS total_sales_amount
FROM Albums a
JOIN Artists ar ON a.artist_id = ar.artist_id
JOIN Sales s ON a.album_id = s.album_id
GROUP BY a.album_id
ORDER BY total_sales_amount DESC
LIMIT 10; 

