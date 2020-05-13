/*Insert Teams-Sportsmans-Games -- Raul*/

/*Query ID from maximum score player-Date from next game -- Fernando*/

/*Update team data-sportsman data -- Pablo*/

/*Remove team-sportsman -- Pau*/
DELIMITER //
CREATE PROCEDURE RemoveSportman(DNI varchar(9))
BEGIN
declare _DNI varchar(9);
set _DNI   = DNI;
delete from person where dni = _DNI ;
END//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE RemoveTeam(team_code int)
BEGIN
declare _team_code int;
set _team_code   = team_code;

delete from team where team_code = _team_code ;

END//

DELIMITER ;+

/*add procedure -> ???? -> profit*/