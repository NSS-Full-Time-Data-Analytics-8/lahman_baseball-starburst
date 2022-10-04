
--question 2
SELECT DISTINCT namegiven,
		height,
		g_all AS games_played,
		t.name AS team_name	
FROM people
INNER JOIN appearances AS a
USING(playerid)
INNER JOIN teams AS t
USING(yearid)
WHERE height IS NOT NULL
ORDER BY height ASC
LIMIT 1;




