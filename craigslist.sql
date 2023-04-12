DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;
\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region_name TEXT NOT NULL
);

INSERT INTO regions
(region_name)
VALUES 
('Pacific North West'),
('North East '),
('Mid West');

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category_name TEXT NOT NULL
);

INSERT INTO categories
(category_name)
VALUES 
('Animals'),
('Services'),
('Furniture');

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  preferred_region_id INTEGER REFERENCES regions
);

INSERT INTO users
(first_name, last_name, preferred_region_id)
VALUES 
('Jennifer', 'Finch', 1),
('Alvin', 'Leathes', 2),
('Berkie', 'Wycliff', 1);

CREATE TABLE posts 
(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users,
  post_title TEXT NOT NULL,
  post_text TEXT,
  post_location TEXT, 
  region_id INTEGER REFERENCES regions,
  category_id INTEGER REFERENCES categories
);

INSERT INTO posts
(user_id, post_title, post_text, post_location, region_id, category_id)
VALUES 
(1, 'Looking for cleaning services', null, 'San Diego, CA', 1, 2),
(2, 'Looking for chairs', null, 'Portland, OR', 2, 1),
(3, 'Doodle puppies', '5 doodle pups need homes!', 'Santa Barbara, CA', 1, 3);