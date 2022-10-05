--9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
--Give their full name and the teams that they were managing when they won the award.

SELECT p.namefirst, p.namelast, am.lgid
FROM AwardsManagers as am
INNER JOIN people as p
USING (playerid)
WHERE am.awardid = 'TSN Manager of the Year' AND am.lgid = 'AL' AND am.lgid = 'NL'