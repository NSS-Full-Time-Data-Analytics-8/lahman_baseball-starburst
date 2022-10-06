--Question 7
--From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
--What is the smallest number of wins for a team that did win the world series? 
--Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. 
--Then redo your query, excluding the problem year. 
--How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 
--What percentage of the time?


WITH ws_not_won AS (SELECT  name,
							yearid AS year,
							w AS wins
							FROM teams
							WHERE yearid >= 1970 AND yearid <= 2016
							AND wswin = 'N'
							GROUP BY name, yearid,w
							ORDER BY wins DESC),

ws_won AS (SELECT   name,
					yearid AS year,
					w AS wins
					FROM teams
					WHERE yearid >= 1970 AND yearid <= 2016
					AND wswin = 'Y'
					GROUP BY name, yearid,w
					ORDER BY wins ASC)
					
SELECT t.name,
	   wnw.year,
	   w AS wins,
	   t.g AS games_played,
	   CASE WHEN wswin = 'Y' THEN 'Winners'
		    WHEN wswin = 'N' THEN 'Losers' END AS ws_results   
FROM teams AS t
INNER JOIN ws_not_won AS wnw
ON t.yearid = wnw.year
INNER JOIN ws_won AS wsw
ON t.yearid = wsw.year AND wnw.year = wsw.year
WHERE wswin IS NOT NULL
AND wnw.year <> '1981'
GROUP BY t.name,wnw.year,w,g,ws_results
ORDER BY wins DESC;

SELECT 
	   ROUND(SUM(CASE WHEN wswin = 'Y' THEN 1::decimal ELSE 0 END)/MAX(w)/35 * 100,2) AS ws_win_percentage
FROM teams
WHERE yearid >= 1970 AND yearid <= 2016
AND yearid <> 1981
AND wswin IS NOT NULL;










