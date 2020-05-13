/*Insert Teams-Sportsmans-Games -- Raul*/

/*Query ID from maximum score player-Date from next game -- Fernando*/

DELIMITER //
CREATE PROCEDURE MaxPuntuation(Sport int)
BEGIN
declare NameSport int;
set NameSport = Sport;

Select max(score) from sportman where id_discipline = NameSport;
END //
DELIMITER ;

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