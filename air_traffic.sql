-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL

);

INSERT INTO customers
(first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thades', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton');


CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL

);

INSERT INTO airlines
(airline_name)
VALUES
('United'),
('British Airways'),
('Delta'),
('Air China'),
('American Airlines');

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL

);

INSERT INTO cities
(city)
VALUES
('Washington DC'),
('Tokyo'),
('New York'),
('Paris'),
('Dubai');

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL

);

INSERT INTO countries
(country)
VALUES
('USA'),
('Japan'),
('France'),
('UAE'),
('Brazil');



CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines,
  from_city INTEGER REFERENCES cities,
  from_country INTEGER REFERENCES cities,
  to_city INTEGER REFERENCES countries,
  to_country INTEGER REFERENCES countries
);

INSERT INTO tickets
  (customer_id, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 4, 2, 3, 1),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 3,2,4,5,1),
  (1, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00',2,2,2,4,3),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00',3,3,4,1,1),
  (3, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 3,3,3,5,4),
  (1, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 1,1,1,4,1),
  (3, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00',2,3,2,3,2),
  (4, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 5,4,3,2,1),
  (1, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 3,4,3,1,2),
  (4, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 4,4,4,4,5);