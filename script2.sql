--question 1
SELECT DISTINCT MIN(yearid) AS first_year,
			    MAX(yearid) AS latest_year
FROM teams;

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

select namegiven, a.g_all, t.name as team_name,
min (height) as height
from people as p 
INNER JOIN appearances as a
using (playerid)
INNER JOIN teams as t 
using (yearid)
group by height, namegiven, a.g_all, t.name
limit 1


