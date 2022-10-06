--9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
--Give their full name and the teams that they were managing when they won the award.

WITH AL
		AS (SELECT p.namefirst, p.namelast, am.lgid 
				FROM AwardsManagers as am
				INNER JOIN people as p
				USING (playerid)
				WHERE am.lgid = 'AL'),
				
NL 		AS (SELECT p.namefirst, p.namelast, am.lgid 
				FROM AwardsManagers as am
				INNER JOIN people as p
				USING (playerid)
				WHERE am.lgid = 'NL'),
Team	AS (select p.playerid, t.name
		   from people as p
		   INNER JOIN managershalf as m
		   USING (playerid)
		   INNER JOIN teams as t
		   USING (teamid))
		   

SELECT DISTINCT P.namefirst, p.namelast, am.yearid, name
FROM Awardsmanagers as am
INNER JOIN people as p 
USING (playerid)
INNER JOIN AL
USING (namefirst)
INNER JOIN NL
USING (namefirst)
INNER JOIN Team 
USING (playerid)
WHERE am.awardid = 'TSN Manager of the Year'
AND Awardsmanagers.lgid 'NL' AND Awardsmanagers.lgid 'AL'