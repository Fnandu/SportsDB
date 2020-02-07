DROP DATABASE IF EXISTS SportDB;
CREATE DATABASE IF NOT EXISTS SportDB;

USE SportDB;
	
    /*Create superclass Person and turn Staff - Fan - Sportman into subclasses of Person*/

CREATE TABLE IF NOT EXISTS Staff (
    dni CHAR(9) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    discipline VARCHAR(30),
    job enum('Medical','Mechanic','Trainer','Physiotherapist','Security','Referee','Commentator','Ticket Booth Manager','Ball Boy/Gal/They'),
    gender VARCHAR(50),
    PRIMARY KEY(dni)
);


CREATE TABLE IF NOT EXISTS Fan (
    dni CHAR(9) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS Tournament (
    id_tournament INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    tournament_name VARCHAR(30),
    discipline VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Stadium (
    idStadium INT AUTO_INCREMENT,
    stadium_name VARCHAR(50),
    capacity INT,
    location VARCHAR(30),
    PRIMARY KEY(idStadium)
);

CREATE TABLE IF NOT EXISTS Team (
    team_code INT AUTO_INCREMENT,
    team_name VARCHAR(20) NOT NULL,
    discipline VARCHAR(30) NOT NULL,
    number_players INT NOT NULL,
    idStadium INT,
    trainer_DNI CHAR(9),
    PRIMARY KEY (team_code),
    FOREIGN KEY (idStadium) REFERENCES Stadium(idStadium),
    FOREIGN KEY (trainer_DNI) REFERENCES Staff(dni)
);


CREATE TABLE IF NOT EXISTS Fan_Supports_Team (
    team_code INT,
    dni CHAR(9),
    FOREIGN KEY (team_code) REFERENCES Team(team_code),    
    FOREIGN KEY (dni) REFERENCES Fan(dni)
);	

CREATE TABLE IF NOT EXISTS Sportman (
    dni CHAR(9) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(50),
    discipline VARCHAR(20),
    country VARCHAR(20) NOT NULL,
    player_number INT,
    score INT,
    team_code INT,
    FOREIGN KEY (team_code)
        REFERENCES Team (team_code)
);

/* Elimino estadio de la tabla game ya que es información redundante, el estadio lo tenemos en el equipo local*/

CREATE TABLE IF NOT EXISTS Game (
    date_match DATE,
    id_game int auto_increment not null,
    /*This has to be updated into a comparative auto increment where as it creates unique a counter*/
    id_tournament INT NOT NULL UNIQUE,
    id_local_team INT,
    local_result ENUM('Winner', 'Loser', 'Tied', 'Other') NOT NULL,
    local_score VARCHAR(30),
    id_guest_team INT,
    guest_result ENUM('Winner', 'Loser', 'Tied', 'Other') NOT NULL,
    guest_score VARCHAR(30),
    PRIMARY KEY (id_game,id_tournament),
    INDEX (date_match),
    FOREIGN KEY (id_local_team)
        REFERENCES Team (team_code),
    FOREIGN KEY (id_guest_team)
        REFERENCES Team (team_code),
    FOREIGN KEY (id_tournament)
        REFERENCES Tournament (id_tournament)
);

CREATE TABLE IF NOT EXISTS Fan_Attends_Game (
    DNI CHAR(9),
        id_tournament INT NOT NULL UNIQUE,

    date_match DATE,
    id_local_team INT,
    id_guest_team INT,
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
CREATE TABLE IF NOT EXISTS Player_Plays_Game (
    DNI CHAR(9),
    id_tournament INT,
    score INT,
    penalties INT,
    date_match DATE,
    id_local_team INT,
    id_guest_team INT,
    FOREIGN KEY (DNI)
        REFERENCES Sportman (DNI),
    FOREIGN KEY (id_tournament)
        REFERENCES Tournament (id_tournament),
    FOREIGN KEY (date_match)
        REFERENCES Game (date_match),
    FOREIGN KEY (id_local_team)
        REFERENCES Team (team_code),
    FOREIGN KEY (id_guest_team)
        REFERENCES Team (team_code)
);

CREATE TABLE IF NOT EXISTS Person (
DNI_Sportman char(9) unique,
DNI_Staff char(9) unique,
DNI_Supporter char(9) unique,
fristname varchar(50),
lastname varchar(50),
BirthDate date not null,
PlayerTeamId int null,
FOREIGN KEY (DNI_Sportman) REFERENCES Sportman(dni),
FOREIGN KEY (DNI_Staff) REFERENCES Staff(dni),
FOREIGN KEY (DNI_Supporter) REFERENCES Fan(dni),
FOREIGN KEY (PlayerTeamId) REFERENCES Sportman(team_code)
);
/*
Para las lesiones, como solo es un jugador lo más lógico (y lo que se hace) es crear 3 referencias distintas en la tabla de Person, una para Staff, otra para Sportman y otra para Fans, siendo algunas nulas ya que un sportman no puede ser un fan ni un miembro del staff a la vez.
Así cuando hagas la referencia no introducirás el valor de un fan, no sería una lesión producida por el juego, en todo caso si un fan sufriera un percance según el modelo se introduciría como lesionado, al igual que un miembro del staff.
Por eso he hecho 3 columnas identificadoras de persona.
*/


Create table if not exists Injuries (
DNI CHAR(9),
Injury_Description longtext not null,
Injury_Date date not null,
Injury_Recovery_Date date,
FOREIGN KEY (DNI)
	REFERENCES Person(DNI_Sportman)
);

Create table if not exists Staff_Works_Game (

);




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

/*Stadium --->*/

INSERT INTO Stadium(stadium_name , capacity ,location ) VALUES ("Iberostar Stadium", 67000, "Mallorca");
INSERT INTO Stadium(stadium_name , capacity ,location ) VALUES ("Santiago Bernabeu", 97000, "Madrid");
INSERT INTO Stadium(stadium_name , capacity ,location ) VALUES ("Madison Square Garden", 45000, "New York");
INSERT INTO Stadium(stadium_name , capacity ,location ) VALUES ("Pista Tenis por defecto", 2, "Madrid");
INSERT INTO Stadium(stadium_name , capacity ,location ) VALUES ("Alguna perdida por el monte", 10000, "Milan");


/*Team ---> Team_code,Team_name,discipline,number_players,trainer_DNI*/

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('Betis_CF','Football',18,1,'43511241J');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('New_York_Knicks','Basketball',13,3,'55151543G');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('RCD_Mallorca','Cycling',1,1,'41152846A');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('Movistar_Estudiantes','Tennis',1,1,'45555141H');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('Ferrari','Formula_1',1,5,'51243524S');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('Real_Sociedad','Golf',1,1,'41524254B');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('Barcelona','Athletics',1,1,'45256585C');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('YAMAHA','Formula_1',19,1,'48562457J');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('Real_Madrid','Football',18,1,'41214124M');

insert into Team(Team_name,discipline,number_players,idStadium,trainer_DNI) values('Iberostar_Tenerife','Football',19,1,'45121535Q');

/* Sportman ---> dni,first_name,last_name,birth_date,discipline,country,player_number,score,team_code */

insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('40284753G','Jose','Gutierrez','1995-05-10','Male','Athletics','ESP',3,0,2);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('40284754H','Ivan','Paredes','1994-04-05','Male','Tennis','ESP',5,1,5);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('40284755I','Maria','Diaz','1993-05-28','Female','Football','ESP',8,10,1);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('40284756J','Eva','Espases','1996-08-09','Female','Cycling','USA',10,23,3);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('40284757K','Roberto','Marti','1995-08-23','Male','Formula 1','ESP',11,5,8);
insert into Sportman (dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('40284758L','Marcos','Febrer','1994-02-22','Male','Football','USA',4,2,10);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('64258684O','Carlos','Sainz','1993-01-28','Male','Golf','ESP',3,2,6);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('71256849H','Sonia','Florit','1994-09-17','Female','Athletics','ESP',1,2,7);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('16359725I','Jorge','Frau','1995-08-15','Male','Cycling','ESP',5,2,3);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('56324895P','Ana','Florit','1994-07-12','Female','Football','ESP',6,2,9);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('28469531M','David','Ruiz','1993-10-16','Male','Tennis','ESP',8,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('15629476J','Marta','Pascual','1996-07-10','Female','Cycling','ESP',8,2,3);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('45362894Y','Laura','Febrer','1995-04-30','Female','Football','ESP',7,2,10);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('65439574P','Susana','Rebassa','1994-11-12','Female','Basketball','ESP',9,2,2);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('10203540S','Alex','Rodríguez','1993-03-03','Male','Tennis','USA',7,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('32605491K','David','Sánchez','1996-04-22','Male','Formula 1','ESP',8,2,5);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('01623058N','Cristina','Martinez','1995-08-25','Female','Tennis','USA',10,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,gender,discipline,country,player_number,score,team_code) values('15630248T','Miquel','Vidal','1994-06-20','Male','Football','ESP',7,2,9);


/* Tounament ---> id_tournament,tournament_name */

insert into Tournament(tournament_name, discipline) values ('National_Championship','Basketball');

insert into Tournament(tournament_name, discipline) values ('International_Championship','Football');

insert into Tournament(tournament_name, discipline) values ('Eurocup','Football');

insert into Tournament(tournament_name, discipline) values ('Worldcup','Football');



/* ------------------------------ */



INSERT INTO Fan VALUES("98765432A","Barack","Obama","1961-8-4");
INSERT INTO Fan VALUES("00000000A","Jesus","De Nazaret","0001-1-1");
INSERT INTO Fan VALUES("88888888C","Santiago","Abascal","1970-4-3");
INSERT INTO Fan VALUES("78541269E","Pere","Negre","1977-5-19");
INSERT INTO Fan VALUES("02587496Z","Borjita","Del Prado","2020-01-01");
INSERT INTO Fan VALUES("15975382Q","Mubla","1997","1997-04-01");
INSERT INTO Fan VALUES("42315697N","Messi","Chiquito","1988-4-6");
INSERT INTO Fan VALUES("77777777R","Pedro","Soltero","1979-12-4");
INSERT INTO Fan VALUES("11111111I","Frank","De La Jungla","1999-12-23");
INSERT INTO Fan VALUES("33333333B","Nacho","Vidal","1969-6-4");

INSERT INTO Tournament(tournament_name ,discipline ) VALUES ("Liga Santander", "Football" );
INSERT INTO Tournament(tournament_name ,discipline ) VALUES ("Le Mans", "Racing" );
INSERT INTO Tournament(tournament_name ,discipline ) VALUES ("Primera Division de Uruguay", "Football" );

INSERT INTO Game VALUES("2017-12-12",2,1,"Winner",3,9,"Loser",0);


