SELECT namegiven, 
       a.g_all AS games_played, 
	   t.name AS team,
       MIN (height) AS height
FROM people AS p 
INNER JOIN appearances AS a
USING (playerid)
INNER JOIN teams AS t 
USING (yearid)
GROUP BY height, namegiven, a.g_all, t.name
LIMIT 1;
