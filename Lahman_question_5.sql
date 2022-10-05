--Question 5
--Find the average number of strikeouts per game by decade since 1920. 
--Round the numbers you report to 2 decimal places. 
-- B.Do the same for home runs per game. Do you see any trends?

SELECT DISTINCT CASE WHEN p.yearid < 1930 THEN '1920s'
            WHEN p.yearid < 1940 THEN '1930s'
			WHEN p.yearid < 1950 THEN '1940s'
			WHEN p.yearid < 1960 THEN '1950s'
			WHEN p.yearid < 1970 THEN '1960s'
			WHEN p.yearid < 1980 THEN '1970s'
			WHEN p.yearid < 1990 THEN '1980s'
			WHEN p.yearid < 2000 THEN '1990s'
			WHEN p.yearid < 2010 THEN '2000s'
			WHEN p.yearid < 2020 THEN '2010s' END AS decades,
			SUM(p.so)/SUM(p.g) AS avg_so_per_game,
			SUM(b.hr)/SUM(b.g) AS avg_hr_per_game
FROM pitching AS p
INNER JOIN batting AS b
USING(playerid)
WHERE p.yearid >= '1920'
GROUP BY decades
ORDER BY decades;