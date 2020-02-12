DROP DATABASE IF EXISTS SportDB;
CREATE DATABASE IF NOT EXISTS SportDB;
USE SportDB;

CREATE TABLE IF NOT EXISTS Person (
  DNI CHAR(9), 
  first_name VARCHAR(20) NOT NULL, 
  last_name VARCHAR(30) NOT NULL, 
  birth_date DATE NOT NULL, 
  gender VARCHAR(50), 
  country VARCHAR(20) NOT NULL, 
  PRIMARY KEY(dni)
);
CREATE TABLE IF NOT EXISTS Staff (
  DNI CHAR(9), 
  discipline VARCHAR(30), 
  job enum(
    'Medical', 'Mechanic', 'Trainer', 
    'Physiotherapist', 'Security', 'Referee', 
    'Commentator', 'Ticket Booth Manager', 
    'Ball Boy/Gal/They'
  ), 
  foreign key (DNI) REFERENCES Person(DNI)
);
CREATE TABLE IF NOT EXISTS Fan (
  DNI CHAR(9), 
  contract_date DATE,
  expiry_date DATE,
  foreign key (DNI) REFERENCES Person(DNI)
);
CREATE TABLE IF NOT EXISTS Tournament (
  id_tournament INT AUTO_INCREMENT, 
  tournament_name VARCHAR(30), 
  discipline VARCHAR(30) NOT NULL, 
  PRIMARY KEY(id_tournament)
);
CREATE TABLE IF NOT EXISTS Stadium (
  id_stadium INT AUTO_INCREMENT, 
  stadium_name VARCHAR(50), 
  capacity INT, 
  location VARCHAR(30), 
  PRIMARY KEY(id_stadium)
);
CREATE TABLE IF NOT EXISTS Team (
  team_code INT AUTO_INCREMENT, 
  team_name VARCHAR(50) NOT NULL, 
  discipline VARCHAR(30) NOT NULL, 
  number_players INT NOT NULL, 
  trainer_DNI CHAR(9), 
  PRIMARY KEY (team_code), 
  FOREIGN KEY (trainer_DNI) REFERENCES Staff(DNI)
);
CREATE TABLE IF NOT EXISTS Fan_Supports_Team (
  team_code INT, 
  DNI CHAR(9), 
  FOREIGN KEY (team_code) REFERENCES Team(team_code), 
  FOREIGN KEY (dni) REFERENCES Fan(DNI)
);
CREATE TABLE IF NOT EXISTS Sportman (
  DNI CHAR(9), 
  discipline VARCHAR(20), 
  player_number INT, 
  score INT, 
  team_code INT, 
  CONSTRAINT Comp_Sportman_Key PRIMARY KEY (DNI,discipline) ,
  FOREIGN KEY (DNI) REFERENCES Person (DNI), 
  FOREIGN KEY (team_code) REFERENCES Team (team_code)
);
CREATE TABLE IF NOT EXISTS Game (
  date_match DATE, 
  id_game int auto_increment not null, 
  id_stadium INT, 
  
  /*This has to be updated into a comparative auto increment where as it creates unique a counter*/
  id_tournament INT NOT NULL UNIQUE, 
  id_local_team INT, 
  local_result ENUM(
    'Winner', 'Loser', 'Tied', 'Other'
  ), 
  local_score VARCHAR(30), 
  id_guest_team INT, 
  guest_result ENUM(
    'Winner', 'Loser', 'Tied', 'Other'
  ), 
  guest_score VARCHAR(30), 
  INDEX (date_match), 
  PRIMARY KEY (id_game, id_tournament), 
  FOREIGN KEY (id_local_team) REFERENCES Team (team_code), 
  FOREIGN KEY (id_guest_team) REFERENCES Team (team_code), 
  FOREIGN KEY (id_tournament) REFERENCES Tournament (id_tournament), 
  FOREIGN KEY (id_stadium) REFERENCES Stadium (id_stadium)
);
CREATE TABLE IF NOT EXISTS Fan_Attends_Game (
  DNI CHAR(9), 
  id_tournament INT NOT NULL UNIQUE, 
  date_match DATE, 
  id_local_team INT, 
  id_guest_team INT, 
  FOREIGN KEY (DNI) REFERENCES Fan (DNI), 
  FOREIGN KEY (date_match) REFERENCES Game (date_match), 
  FOREIGN KEY (id_tournament) REFERENCES Game (id_tournament), 
  FOREIGN KEY (id_local_team) REFERENCES Team (team_code), 
  FOREIGN KEY (id_guest_team) REFERENCES Team (team_code)
);
/*Create table Player_plays_in_Game where we store the score of each player and if there are incidences such as lesions or penalties*/
CREATE TABLE IF NOT EXISTS Player_Plays_Game (
  DNI CHAR(9), 
  id_tournament INT, 
  score INT, 
  penalties varchar(50), 
  date_match DATE, 
  id_local_team INT, 
  id_guest_team INT, 
  FOREIGN KEY (DNI) REFERENCES Sportman (DNI), 
  FOREIGN KEY (id_tournament) REFERENCES Tournament (id_tournament), 
  FOREIGN KEY (date_match) REFERENCES Game (date_match), 
  FOREIGN KEY (id_local_team) REFERENCES Team (team_code), 
  FOREIGN KEY (id_guest_team) REFERENCES Team (team_code)
);
Create table if not exists Injuries (
  DNI CHAR(9), 
  Injury_Description longtext not null, 
  Injury_Date date not null, 
  Injury_Recovery_Date date, 
  FOREIGN KEY (DNI) REFERENCES Sportman(DNI)
);
Create table if not exists Staff_Works_Game (
  DNI CHAR(9), 
  id_tournament INT, 
  date_match DATE, 
  id_local_team INT, 
  id_guest_team INT, 
  foreign key (DNI) references Staff (DNI), 
  FOREIGN KEY (id_tournament) REFERENCES Tournament (id_tournament), 
  FOREIGN KEY (date_match) REFERENCES Game (date_match), 
  FOREIGN KEY (id_local_team) REFERENCES Team (team_code), 
  FOREIGN KEY (id_guest_team) REFERENCES Team (team_code)
);

