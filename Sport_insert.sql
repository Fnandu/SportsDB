use sportdb;
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
  score, team_code, discipline
) 
values 
  (
    '40284753G', 3, 0, 1 ,'Football'
  );
  insert into Sportman (
	DNI,
  player_number, 
  score, team_code, discipline
) 
values 
  (
    '40284753G', 1, 20, 1 ,'Handball'
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
    "2017-12-12", 2, 1, 1, 3, "Winner",  1, 0, "Loser"
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
  '40284753G','1','3','None','2017-12-12','1','1'

  );