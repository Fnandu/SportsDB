use sportdb;

/*1 Consultar datos básicos de personas*/
SELECT person.dni, first_name, last_name, birth_date,gender,country,
CASE
	when  staff.discipline is not null then staff.discipline
    else sportman.discipline
END AS Discipline

, staff.job, sportman.team_code, 
CASE
 WHEN fan.dni is not null then fan.expiry_date
 else null
END

 from person
left join sportman	on person.DNI = sportman.dni
left join fan	on person.DNI = fan.dni
left join staff	on person.DNI = staff.dni;


/*2 Consultar cuantos puntos/goles/etc. ha conseguido en su carrera:*/
select sportman.dni, team_name as team, person.first_name, sum(score) from sportman inner join team on sportman.team_code=team.team_code left join person on sportman.dni = person.dni group by first_name;


select * from Player_Plays_Game;
/*3 Consultar cuantos partidos ha ganado en su vida */
select p.first_name,p.last_name,count(*) as 'Games won' from sportman 
left join Player_Plays_Game pg on pg.dni = sportman.dni 
left join person p on p.dni = sportman.dni 
left join game on game.date_match = pg.date_match
where sportman.team_code = 
case
	when sportman.team_code like pg.id_local_team then pg.id_local_team
    else pg.id_guest_team
end
and
case 
	when sportman.team_code like pg.id_local_team then game.local_result
    else game.guest_result
end 
= "Winner"
;

/*4 Consultar cuantos jugadores hay por deporte */
select discipline, count(case when person.gender='Male' then 'Male' ELSE NULL END) as male, count(case when person.gender='Female' then 'Female' ELSE NULL END) as female from sportman left join person on person.dni = sportman.dni  group by discipline;

/*5 Consultar máximo goleador/punteador por deporte */
select sportman.dni, person.first_name, discipline, max(score) from sportman left join person on person.dni = sportman.dni group by discipline;

/*6 Calcular fecha del proximo encuentro por equipo */
select date_match from game where date_match > now() order by date_match desc;

/*7 En que deportes participa un equipo: Por ejemplo Real Madrid... */
Select team_name, discipline from team order by team_name asc;

/*8 Listado de equipos ordenados por numero de fans */
select team_name, count(ft.dni) as 'Number of fans' from team 
left join Fan_Supports_Team ft on ft.team_code = team.team_code
left join fan f on f.dni = ft.dni
group by team_name
order by count(ft.dni) desc;

/*9 Ultimo encuentro en el que lesiono un jugador */
select first_name,injury_date from injuries
left join sportman on sportman.dni = injuries.dni
left join person on person.dni = sportman.dni
order by injury_date desc limit 1;

/*10 Listado de numero de jugadores/equipos por deporte y competicion */
select discipline, count(discipline) 'Number of teams', sum(number_players) as 'Total players' from team group by discipline;

/*11 Listar a todos los jugadores que juegan en mas de un deporte */
select first_name from sportman 
left join person on person.dni = sportman.dni where 
(
	select count(*) from sportman  where sportman.dni = person.dni group by dni
) > 1 
group by first_name
; 

/*12 Listado de arbitros por pais */
select person.first_name, person.last_name, person.country from staff
left join Person on person.dni = staff.dni
where job = 'Referee' 
order by person.country
;

/*13 Listar jugadores que juegan en ligas fuera de su pais */
select first_name, last_name , Person.country  as "Home country",  t.country as "Tournament Country" from Person
left join Sportman s on s.dni = person.dni
left join Player_Plays_Game pg on pg.dni = s.dni
left join Tournament t on t.id_tournament = pg.id_tournament
where Person.country != t.country
group by first_name , last_name;
select * from tournament;

/*14 Por tipo de persona, listar la que más gana y obtener la siguiente información */
select 
case 
	when s.discipline is not null then s.job
    else 'Sportman'
end as 'Type'
,first_name,last_name,
case 
	when s.discipline is not null then s.discipline
    else sp.discipline
end as 'Sport',
case 
	when st.salary is not null then st.salary
    else spt.salary
end as 'Salary',
case 
	when st.team_code is not null then st.team_code
    else spt.team_code
end as 'Team'
  from person p
  left join Staff s on s.DNI = p.DNI
  left join Sportman sp on sp.DNI = p.DNI
  left join Staff_Works_For_Team st on st.DNI = s.DNI
  left join Sportman_Works_For_Team spt on spt.DNI = sp.DNI

group by
 case 
	when s.discipline is not null then s.job
    else 'Sportman'
end
order by case 
	when st.salary is not null then st.salary
    else spt.salary
end desc
 ;

/*15 Listar por estadio el numero de espectadores máximo que han tenido en un encuentro */
select stadium_name, count(dni) as 'Fans that attended game' from stadium  s
left join game g ON g.id_stadium = s.id_stadium
left join Fan_Attends_Game fa on fa.date_match = g.date_match AND
								 fa.id_local_team = g.id_local_team AND
                                 fa.id_guest_team = g.id_guest_team
order by count(dni) desc
;
select count(*) from Game ;
