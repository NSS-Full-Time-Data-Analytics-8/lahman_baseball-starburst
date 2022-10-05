--2 

SELECT namegiven, a.g_all AS games_played, t.name as team_name,
MIN (height) as height
FROM people as p 
INNER JOIN appearances as a
USING (playerid)
INNER JOIN teams as t 
USING (yearid)
GROUP BY height, namegiven, a.g_all, t.name
LIMIT 1;

