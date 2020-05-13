/*Update the max player score after each game he plays in*/
DELIMITER //
CREATE TRIGGER update_score AFTER INSERT
ON player_plays_game FOR EACH ROW
BEGIN
	UPDATE sportman SET sportman.score = sum((sportman.score,score)) WHERE sportman.dni = dni;
END //

DELIMITER ;

show triggers;
select * from sportman;
       
delimiter //
CREATE TRIGGER update_Number_Players AFTER INSERT
ON sportman FOR EACH ROW
BEGIN
	UPDATE team SET number_players = number_players + 1 
    WHERE sportman.team_code = team.team_code;
END \\

delimiter ;


delimiter //

CREATE TRIGGER New_contract AFTER UPDATE
ON staff_works_for_team FOR EACH ROW
BEGIN
	UPDATE staff_works_for_team SET contract_expiry = null
	WHERE staff_works_for_team.NEW = staff_works_for_team.NEW;
END \\

delimiter ;
