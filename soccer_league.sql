DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;
\c soccer_league


CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  team_name_id INTEGER REFERENCES teams
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  referee_name TEXT NOT NULL
);


CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  season_start_date DATE NOT NULL,
  season_end_date DATE NOT NULL
);

CREATE TABLE games
(
  id SERIAL PRIMARY KEY,
  season_id INTEGER REFERENCES seasons,
  team_1_id INTEGER REFERENCES teams,
  team_2_id INTEGER REFERENCES teams,
  game_date DATE NOT NULL,
  referee_1_id INTEGER REFERENCES referees,
  referee_2_id INTEGER REFERENCES referees
  winning_team_id INTEGER REFERENCES teams,
);

CREATE TABLE results 
(
  id SERIAL PRIMARY KEY,
  game_id INTEGER REFERENCES games,
  winning_team_id INTEGER REFERENCES teams
)


CREATE TABLE goals 
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players,
  game_id INTEGER REFERENCES games
);

