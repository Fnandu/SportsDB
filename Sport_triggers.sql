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
       