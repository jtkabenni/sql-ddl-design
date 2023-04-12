DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);



CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE song_artist
(
  id SERIAL PRIMARY KEY,
  artist_id INTEGER REFERENCES artists,
  song_id INTEGER REFERENCES songs
);

CREATE TABLE song_producer
(
  id SERIAL PRIMARY KEY,
  producer_id INTEGER REFERENCES producers,
  song_id INTEGER REFERENCES songs
);


INSERT INTO artists 
(artist_name) 
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO producers 
(producer_name) 
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs 
(title, duration_in_seconds, release_date, album) 
VALUES
('MMMBop', 238, '1997-04-15', 'Middle of Nowhere'),
('Bohemian Rhapsody', 355, '1975-10-31', 'A Night at the Opera'),
('One Sweet Day', 282, '1995-11-14', 'Daydream'),
('Shallow', 216, '2018-09-27', 'A Star Is Born'),
('How You Remind Me', 223, '2001-08-21', 'Silver Side Up'),
('New York State of Mind', 276, '2009-10-20', 'The Blueprint 3'),
('Dark Horse', 215, '2013-12-17', 'Prism'),
('Moves Like Jagger', 201, '2011-06-21', 'Hands All Over'),
('Complicated', 244, '2002-05-14', 'Let Go'),
('Say My Name', 240, '1999-11-07', 'The Writing''s on the Wall');

INSERT INTO song_artist (song_id, artist_id) 
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (3, 4),
  (4, 5),
  (4, 6),
  (5, 7),
  (6, 8),
  (6, 9),
  (7, 10),
  (7, 11),
  (8, 12),
  (8, 13),
  (9, 14),
  (10, 15);

INSERT INTO song_producer (song_id, producer_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3);