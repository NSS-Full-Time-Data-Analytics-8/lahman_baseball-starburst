--6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful.
--(A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.
--Answer Chris Owings 


WITH Steals AS (SELECT namelast, namefirst, playerid, sb, cs, sb + cs as total_attempts
			   		FROM batting
			   INNER JOIN people 
			   using (playerid)
			   WHERE cs+sb >=20
			   and yearid ='2016')
SELECT namefirst, namelast, cs, sb total_attempts, (sb / total_attempts::float) *100 as success
FROM steals
ORDER BY success desc
