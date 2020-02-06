use sportdb;

/*1 Consultar datos básicos de personas: jugadores, arbitros, entrenadores... */
select discipline, first_name, last_name, local_player_code from sportman;

/*2 Consultar cuantos puntos/goles/etc. ha conseguido en su carrera:*/
select dni, team_name as team, first_name, score from sportman inner join team on sportman.team_code=team.team_code;

/*3 Consultar cuantos competiciones ha ganado en su vida */


/*4 Consultar cuantos jugadores hay por deporte */
select discipline, count(case when sportman.gender='Male' then 'Male' ELSE NULL END) as male, count(case when sportman.gender='Female' then 'Female' ELSE NULL END) as female from sportman group by discipline;

/*5 Consultar máximo goleador/punteador por deporte */
select dni, first_name, discipline, max(score) from sportman group by discipline;

/*6 Calcular fecha del proximo encuentro por equipo */
select date_match from game where date_match > now();

/*7 En que deportes participa un equipo: Por ejemplo Real Madrid... */
Select team_name, discipline from team order by team_name asc;

/*8 Listado de equipos ordenados por numero de fans */


/*9 Ultimo encuentro en el que lesiono un jugador */


/*10 Listado de numero de jugadores/equipos por deporte y competicion */
select discipline, count(discipline), sum(number_players) as team from team group by discipline;

/*11 Listar a todos los jugadores que juegan en mas de un deporte */

/*12 Listado de arbitros por pais */

/*13 Listar jugadores que juegan en ligas fuera de su pais */

/*14 Por tipo de persona, listar la que más gana y obtener la siguiente información */

/*15 Listar por estadio el numero de espectadores máximo que han tenido en un encuentro */
