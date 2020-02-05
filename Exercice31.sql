use sportdb;
/*1 Consultar datos básicos de personas: jugadores, arbitros, entrenadores... */
select discipline, first_name, last_name, local_player_code from sportman;
/*2 Consultar cuantos puntos/goles/etc. ha conseguido en su carrera:*/
select dni, team_name as team, first_name, score from sportman inner join team on sportman.team_code=team.team_code;
/*3 Consultar cuantos competiciones ha ganado en su vida */

/*4 Consultar cuantos jugadores hay por deporte */

/*5 Consultar máximo goleador/punteador por deporte */

/*6 Calcular fecha del proximo encuentro por equipo */

/*7 En que deportes participa un equipo: Por ejemplo Real Madrid... */

/*8 Listado de equipos ordenados por numero de fans */

/*9 Ultimo encuentro en el que lesiono un jugador */

/*10 Listado de numero de jugadores/equipos por deporte y competicion */

/*11 Listar a todos los jugadores que juegan en mas de un deporte */

/*12 Listado de arbitros por pais */

/*13 Listar jugadores que juegan en ligas fuera de su pais */

/*14 Por tipo de persona, listar la que más gana y obtener la siguiente información */

/*15 Listar por estadio el numero de espectadores máximo que han tenido en un encuentro */
