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
  PRIMARY KEY(DNI), 
  foreign key (DNI) REFERENCES Person(DNI)
);
CREATE TABLE IF NOT EXISTS Fan (
  DNI CHAR(9), 
  contract_date DATE,
  expiry_date DATE,
  PRIMARY KEY(DNI), 
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
  team_name VARCHAR(20) NOT NULL, 
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
  PRIMARY KEY (DNI), 
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
  penalties INT, 
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
  foreign key (DNI) references STAFF(DNI), 
  FOREIGN KEY (id_tournament) REFERENCES Tournament (id_tournament), 
  FOREIGN KEY (date_match) REFERENCES Game (date_match), 
  FOREIGN KEY (id_local_team) REFERENCES Team (team_code), 
  FOREIGN KEY (id_guest_team) REFERENCES Team (team_code)
);
/*Create Inserts for all the new elements, such as games, fans and tournaments*/

/*Person --> DNI, First Name, Last Name, Birth date, Gender, Country*/
INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '43511241J', 'Zinedine', 'Zidane', 
    '1971-05-20', 'Male', "ESP"
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '45555141H', 'Ernesto', 'Valverde', 
    '1971-11-15', 'Male', "POR"
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '51243524S', 'Pablo', 'Laso', '1966-04-20', 
    'Male',"ESP"
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '55151543G', 'Matia', 'Binnoto', '1977-11-15', 
    'Female', "ITA"
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

)  
VALUES 
  (
    '41524254B', 'Tiger', 'Woods', '1969-07-02', 
    'Male', "USA"
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '40284753G', 'Pep', 'Guardiola', '1975-08-27', 
    'Male', "ESP"
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '45256585C', 'Enric', 'Mas', '1996-11-12', 
    'Male', "ESP"
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '48562457J', 'Lewis', 'Hamilton', 
    '1985-1-7', 'Male', 'ESP'
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '41214124M', 'José', 'Mourinho', 
    '1963-1-26', 'Male', 'ESP'
  );
INSERT INTO Person (
   dni, first_name, last_name, birth_date, gender, country

) 
VALUES 
  (
    '45121535Q', 'Aritz', 'Lopez', '1979-4-10', 
    'Female', 'CHN'
  );
/*Stadium --->*/
INSERT INTO Stadium(stadium_name, capacity, location) 
VALUES 
  (
    "Iberostar Stadium", 67000, "Mallorca"
  );
INSERT INTO Stadium(stadium_name, capacity, location) 
VALUES 
  (
    "Santiago Bernabeu", 97000, "Madrid"
  );
INSERT INTO Stadium(stadium_name, capacity, location) 
VALUES 
  (
    "Madison Square Garden", 45000, "New York"
  );
INSERT INTO Stadium(stadium_name, capacity, location) 
VALUES 
  (
    "Pista Tenis por defecto", 2, "Madrid"
  );
INSERT INTO Stadium(stadium_name, capacity, location) 
VALUES 
  (
    "Alguna perdida por el monte", 10000, 
    "Milan"
  );
  
  /*Staff --> DNI, Discipline, Job (   
	'Medical', 'Mechanic', 'Trainer', 
    'Physiotherapist', 'Security', 'Referee', 
    'Commentator', 'Ticket Booth Manager', 
    'Ball Boy/Gal/They'
    )*/
  insert into Staff (
	DNI, Discipline, Job
  ) values
  (
	"43511241J",'Football','Trainer'
  );
  
/*Team ---> Team_code,Team_name,discipline,number_players,trainer_DNI*/
insert into Team(
  Team_name, discipline, number_players, trainer_DNI
) 
values 
  (
    'Betis_CF', 'Football', 18,  '43511241J'
  );
/* Sportman ---> dni,player_number,score,team_code */
insert into Sportman (
	DNI,
  player_number, 
  score, team_code
) 
values 
  (
    '40284753G', 3, 0, 1
  );
/* Tounament ---> id_tournament,tournament_name */
insert into Tournament(tournament_name, discipline) 
values 
  (
    'National_Championship', 'Basketball'
  );
insert into Tournament(tournament_name, discipline) 
values 
  (
    'International_Championship', 'Football'
  );
insert into Tournament(tournament_name, discipline) 
values 
  ('Eurocup', 'Football');
insert into Tournament(tournament_name, discipline) 
values 
  ('Worldcup', 'Football');
  INSERT INTO Tournament(tournament_name, discipline) 
VALUES 
  ("Liga Santander", "Football");
INSERT INTO Tournament(tournament_name, discipline) 
VALUES 
  ("Le Mans", "Racing");
INSERT INTO Tournament(tournament_name, discipline) 
VALUES 
  (
    "Primera Division de Uruguay", "Football"
  );
  
/* Fan -->  DNI,  contract_date, expiry_date  */
INSERT INTO Fan(DNI, contract_date, expiry_date)
VALUES 
  (
    "40284753G", "1961-8-4","1961-12-4"
  );

/* Game -->  Date of the match, ID of the Stadium, Tournament ID,
 ID of local team, Result of local team, Score of local team,
 ID of guest team, Result of guest team, Score of guest team,
 The possible results are(
    'Winner', 'Loser', 'Tied', 'Other'
  )*/
INSERT INTO Game( 
date_match, 
  id_stadium , 
  id_tournament , 
  id_local_team , 
  local_score , 
  local_result, 
  id_guest_team , 
  guest_score,
  guest_result 
   )
VALUES 
  (
    "2017-12-12", 2, 1, 1, 3, "Winner",  9, 0, "Loser"
  );
