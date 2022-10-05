--Question 5
--Find the average number of strikeouts per game by decade since 1920. 
--Round the numbers you report to 2 decimal places. 
-- B.Do the same for home runs per game. Do you see any trends?

SELECT 
       CASE WHEN yearid < 1930 THEN '1920s'
            WHEN yearid < 1940 THEN '1930s'
			WHEN yearid < 1950 THEN '1940s'
			WHEN yearid < 1960 THEN '1950s'
			WHEN yearid < 1970 THEN '1960s'
			WHEN yearid < 1980 THEN '1970s'
			WHEN yearid < 1990 THEN '1980s'
			WHEN yearid < 2000 THEN '1990s'
			WHEN yearid < 2010 THEN '2000s'
			WHEN yearid < 2020 THEN '2010s' END AS decades,
			ROUND(SUM(so::decimal)/(SUM(g)/2),2) AS avg_so_per_game,
			ROUND(SUM(hr::decimal)/(SUM(g)/2),2) AS avg_hr_per_game
FROM teams
WHERE yearid >= '1920'
GROUP BY decades
ORDER BY decades;

