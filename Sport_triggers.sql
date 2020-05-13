/*Update the max player score after each game he plays in*/
DELIMITER //
CREATE TRIGGER update_score AFTER INSERT
ON player_plays_game FOR EACH ROW
BEGIN
	UPDATE sportman , player_plays_game
    SET sportman.score = (sportman.score + player_plays_game.score)
	where  sportman.dni = player_plays_game.dni;
END //

DELIMITER ;

       
delimiter //
CREATE TRIGGER update_Number_Players AFTER INSERT
ON sportman FOR EACH ROW
BEGIN
	UPDATE team,sportman SET number_players = number_players + 1 
    WHERE sportman.team_code = team.team_code;
END //

delimiter ;


delimiter //

CREATE TRIGGER New_contract AFTER UPDATE
ON staff_works_for_team FOR EACH ROW
BEGIN
	UPDATE staff_works_for_team SET contract_expiry = null
	WHERE staff_works_for_team.NEW = staff_works_for_team.NEW;
END //

delimiter ;
show triggers;
