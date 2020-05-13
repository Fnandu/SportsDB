delimiter //
CREATE TRIGGER ejemplo AFTER INSERT
ON sportman FOR EACH ROW
BEGIN
	UPDATE team SET number_players = number_players + 1 
    WHERE sportman.team_code = team.team_code;
END

delimiter ;