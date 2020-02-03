DROP DATABASE IF EXISTS SportDB;
CREATE DATABASE IF NOT EXISTS SportDB;

USE SportDB;
	
CREATE TABLE IF NOT EXISTS Staff(
	dni char(9) not null primary key,
    first_name varchar(20) NOT NULL,
    last_name varchar(30) NOT NULL,
    birth_date date NOT NULL,
    discipline varchar(30)
);

CREATE TABLE IF NOT EXISTS Team(
	team_code int unsigned unique not null AUTO_INCREMENT,
    Team_name varchar(20) NOT NULL,
    discipline varchar(30) NOT NULL,
    number_players int NOT NULL,
    trainer_DNI char(9),
    PRIMARY KEY (team_code),
    FOREIGN KEY (trainer_DNI) REFERENCES Staff(dni)
);

CREATE TABLE IF NOT EXISTS Sportman(
	dni char(9),
    first_name varchar(20) NOT NULL,
    last_name varchar(30) NOT NULL,
    birth_date date NOT NULL,
    discipline varchar(20),
	country varchar(20) NOT NULL,
    local_player_code int,
    score int,
    team_code int unsigned not null,
    PRIMARY KEY(dni),
    FOREIGN KEY(team_code) REFERENCES Team(team_code)
);

CREATE TABLE IF NOT EXISTS Fan(
	DNI char(9),
    first_name varchar(20) NOT NULL,
    last_name varchar(30) NOT NULL,
    birth_date date NOT NULL,
    PRIMARY KEY (DNI)
);

CREATE TABLE IF NOT EXISTS Fan_Supports_Team(
	team_code int unsigned not null unique,
    DNI char(9),
    FOREIGN KEY (team_code) REFERENCES Team(team_code),
    FOREIGN KEY (DNI) REFERENCES Fan(DNI)
);



CREATE TABLE IF NOT EXISTS Tournament(
		id_tournament int AUTO_INCREMENT not null unique,
        tournament_name varchar(30),
        PRIMARY KEY(id_tournament)
);

CREATE TABLE IF NOT EXISTS Stadium(
	idStadium int unsigned not null unique primary key auto_increment,
	stadium_name varchar(50),
    capacity int,
    location varchar(30),
    Home_team int unsigned unique not null,
    FOREIGN KEY (Home_team) REFERENCES Team(team_code)
);

CREATE TABLE IF NOT EXISTS Game(
	date_match date,
    discipline int not null unique,
    id_local_team int,
    local_result enum('Winner','Loser','Tied','Other') not null,
    local_other_result varchar(30),
    id_guest_team int,
	guest_result enum('Winner','Loser','Tied','Other') not null,
    guest_other_result varchar(30),
    stadium_name varchar(30),
    stadium_id int unsigned not null,
    FOREIGN KEY (stadium_id) REFERENCES Stadium(idStadium),
    FOREIGN KEY (discipline) REFERENCES Tournament(id_tournament)
);

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

insert into Sportman (dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('40284753G','Jose','Gutierrez','1995-05-10','Athletics','ESP',3,0,2);
insert into Sportman (dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('40284754H','Ivan','Paredes','1994-04-05','Tennis','ESP',5,1,5);
insert into Sportman (dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('40284755I','Maria','Diaz','1993-05-28','Football','ESP',8,10,1);
insert into Sportman (dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('40284756J','Eva','Espases','1996-08-09','Cycling','USA',10,23,3);
insert into Sportman (dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('40284757K','Roberto','Marti','1995-08-23','Formula 1','ESP',11,5,8);
insert into Sportman (dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('40284758L','Marcos','Febrer','1994-02-22','Football','USA',4,2,10);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('64258684O','Carlos','Sainz','1993-01-28','Golf','ESP',3,2,6);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('71256849H','Sonia','Florit','1994-09-17','Athletics','ESP',1,2,7);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('16359725I','Jorge','Frau','1995-08-15','Cycling','ESP',5,2,3);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('56324895P','Ana','Florit','1994-07-12','Football','ESP',6,2,9);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('28469531M','David','Ruiz','1993-10-16','Tennis','ESP',8,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('15629476J','Marta','Pascual','1996-07-10','Cycling','ESP',8,2,3);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('45362894Y','Laura','Febrer','1995-04-30','Football','ESP',7,2,10);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('65439574P','Susana','Rebassa','1994-11-12','Basketball','ESP',9,2,2);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('10203540S','Alex','Rodríguez','1993-03-03','Tennis','USA',7,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('32605491K','David','Sánchez','1996-04-22','Formula 1','ESP',8,2,5);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('01623058N','Cristina','Martinez','1995-08-25','Tennis','USA',10,2,4);
insert into Sportman(dni,first_name,last_name,birth_date,discipline,country,local_player_code,score,team_code) values('15630248T','Miquel','Vidal','1994-06-20','Football','ESP',7,2,9);


/* Tounament ---> id_tournament,tournament_name */

insert into Tournament(tournament_name) values ('National_Championship');

insert into Tournament(tournament_name) values ('International_Championship');

insert into Tournament(tournament_name) values ('Eurocup');

insert into Tournament(tournament_name) values ('Worldcup');



