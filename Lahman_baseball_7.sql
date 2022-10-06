--Question 7
--A.From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
--B.What is the smallest number of wins for a team that did win the world series? 
--C1.Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. 
--C2.Then redo your query, excluding the problem year. 
--D1.How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 
--D2.What percentage of the time?

--A
SELECT  name,
		yearid AS year,
		w AS wins
FROM teams
WHERE yearid >= 1970 AND yearid <= 2016
AND wswin = 'N'
GROUP BY name, yearid,w
ORDER BY wins DESC;
		
--B 
SELECT   name,
		yearid AS year,
		w AS wins
FROM teams
WHERE yearid >= 1970 AND yearid <= 2016
AND wswin = 'Y'
GROUP BY name, yearid,w
ORDER BY wins ASC;

--C


WITH max_wins AS (SELECT max(w) AS w,yearid
				  FROM teams
				  WHERE yearid >= 1970 AND yearid <= 2016
				  GROUP BY yearid
				  ORDER BY yearid)

SELECT name,
	   yearid,
	   MAX(w) AS wins,
	   g AS games_played,
	   CASE WHEN wswin = 'Y' THEN 'Winners'
		    WHEN wswin = 'N' THEN 'Losers' END AS ws_results   
FROM teams AS t
INNER JOIN max_wins AS mw
USING(yearid,w)
WHERE wswin IS NOT NULL
AND yearid <> '1981'
AND yearid >= 1970 AND yearid <= 2016
GROUP BY name,yearid,w,g,ws_results
ORDER BY yearid DESC;

--D

WITH max_wins AS (SELECT MAX(w) AS w,yearid
									    FROM teams
									    WHERE yearid >= 1970 AND yearid <= 2016
										GROUP BY yearid
										ORDER BY yearid)

SELECT CONCAT(ROUND(COUNT(wswin)::numeric/(MAX(yearid)-MIN(yearid) + 1) * 100,2),'%') AS mw_wswin_avg	    
FROM teams AS t
INNER JOIN max_wins AS mw
USING(yearid,w)
WHERE wswin = 'Y'
AND yearid >= 1970 AND yearid <= 2016;










