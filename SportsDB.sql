DROP DATABASE IF EXISTS sportdb; 

CREATE DATABASE IF NOT EXISTS sportdb; 

USE sportdb; 

CREATE TABLE IF NOT EXISTS person 
  ( 
     dni        CHAR(9), 
     first_name VARCHAR(20) NOT NULL, 
     last_name  VARCHAR(30) NOT NULL, 
     birth_date DATE NOT NULL, 
     gender     VARCHAR(50) DEFAULT 'undefined', 
     country    VARCHAR(20) NOT NULL, 
     PRIMARY KEY(dni) 
  ); 

CREATE TABLE IF NOT EXISTS discipline 
  ( 
     id_discipline   INT auto_increment, 
     name_discipline VARCHAR(30), 
     PRIMARY KEY(id_discipline) 
  ); 

CREATE TABLE IF NOT EXISTS staff 
  ( 
     dni           CHAR(9), 
     id_discipline INT NOT NULL, 
     job           ENUM('Medical', 'Mechanic', 'Trainer', 'Physiotherapist', 
     'Security', 
     'Referee', 
     'Commentator', 'Ticket Booth Manager', 'Ball Boy/Gal/They') NOT NULL, 
     FOREIGN KEY (dni) REFERENCES person(dni), 
     FOREIGN KEY(id_discipline) REFERENCES discipline(id_discipline) 
  ); 

CREATE TABLE IF NOT EXISTS fan 
  ( 
     dni           CHAR(9), 
     contract_date DATE NOT NULL, 
     expiry_date   DATE DEFAULT '1/1/1', 
     FOREIGN KEY (dni) REFERENCES person(dni) 
  ); 

CREATE TABLE IF NOT EXISTS tournament 
  ( 
     id_tournament   INT auto_increment, 
     id_discipline   INT NOT NULL, 
     tournament_name VARCHAR(30) NOT NULL, 
     country         VARCHAR(3) NOT NULL, 
     PRIMARY KEY (id_tournament), 
     FOREIGN KEY (id_discipline) REFERENCES discipline (id_discipline) 
  ); 

CREATE TABLE IF NOT EXISTS stadium 
  ( 
     id_stadium   INT auto_increment, 
     stadium_name VARCHAR(50) NOT NULL, 
     capacity     INT NOT NULL, 
     location     VARCHAR(30) NOT NULL, 
     PRIMARY KEY(id_stadium) 
  ); 

CREATE TABLE IF NOT EXISTS club 
  ( 
     club_code INT auto_increment, 
     club_name VARCHAR(30) NOT NULL, 
     PRIMARY KEY(club_code) 
  ); 

CREATE TABLE IF NOT EXISTS team 
  ( 
     team_code      INT auto_increment, 
     club_code      INT NOT NULL, 
     id_discipline  INT NOT NULL, 
     team_name      VARCHAR(50) NOT NULL, 
     number_players INT NOT NULL, 
     trainer_dni    CHAR(9) NOT NULL, 
     PRIMARY KEY (team_code), 
     FOREIGN KEY (club_code) REFERENCES club(club_code), 
     FOREIGN KEY (id_discipline) REFERENCES discipline (id_discipline), 
     FOREIGN KEY (trainer_dni) REFERENCES staff(dni) 
  ); 

CREATE TABLE IF NOT EXISTS fan_supports_team 
  ( 
     team_code INT NOT NULL, 
     dni       CHAR(9) NOT NULL, 
     FOREIGN KEY (team_code) REFERENCES team(team_code), 
     FOREIGN KEY (dni) REFERENCES fan(dni) 
  ); 

CREATE TABLE IF NOT EXISTS sportman 
  ( 
     dni           CHAR(9) NOT NULL, 
     player_number INT DEFAULT 0 NOT NULL, 
     score         INT DEFAULT 0 NOT NULL, 
     team_code     INT NOT NULL, 
     id_discipline INT NOT NULL, 
     FOREIGN KEY (dni) REFERENCES person (dni), 
     FOREIGN KEY (team_code) REFERENCES team (team_code), 
     FOREIGN KEY (id_discipline) REFERENCES discipline (id_discipline) 
  ); 

CREATE TABLE IF NOT EXISTS game 
  ( 
     date_match    DATE, 
     id_game       INT auto_increment NOT NULL, 
     id_stadium    INT NOT NULL, 
     id_tournament INT NOT NULL, 
     id_local_team INT NOT NULL, 
     local_result  ENUM('Winner', 'Loser', 'Tied', 'Other') NOT NULL, 
     local_score   VARCHAR(30) NOT NULL, 
     id_guest_team INT NOT NULL, 
     guest_result  ENUM('Winner', 'Loser', 'Tied', 'Other') NOT NULL, 
     guest_score   VARCHAR(30) NOT NULL, 
     INDEX (date_match), 
     PRIMARY KEY (id_game, id_tournament), 
     FOREIGN KEY (id_local_team) REFERENCES team (team_code), 
     FOREIGN KEY (id_guest_team) REFERENCES team (team_code), 
     FOREIGN KEY (id_tournament) REFERENCES tournament (id_tournament), 
     FOREIGN KEY (id_stadium) REFERENCES stadium (id_stadium) 
  ); 

CREATE TABLE IF NOT EXISTS fan_attends_game 
  ( 
     dni           CHAR(9) NOT NULL, 
     id_tournament INT NOT NULL, 
     date_match    DATE NOT NULL, 
     id_local_team INT NOT NULL, 
     id_guest_team INT NOT NULL, 
     FOREIGN KEY (dni) REFERENCES fan (dni), 
     FOREIGN KEY (date_match) REFERENCES game (date_match), 
     FOREIGN KEY (id_tournament) REFERENCES game (id_tournament), 
     FOREIGN KEY (id_local_team) REFERENCES team (team_code), 
     FOREIGN KEY (id_guest_team) REFERENCES team (team_code) 
  ); 

CREATE TABLE IF NOT EXISTS player_plays_game 
  ( 
     dni           CHAR(9) NOT NULL, 
     id_tournament INT NOT NULL, 
     score         INT NOT NULL, 
     penalties     VARCHAR(50) NOT NULL, 
     date_match    DATE NOT NULL, 
     id_local_team INT NOT NULL, 
     id_guest_team INT NOT NULL, 
     FOREIGN KEY (dni) REFERENCES sportman (dni), 
     FOREIGN KEY (id_tournament) REFERENCES tournament (id_tournament), 
     FOREIGN KEY (date_match) REFERENCES game (date_match), 
     FOREIGN KEY (id_local_team) REFERENCES team (team_code), 
     FOREIGN KEY (id_guest_team) REFERENCES team (team_code) 
  ); 

CREATE TABLE IF NOT EXISTS injuries 
  ( 
     dni                  CHAR(9) NOT NULL, 
     injury_description   LONGTEXT NOT NULL, 
     injury_date          DATE NOT NULL, 
     injury_recovery_date DATE DEFAULT '1/1/1', 
     PRIMARY KEY (DNI,injury_date),
     FOREIGN KEY (DNI) REFERENCES sportman(dni) 
  ); 

CREATE TABLE IF NOT EXISTS staff_works_game 
  ( 
     dni           CHAR(9) NOT NULL, 
     id_tournament INT NOT NULL, 
     date_match    DATE NOT NULL, 
     id_local_team INT NOT NULL, 
     id_guest_team INT NOT NULL, 
     FOREIGN KEY (dni) REFERENCES staff (dni), 
     FOREIGN KEY (id_tournament) REFERENCES tournament (id_tournament), 
     FOREIGN KEY (date_match) REFERENCES game (date_match), 
     FOREIGN KEY (id_local_team) REFERENCES team (team_code), 
     FOREIGN KEY (id_guest_team) REFERENCES team (team_code) 
  ); 

CREATE TABLE IF NOT EXISTS staff_works_for_team 
  ( 
     dni             VARCHAR(9) NOT NULL, 
     team_code       INT NOT NULL, 
     contract_date   DATE NOT NULL, 
     contract_expiry DATE NOT NULL, 
     salary          BIGINT NOT NULL, 
     FOREIGN KEY (dni) REFERENCES staff(dni), 
     FOREIGN KEY (team_code) REFERENCES team(team_code) 
  ); 

CREATE TABLE IF NOT EXISTS sportman_works_for_team 
  ( 
     dni             VARCHAR(9) NOT NULL, 
     team_code       INT NOT NULL, 
     contract_date   DATE NOT NULL, 
     contract_expiry DATE NOT NULL, 
     salary          BIGINT NOT NULL, 
     FOREIGN KEY (dni) REFERENCES sportman(dni), 
     FOREIGN KEY (team_code) REFERENCES team(team_code) 
  ); 