/*Insert Teams-Sportsmans-Games -- Raul*/
DELIMITER //
CREATE PROCEDURE insertPerson(
	IN per_dni char(9),
	IN per_first_name varchar(30),
	IN per_last_name varchar(30),
	IN per_birth_date date,
	IN per_gender varchar(50),
	IN per_country varchar(20)
)

BEGIN
	INSERT INTO Person(dni, first_name, last_name, birth_date, gender, country)
    VALUES (per_dni, per_first_name, per_last_name, per_birth_date, per_gender, per_country);
END//


CREATE PROCEDURE insertDiscipline(
	IN d_idDiscipline int,
	IN d_discipline varchar(30)
)

BEGIN
	DECLARE discId INT;
	DECLARE disc VARCHAR(50);
	SET discId = d_idDiscipline;
	SET disc = d_discipline;

	INSERT INTO discipline VALUES (discId, disc);

END//

CREATE PROCEDURE insertStaff(
	IN s_dni char(9),
	IN s_idDiscipline int,
	IN s_job enum('Medical', 'Mechanic', 'Trainer', 'Physiotherapist', 
     'Security', 'Referee', 
     'Commentator', 'Ticket Booth Manager', 'Ball Boy/Gal/They')
)

BEGIN
	DECLARE staffDni char(9);
	DECLARE staffDiscipline int;
	DECLARE staffJob enum ('Medical', 'Mechanic', 'Trainer', 'Physiotherapist', 
     'Security', 'Referee', 
     'Commentator', 'Ticket Booth Manager', 'Ball Boy/Gal/They');

	SET staffDni = s_dni;
	SET staffDiscipline = s_idDiscipline;
	SET staffJob = s_job;

	INSERT INTO staff VALUES (staffDni, staffDiscipline, staffJob);

END//

CREATE PROCEDURE insertFan(
IN f_dni char(9),
IN f_contractDate date,
IN f_expiryDate date
)

BEGIN
	DECLARE fanDNI char(9);
	DECLARE fanContract date;
    DECLARE fanExpiry date;
    
    SET fanDNI = f_dni;
    SET fanContract = f_contractDate;
    SET fanExpiry = f_expiryDate;

	INSERT INTO fan VALUES (fanDNI, fanContract, fanExpiry);
END//


CREATE PROCEDURE insertTournament (
	IN to_id_tournament INT,
    IN to_idDiscipline INT,
    IN to_name VARCHAR (30),
    IN to_country VARCHAR (3)
)

BEGIN

	DECLARE idTournament INT;
    DECLARE idDiscipline INT;
    DECLARE T_Name VARCHAR(30);
    DECLARE T_Country VARCHAR(3);

	SET idTournament = to_id_tournament;
    SET idDiscipline = to_idDiscipline;
    SET T_Name = to_name;
    SET T_Country = to_country;
    
    INSERT INTO tournament VALUES (idTournament, idDiscipline, T_Name, T_Country);
    
END//

CREATE PROCEDURE insertStadium (
	IN st_idStadium INT,
    IN st_name VARCHAR (50),
    IN st_capacity INT,
    IN st_location VARCHAR(30)
)

BEGIN
	DECLARE idStadium INT;
    DECLARE stadium_name VARCHAR(50);
    DECLARE capacity INT;
    DECLARE location VARCHAR(30);
	
    SET idStadium = st_idStadium;
    SET stadium_name = st_name;
    SET capacity = st_capacity;
    SET location = st_location;
	
    INSERT INTO stadium VALUES (idStadium, stadium_name, capacity, location);
    
END//

CREATE PROCEDURE insertClub (
	IN c_club_code INT,
    IN c_club_name VARCHAR(30)
)

BEGIN

	DECLARE clubCode INT;
    DECLARE clubName VARCHAR(30);
    
    SET clubCode = c_club_code;
    SET clubName = c_club_name;
    
    INSERT INTO club VALUES (clubCode, clubName);

END//

CREATE PROCEDURE insertTeam (
	IN te_team_code INT,
    IN te_club_code INT,
    IN te_id_discipline INT,
    IN te_team_name VARCHAR(50),
    IN te_team_players INT,
    IN te_team_coach CHAR(9)
)

BEGIN

	DECLARE teamCode INT;
	DECLARE teamClubCode INT;
	DECLARE teamDiscipline INT;
	DECLARE teamName VARCHAR(50);
	DECLARE teamPlayers INT;
	DECLARE teamCoach CHAR(9);
	
    SET teamCode = te_team_code;
    SET teamClubCode = te_club_code;
    SET teamDiscipline = te_id_discipline;
    SET teamName = te_team_name;
    SET teamPlayers = te_team_players;
    SET teamCoach = te_team_code;
	
    INSERT INTO team VALUES (teamCode, teamClubCode, teamDiscipline, teamName, teamPlayers, teamCoach);
    
END//

CREATE PROCEDURE insertSupporter (
	IN su_teamCode INT,
    IN su_dni CHAR(9)
)

BEGIN

	DECLARE supporterteamCode INT;
    DECLARE	supporterDNI CHAR(9);
    
    SET supporterteamCode = su_teamCode;
	SET supporterDNI = su_dni;
    
    INSERT INTO fan_supports_team VALUES (supporterteamCode, supporterDNI);
    
END//

CREATE PROCEDURE insertSportman (
	IN sp_dni CHAR(9),
    IN sp_number INT,
    IN sp_teamCode INT,
    IN sp_idDiscipline INT,
    IN sp_score INT
)

BEGIN

	DECLARE sportmanDNI CHAR(9);
    DECLARE sportmanNumber INT;
    DECLARE sportmanTeam INT;
    DECLARE sportmanDiscipline INT;
    DECLARE sportmanScore INT;
    
    SET sportmanDNI = sp_dni;
    SET sportmanNumber = sp_number;
    SET sportmanTeam = sp_teamCode;
    SET sportmanDiscipline = sp_idDiscipline;
    SET sportmanScore = sp_score;
    
    INSERT INTO sportman VALUES (sportmanDNI, sportmanNumber, sportmanTeam, sportmanDiscipline);

END//

CREATE PROCEDURE insertGame (
	IN g_idGame INT,
	IN g_matchDate DATE,
	IN g_stadiumId INT,
	IN g_tournament INT,
	IN g_localTeam INT,
	IN g_localResult ENUM('Winner', 'Loser', 'Tied', 'Other'),
	IN g_localScore VARCHAR(30),
	IN g_guestTeam INT,
	IN g_guestResult ENUM('Winner', 'Loser', 'Tied', 'Other'),
	IN g_guestScore VARCHAR(30)
)

BEGIN

	DECLARE idGame INT;
	DECLARE matchDate DATE;
	DECLARE stadiumId INT;
	DECLARE tournament INT;
	DECLARE localTeam INT;
	DECLARE localResult ENUM('Winner', 'Loser', 'Tied', 'Other');
	DECLARE localScore VARCHAR(30);
	DECLARE guestTeam INT;
	DECLARE guestResult ENUM('Winner', 'Loser', 'Tied', 'Other');
	DECLARE guestScore VARCHAR(30);
	
    SET idGame = g_idGame;
    SET matchDate = g_matchDate;
    SET stadiumId = g_idGame;
    SET tournament = g_tournament;
    SET localTeam = g_localTeam;
    SET localResult = g_localResult;
    SET localScore = g_localScore;
    SET guestTeam = g_guestTeam;
    SET guestResult = g_guestResult;
    SET guestScore = g_guestScore;
	
    INSERT INTO game VALUES (idGame, matchDate, stadiumId, tournament, localTeam, localResult, localScore, guestTeam, guestResult, guestScore);
    
END//

CREATE PROCEDURE insertFanAttend(
	IN fa_dni CHAR(9),
    IN fa_tournamentId INT,
    IN fa_matchDate DATE,
    IN fa_localTeam INT,
    IN fa_guestTeam INT
)
BEGIN

	DECLARE fanDNI CHAR(9);
	DECLARE tournamentId INT;
	DECLARE matchDate DATE;
	DECLARE localTeam INT;
	DECLARE guestTeam INT;
	
    SET fanDNI = fa_dni;
    SET tournamentId = fa_tournamentId;
    SET matchDate = fa_matchDate;
    SET localTeam = fa_localTeam;
    SET guestTeam = fa_guestTeam;
    
END//

CREATE PROCEDURE insertPlayerPlays(
	IN pl_dni CHAR(9),
    IN pl_tournamentId INT,
    IN pl_score INT,
    IN pl_penalties VARCHAR(50),
    IN pl_matchDate DATE,
    IN pl_localTeam INT,
    IN pl_guestTeam INT
)
BEGIN
	DECLARE dni CHAR(9);
	DECLARE tournament INT;
	DECLARE score INT;
	DECLARE penalties VARCHAR(50);
	DECLARE matchDate DATE;
	DECLARE localTeam INT;
	DECLARE guestTeam INT;
	
    SET dni = pl_dni;
    SET tournament = pl_tournament;
    SET score = pl_score;
    SET penalties = pl_penalties;
    SET matchDate = pl_matchDate;
    SET localTeam = pl_localTeam;
    SET guestTeam = pl_guestTeam;
    
    INSERT INTO player_plays_game VALUES (dni, tournament, score, penalties, matchDate, localTeam, guestTeam);
    
END//	

CREATE PROCEDURE insertInjuries(
	IN in_injuryId INT,
    IN in_dni CHAR(9),
    IN in_description LONGTEXT,
    IN in_injuryDate DATE
)
BEGIN
	
    DECLARE injuryId INT;
	DECLARE dni CHAR(9);
	DECLARE description LONGTEXT;
	DECLARE injuryDate DATE;
	
    SET injuryId = in_injuryId;
    SET dni = in_dni;
    SET description = in_description;
    SET injuryDate = in_injuryDate;
	
    INSERT INTO injuries VALUES (injuryId, dni, description, injuryDate);
    
END//

CREATE PROCEDURE insertRecovery(
	IN re_injuryId INT,
    IN re_date DATE
)
BEGIN

	DECLARE injury INT;
	DECLARE recoveryDate DATE;
    
    SET injury = re_injuryId;
    SET recoveryDate = re_date;
    
    INSERT INTO injury_recovery VALUES (injury, recoveryDate);
    
END//

CREATE PROCEDURE insertStaffWork (
	IN stw_dni CHAR(9),
    IN stw_tournament INT,
    IN stw_matchDate DATE,
    IN stw_localTeam INT,
    IN stw_guestTeam INT
)

BEGIN

	DECLARE workerDni CHAR(9);
	DECLARE workerTournament INT;
	DECLARE workerMatchDate DATE;
	DECLARE workerLocalTeam INT;
	DECLARE workerGuestTeam INT;
	
    SET workerDni = stw_dni;
    SET workerTournament = stw_tournament;
    SET workerMatchDate = stw_matchDate;
    SET workerLocalTeam = stw_localTeam;
    SET workerGuestTeam = stw_guestTeam;
	
    INSERT INTO staff_works_game VALUES (workerDni, workerTournament, workerMatchDate, workerLocalTeam, workerGuestTeam);
    
END//

CREATE PROCEDURE insertStaffTeam (
	IN stt_dni CHAR(9),
	IN stt_team INT,
	IN stt_contractDate DATE,
	IN stt_contractExpiry DATE,
	IN stt_salary BIGINT
)

BEGIN

	DECLARE sttDni CHAR(9);
    DECLARE sttTeam INT;
    DECLARE sttContract DATE;
    DECLARE sttExpiration DATE;
    DECLARE sttSalary BIGINT;
	
    SET sttDni = stt_dni;
    SET sttTeam = stt_team;
    SET sttContract = stt_contractDate;
    SET sttExpiration = stt_contractExpiry;
    SET sttSalary = stt_salary;
	
    INSERT INTO staff_works_for_team VALUES (sttDni, sttTeam, sttContract, sttExpiration, sttSalary);
    
END//

CREATE PROCEDURE insertSportmanData (
	IN spd_dni CHAR(9),
	IN spd_team INT,
	IN spd_contractDate DATE,
	IN spd_contractExpiry DATE,
	IN spd_salary BIGINT
)

BEGIN
	DECLARE sportmanDNI CHAR(9);
	DECLARE sportmanTeam INT;
	DECLARE sportmanContract DATE;
	DECLARE sportmanExpiration DATE;
	DECLARE sportmanSalary BIGINT;
	
    SET sportmanDNI = spd_dni;
    SET sportmanTeam = spd_team;
    SET sportmanContract = spd_contractDate;
    SET sportmanExpiration = spd_contractExpiration;
    SET sportmanSalary = spd_salary;
	
    INSERT INTO sportman_works_for_team VALUES (sportmanDNI, sportmanTeam, sportmanContract, sportmanExpiration, sportmanSalary);
    
END//

DELIMITER;
DELIMITER //
/*Query ID from maximum score player-Date from next game -- Fernando*/

DELIMITER //
CREATE PROCEDURE MaxPuntuation(Sport int)
BEGIN
declare NameSport int;
set NameSport = Sport;

Select max(score) from sportman where id_discipline = NameSport;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE NextGame(Team int)
BEGIN
declare ID_Team int;
set ID_Team = Team;

Select date_match from (SELECT * from game where id_local_team = ID_Team or id_guest_team = ID_Team) as team where date_match > curdate() order by date_match limit 1;
END //

Delimiter ;

/*Update team data-sportsman data -- Pablo*/
DELIMITER //

CREATE PROCEDURE UpdateTeam(IN id_team_code INT,IN id_team_name varchar(50))
BEGIN
	UPDATE team SET team_name = id_team_name where team_code = id_team_code;
END //

DELIMITER ;

call UpdateTeam(1, 'Betis_FC');
select* from team;

drop procedure if exists UpdateTeam;

/*update person data-person data -- Pablo */
DELIMITER //
CREATE PROCEDURE UpdatePerson(IN a_dni char(9),IN a_first_name VARCHAR(20))
BEGIN
	UPDATE person SET dni = a_dni where first_name = a_first_name;
END //

DELIMITER ;

call UpdatePerson('08208287R','Veronica');


select* from person;

drop procedure if exists UpdatePerson;

/*Remove team-sportsman -- Pau*/
DELIMITER //
CREATE PROCEDURE RemoveSportman(DNI varchar(9))
BEGIN
declare _DNI varchar(9);
set _DNI   = DNI;
delete from sportman where dni = _DNI ;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RemoveTeam(team_code int)
BEGIN
declare _team_code int;
set _team_code   = team_code;
delete from team where team_code = _team_code ;
END//
DELIMITER ;

/*add procedure -> ???? -> profit*/

DELIMITER //
Create procedure AddSport(NameSport varchar(20))
BEGIN
declare Name_Sport varchar(20);
set Name_Sport = NameSport;
insert into Discipline (
  name_discipline
  ) values (
   Name_Sport
  );
  END//
  DELIMITER ;
