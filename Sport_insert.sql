use sportdb;
/*Create Inserts for all the new elements, such as games, fans and tournaments*/
/*Person --> DNI, First Name, Last Name, Birth date, Gender, Country*/
/*Personas en staff*/
select * from game;
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
          INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '49865742P', 'Cata', 'Plines', 
    '1976-5-13', 'Male', 'CHI'
  );
        INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '99974031T', 'Maria', 'Concepcion', 
    '1950-5-23', 'Female', 'ECU'
  );
        INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '29063878C', 'Alvaro', 'Catalan', 
    '1954-11-11', 'Male', 'ESP'
  );
        INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '94997345P', 'Ricardo', 'Nieves', 
    '1970-2-3', 'Male', 'URU'
  );
            INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '46325698K', 'Misco', 'Jones', 
    '1964-8-18', 'Male', 'EEUU'
  );
           INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '79564862I', 'Tomi', 'Navo', 
    '1969-11-20', 'Male', 'ESP'
  );
  /**/
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
    '87451551N', 'Mariano', 'Rajoy', 
    '1970-10-10', 'Male', "ESP"
  );
  INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '45464584U', 'Aitor', 'Lopez', 
    '1992-2-14', 'Male', 'ARG'
  );
  INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '08208287R', 'Lucia', 'Soler', 
    '1983-1-20', 'Female', 'ESP'
  );
  INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '99886587W', 'Maria', 'Pilar', 
    '1990-12-12', 'Female', 'PAR'
  );
  INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '27345373Y', 'Sonia', 'Perona', 
    '1991-11-11', 'Female', 'FRA'
  );
  INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '70525494L', 'Juan', 'Miñano', 
    '1979-4-12', 'Male', 'POR'
  );
  INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '98178946L', 'Vicente', 'Ferrero', 
    '1999-5-30', 'Male', 'ITA'
  );
  INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '42253641L', 'Alba', 'Cerda', 
    '1968-5-5', 'Female', 'PRA'
  );
    INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '40439219K', 'Encarnación', 'Feliz', 
    '1978-3-29', 'Female', 'ESP'
  );
      INSERT INTO Person (
  dni, first_name, last_name, birth_date, gender, country
) 
VALUES 
  (
    '28514849R', 'Manuela', 'Carmela', 
    '1988-12-1', 'Female', 'ESP'
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
  
   /*Discipline ---> id_discipline, name_discipline*/
  insert into Discipline (
  name_discipline
  ) values (
   'Football'
  );
   insert into Discipline (
  name_discipline
  ) values (
   'Basketball'
  );
   insert into Discipline (
  name_discipline
  ) values (
   'Tennis'
  );
   insert into Discipline (
  name_discipline
  ) values (
   'Petanca'
  );
   insert into Discipline (
  name_discipline
  ) values (
   'Golf'
  );
  
  /*Staff --> DNI, Job (   
	'Medical', 'Mechanic', 'Trainer', 
    'Physiotherapist', 'Security', 'Referee', 
    'Commentator', 'Ticket Booth Manager', 
    'Ball Boy/Gal/They'
    )*/
    
  insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'43511241J', 1,'Trainer'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'45555141H', 2, 'Medical'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'45555141H', 1,'Medical'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'51243524S', 1,'Mechanic'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'55151543G', 4,'Security'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'41524254B', 3,'Ball Boy/Gal/They'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'45256585C', 1,'Commentator'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'48562457J', 5,'Physiotherapist'
  );
   insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'41214124M', 5,'Referee'
  );
  insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'45121535Q', 4,'Ticket Booth Manager'
  );
  insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'49865742P', 1,'Trainer'
  );
  insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'99974031T', 4,'Trainer'
  );
  insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'29063878C', 2,'Trainer'
  );
  insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'94997345P', 3,'Trainer'
  );
  insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'46325698K', 2,'Trainer'
  );
    insert into Staff (
	DNI, id_discipline, Job
  ) values
  (
	'79564862I', 3,'Trainer'
  );
  
  /*Club*/
  
  insert into Club(club_name) values ('Barcelona club');
  insert into Club(club_name) values ('Madrid club');
  insert into Club(club_name) values ('Betis club');
  insert into Club(club_name) values ('Seleccion Portuguesa');
  insert into Club(club_name) values ('Seleccion Española');
  insert into Club(club_name) values ('Seleccion Francesa');
/*Team ---> Team_code,Team_name,discipline,number_players,trainer_DNI*/
insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'Betis_CF', 3, 1, 18,  '43511241J'
  ); 
  insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'FC_Barcelona', 1, 1, 24,  '49865742P'
  );
  
  insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'Seleccion_Portuguesa de petanca', 4, 4, 1,  '99974031T'
  );
    insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'Seleccion_Española de petanca', 5, 4, 1,  '49865742P'
  );
  
  insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'Barcelona', 1, 2, 11,  '29063878C'
  );
  
    insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'Madrid', 2,2, 14,  '46325698K'
  );  
  
  insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'Federacion Española de Tennis', 5,3, 1,  '94997345P'
  );
  insert into Team(
  Team_name, club_code, id_discipline, number_players, trainer_DNI
) 
values 
  (
    'Federacion Francesa de Tennis', 6,3, 1,  '79564862I'
  ); 
  
/* Sportman ---> dni,player_number,score,team_code */
insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '40284753G', 3, 1 ,1
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '40284753G', 1, 1 , 2
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '87451551N', 069, 3, 4
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '45464584U', 058, 2, 4
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '08208287R', 096, 4, 3
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '27345373Y', 558, 2, 5
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '70525494L', 099, 4, 3
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '98178946L', 10, 5, 2
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '42253641L', 4, 6, 2
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '40439219K', 102, 4, 3
  );
  insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '40439219K', 055, 4, 5
  );
  
    insert into Sportman (
	DNI,
  player_number, team_code, id_discipline
) 
values 
  (
    '40439219K', 088, 1, 1
  );
/* Tounament ---> id_tournament,tournament_name, country */
insert into Tournament(tournament_name, id_discipline, country) 
values 
  (
    'National_Championship', 2, 'CHN'
  );
insert into Tournament(tournament_name, id_discipline, country) 
values 
  (
    'International_Championship', 1, 'POR'
  );
insert into Tournament(tournament_name, id_discipline, country) 
values 
  ('Eurocup', 1,'ESP');
insert into Tournament(tournament_name, id_discipline, country) 
values 
  ('Worldcup', 1,'CHN');
insert into Tournament(tournament_name, id_discipline, country) 
VALUES 
  ("Juegos Olimpicos", 3,'BRA');
insert into Tournament(tournament_name, id_discipline, country) 
VALUES 
  ("Le Mans", 5 ,'GER');
insert into Tournament(tournament_name, id_discipline, country) 
VALUES 
  (
    "Wimbeldon", 3,"GER"
  );
  insert into Tournament(tournament_name, id_discipline, country) 
VALUES 
  (
    "Plaza de mi casa", 4,"CUB"
  );
  
/* Fan -->  DNI,  contract_date, expiry_date  */
INSERT INTO Fan(DNI, contract_date, expiry_date)
VALUES 
  (
    '40284753G', '1961-8-4','1961-12-4'
  );
  INSERT INTO Fan(DNI, contract_date, expiry_date)
VALUES 
  (
    '94997345P', '2011-12-1','2012-12-1'
  );
  INSERT INTO Fan(DNI, contract_date, expiry_date)
VALUES 
  (
    '29063878C', '2008-5-12','2009-12-12'
  );
  INSERT INTO Fan(DNI, contract_date, expiry_date)
VALUES 
  (
    '99974031T', '1990-1-1','2000-1-1'
  );
  INSERT INTO Fan(DNI, contract_date, expiry_date)
VALUES 
  (
    '28514849R', '2015-12-12','2030-12-12'
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
    "2021-12-12", 2, 1, 1, 3, "Winner", 2, 0, "Loser"
  );

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
    "2018-4-27", 5, 8, 3, 5, "Winner", 4, 2, "Loser"
  );
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
    "2019-9-27", 4, 7, 7, 1, "Loser", 8, 6, "Winner"
  );
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
    "2020-1-22", 3, 5, 5, 86, "Winner", 6, 71, "Loser"
  );
  
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
    "2019-8-15", 5, 8, 3, 5, "Tied", 4, 5, "Tied"
  );
/*Player_Plays_Game --> (DNI,id_tournament,score,penalties,date_match,id_local_team,id_local_team,id_guest_team) */
  INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '40284753G','1','3','None','2017-12-12','1','2'
  );
    INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '40439219K','2','0','None','2017-12-12','2','1'
  );
  
      INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '87451551N','8','4','None','2018-4-27','3','4'
  );
      INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '27345373Y','8','2','None','2018-4-27','4','3'
  );
        INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '70525494L','1','6','None','2019-9-27','7','8'
  );
        INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '40439219K','1','1','None','2019-9-27','8','7'
  ); 
          INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '70525494L','7','46','None','2020-1-22','5','6'
  ); 
          INSERT INTO Player_Plays_Game(
      DNI, 
  id_tournament , 
  score , 
  penalties , 
  date_match , 
  id_local_team , 
  id_guest_team 
  )
  VALUES(
  '98178946L','7','32','None','2020-1-22','6','5'
  ); 

    /* sportman_works_for_team ---> DNI,team_code,contract_date, contract_expiry, salary*/
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('27345373Y', 3,'2015-10-12','2018-10-12', 1000);
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('40284753G', 1,'2014-7-12','2019-7-12', 420000);
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('98178946L', 5,'2008-8-8','2012-8-8', 4101010);
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('70525494L', 7,'2010-10-10','2018-10-9', 515632);
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('87451551N', 4,'2001-2-12','2003-2-12', 6296);
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('40439219K', 2,'2000-1-1','2005-1-1', 3665151);
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('42253641L', 6,'2010-12-12','2014-12-12', 515158);
insert into sportman_works_for_team(DNI, team_code, contract_date, contract_expiry, salary) VALUES ('40439219K', 8,'2019-6-10','2020-2-20', 5158844);


/* Staff_Works_For_Team --->  DNI,team_code,contract_date, contract_expiry, salary */
insert into Staff_Works_For_Team (DNI, team_code, contract_date, contract_expiry, salary) VALUES ('45555141H', 5, '2018-8-12', '2019-6-20', 1200);
insert into Staff_Works_For_Team (DNI, team_code, contract_date, contract_expiry, salary) VALUES ('43511241J', 1, '2015-9-9', '2020-5-12', 1500);
insert into Staff_Works_For_Team (DNI, team_code, contract_date, contract_expiry, salary) VALUES ('55151543G', 3, '2019-3-12', '2022-2-22', 1100);
insert into Staff_Works_For_Team (DNI, team_code, contract_date, contract_expiry, salary) VALUES ('45256585C', 2, '2010-5-10', '2018-5-10', 900);
insert into Staff_Works_For_Team (DNI, team_code, contract_date, contract_expiry, salary) VALUES ('41524254B', 7, '2018-7-9', '2020-6-10', 800);

 /* INJURIES ------------------------ */
 INSERT
	INTO
	Injuries(DNI ,
	Injury_Description ,
	Injury_Date )
VALUES ("40284753G",
"Esguince de tobillo",
"2020-02-01");

INSERT
	INTO
	Injuries(DNI ,
	Injury_Description ,
	Injury_Date)
VALUES ("40439219K",
"Rotura de meñisco",
"2018-05-20");

INSERT
	INTO
	Injuries(DNI ,
	Injury_Description ,
	Injury_Date )
VALUES ("42253641L",
"Tendinitis aquilea",
"2020-12-1");

INSERT
	INTO
	Injuries(DNI ,
	Injury_Description ,
	Injury_Date )
VALUES ("98178946L",
"Golpe por Arturo",
"1997-01-01");

INSERT
	INTO
	Injuries(DNI ,
	Injury_Description ,
	Injury_Date )
VALUES ("87451551N",
"Osteopatia de pubis",
"2019-10-10");

/*Injury_revocery*/
insert into injury_recovery(injury_id,injury_recovery_date) values(1,"2020-02-20");
insert into injury_recovery(injury_id,injury_recovery_date) values(2,"2019-03-03");
insert into injury_recovery(injury_id,injury_recovery_date) values(4,"2017-01-01");
insert into injury_recovery(injury_id,injury_recovery_date) values(1,"2020-03-31");
/*Fan_Supports_Team ---> team_code, dni*/
INSERT
	INTO
	Fan_Supports_Team(team_code,DNI
	)
VALUES (1,
"40284753G");
INSERT
	INTO
	Fan_Supports_Team(team_code,DNI
	)
VALUES (3,
"94997345P");
INSERT
	INTO
	Fan_Supports_Team(team_code,DNI
	)
VALUES (5,
"29063878C");
INSERT
	INTO
	Fan_Supports_Team(team_code,DNI
	)
VALUES (7,
"99974031T");
INSERT
	INTO
	Fan_Supports_Team(team_code,DNI
	)
VALUES (8,
"28514849R");

/* Fan_Attends_Game ---> DNI, id_tournament, date_match, id_local_team, id_guest_team */

INSERT
	INTO
	Fan_Attends_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("40284753G",1,"2017-12-12",1,1
);
INSERT
	INTO
	Fan_Attends_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("94997345P",8,"2018-04-27",3,4
);
INSERT
	INTO
	Fan_Attends_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("29063878C",7,"2020-01-22",5,6
);
INSERT
	INTO
	Fan_Attends_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("99974031T",1,"2019-09-27",7,8
);
INSERT
	INTO
	Fan_Attends_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("28514849R",1,"2019-09-27",7,8
);

/* Staff_Works_Game ---> DNI ,id_tournament ,date_match ,id_local_team ,id_guest_team */
INSERT
	INTO
	Staff_Works_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("45555141H",1,"2017-12-12",1,1
);
INSERT
	INTO
	Staff_Works_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("94997345P",8,"2018-04-27",3,4
);
INSERT
	INTO
	Staff_Works_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("79564862I",7,"2020-01-22",5,6
);
INSERT
	INTO
	Staff_Works_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("49865742P",1,"2019-09-27",7,8
);
INSERT
	INTO
	Staff_Works_Game(DNI, id_tournament, date_match, id_local_team, id_guest_team
	)
VALUES ("43511241J",1,"2019-09-27",7,8
);
