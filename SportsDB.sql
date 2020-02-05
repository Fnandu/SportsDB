DROP DATABASE IF EXISTS SportDB;
CREATE DATABASE IF NOT EXISTS SportDB;

USE SportDB;
	
    /*Create superclass Person and turn Staff - Fan - Sportman into subclasses of Person*/
CREATE TABLE IF NOT EXISTS Staff (
    dni CHAR(9) NOT NULL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    discipline VARCHAR(30),
    staff_role enum('Medical','Mechanic','Trainer','Physiotherapist','Security','Referee','Commentator','Ticket Booth Manager','Ball Boy/Gal/They'),
    gender VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Team (
    team_code INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    Team_name VARCHAR(20) NOT NULL,
    discipline VARCHAR(30) NOT NULL,
    number_players INT NOT NULL,
    trainer_DNI CHAR(9),
    PRIMARY KEY (team_code),
    FOREIGN KEY (trainer_DNI)
        REFERENCES Staff (dni)
);

CREATE TABLE IF NOT EXISTS Sportman (
    dni CHAR(9),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(50),
    discipline VARCHAR(20),
    country VARCHAR(20) NOT NULL,
    local_player_code INT,
    score INT,
    team_code INT UNSIGNED NOT NULL,
    PRIMARY KEY (dni),
    FOREIGN KEY (team_code)
        REFERENCES Team (team_code)
);

CREATE TABLE IF NOT EXISTS Fan (
    DNI CHAR(9),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    PRIMARY KEY (DNI)
);

CREATE TABLE IF NOT EXISTS Fan_Supports_Team (
    team_code INT UNSIGNED NOT NULL UNIQUE,
    DNI CHAR(9),
    FOREIGN KEY (team_code)
        REFERENCES Team (team_code),
    FOREIGN KEY (DNI)
        REFERENCES Fan (DNI)
);



CREATE TABLE IF NOT EXISTS Tournament (
    id_tournament INT AUTO_INCREMENT NOT NULL UNIQUE,
    tournament_name VARCHAR(30),
    discipline VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_tournament)
);

CREATE TABLE IF NOT EXISTS Stadium (
    idStadium INT UNSIGNED NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    stadium_name VARCHAR(50),
    capacity INT,
    location VARCHAR(30),
    Home_team INT UNSIGNED UNIQUE NOT NULL,
    FOREIGN KEY (Home_team)
        REFERENCES Team (team_code)
);

CREATE TABLE IF NOT EXISTS Game (
    date_match DATE,
    id_tournament INT NOT NULL UNIQUE,
    id_local_team INT UNSIGNED UNIQUE NOT NULL,
    local_result ENUM('Winner', 'Loser', 'Tied', 'Other') NOT NULL,
    local_other_result VARCHAR(30),
    id_guest_team INT UNSIGNED UNIQUE NOT NULL,
    guest_result ENUM('Winner', 'Loser', 'Tied', 'Other') NOT NULL,
    guest_other_result VARCHAR(30),
    stadium_name VARCHAR(30),
    stadium_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_local_team,id_guest_team,date_match),
    INDEX (date_match),
    FOREIGN KEY (id_local_team)
        REFERENCES Team (team_code),
    FOREIGN KEY (id_guest_team)
        REFERENCES Team (team_code),
    FOREIGN KEY (stadium_id)
        REFERENCES Stadium (idStadium),
    FOREIGN KEY (id_tournament)
        REFERENCES Tournament (id_tournament)
);

CREATE TABLE IF NOT EXISTS Fan_Attends_Game (
    DNI CHAR(9),
    date_match DATE,
    id_tournament INT NOT NULL UNIQUE,
    id_local_team INT UNSIGNED UNIQUE NOT NULL,
    id_guest_team INT UNSIGNED UNIQUE NOT NULL,
    FOREIGN KEY (DNI)
        REFERENCES Fan (DNI),
    FOREIGN KEY (date_match)
        REFERENCES Game (date_match),
    FOREIGN KEY (id_tournament)
        REFERENCES Game (id_tournament),
    FOREIGN KEY (id_local_team)
        REFERENCES Team (team_code),
    FOREIGN KEY (id_guest_team)
        REFERENCES Team (team_code)
);


/*Create table Player_plays_in_Game where we store the score of each player and if there are incidences such as lesions or penalties*/



/*Create Inserts for all the new elements, such as games, fans and tournaments*/

/*Staff ---> dni, first_name, last_name, birth_date discipline */

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('43511241J', 'Zinedine', 'Zidane', '1971-05-20', 'Football');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('45555141H', 'Ernesto', 'Valverde', '1971-11-15', 'Tennis');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('51243524S', 'Pablo', 'Laso', '1966-04-20', 'Formula_1');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('55151543G', 'Matia', 'Binnoto', '1977-11-15', 'Basketball');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('41524254B', 'Tiger', 'Woods', '1969-07-02', 'Golf');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('41152846A', 'Pep', 'Guardiola', '1975-08-27', 'Cycling');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('45256585C', 'Enric', 'Mas', '1996-11-12', 'Athletics');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('48562457J', 'Lewis', 'Hamilton', '1985-1-7', 'Formula_1');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('41214124M', 'José', 'Mourinho', '1963-1-26', 'Football');

INSERT INTO Staff (dni, first_name, last_name, birth_date, discipline) VALUES ('45121535Q', 'Aritz', 'Lopez', '1979-4-10', 'Football');

/*Team ---> Team_code,Team_name,discipline,number_players,trainer_DNI*/

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('Betis_CF','Football',18,'43511241J');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('New_York_Knicks','Basketball',13,'55151543G');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('RCD_Mallorca','Cycling',1,'41152846A');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('Movistar_Estudiantes','Tennis',1,'45555141H');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('Ferrari','Formula_1',1,'51243524S');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('Real_Sociedad','Golf',1,'41524254B');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('Barcelona','Athletics',1,'45256585C');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('YAMAHA','Formula_1',19,'48562457J');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('Real_Madrid','Football',18,'41214124M');

insert into Team(Team_name,discipline,number_players,trainer_DNI) values('Iberostar_Tenerife','Football',19,'45121535Q');

/* Sportman ---> dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code */

insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('40284753G','Jose','Gutierrez','1995-05-10','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Athletics','ESP',3,0,2);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('40284754H','Ivan','Paredes','1994-04-05','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Tennis','ESP',5,1,5);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('40284755I','Maria','Diaz','1993-05-28','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Football','ESP',8,10,1);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('40284756J','Eva','Espases','1996-08-09','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Cycling','USA',10,23,3);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('40284757K','Roberto','Marti','1995-08-23','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Formula 1','ESP',11,5,8);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('40284758L','Marcos','Febrer','1994-02-22','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Football','USA',4,2,10);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('64258684O','Carlos','Sainz','1993-01-28','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Golf','ESP',3,2,6);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('71256849H','Sonia','Florit','1994-09-17','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Athletics','ESP',1,2,7);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('16359725I','Jorge','Frau','1995-08-15','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Cycling','ESP',5,2,3);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('56324895P','Ana','Florit','1994-07-12','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Football','ESP',6,2,9);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('28469531M','David','Ruiz','1993-10-16','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Tennis','ESP',8,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('15629476J','Marta','Pascual','1996-07-10','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Cycling','ESP',8,2,3);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('45362894Y','Laura','Febrer','1995-04-30','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Football','ESP',7,2,10);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('65439574P','Susana','Rebassa','1994-11-12','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Basketball','ESP',9,2,2);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('10203540S','Alex','Rodríguez','1993-03-03','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Tennis','USA',7,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('32605491K','David','Sánchez','1996-04-22','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Formula 1','ESP',8,2,5);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('01623058N','Cristina','Martinez','1995-08-25','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Tennis','USA',10,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,local_player_code,score,team_code) values('15630248T','Miquel','Vidal','1994-06-20','NON-BINARY-GENDER ( BOEING AH-64 APACHE )','Football','ESP',7,2,9);


/* Tounament ---> id_tournament,tournament_name */

insert into Tournament(tournament_name, discipline) values ('National_Championship','Basketball');

insert into Tournament(tournament_name, discipline) values ('International_Championship','Football');

insert into Tournament(tournament_name, discipline) values ('Eurocup','Football');

insert into Tournament(tournament_name, discipline) values ('Worldcup','Football');