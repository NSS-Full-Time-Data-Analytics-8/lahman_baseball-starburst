--question 10
--Find all players who hit their career highest number of home runs in 2016.
--Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
--Report the players' first and last names and the number of home runs they hit in 2016.
WITH total_seasons AS
(SELECT (EXTRACT(year FROM finalgame::date))-(EXTRACT(year FROM debut::date))+1
FROM people
WHERE (EXTRACT(year FROM finalgame::date))-(EXTRACT(year FROM debut::date))+1 >= 10)

SELECT namefirst, 
	   namelast, 
	   MAX(hr) AS max_hr, 
	   yearid AS year
FROM batting
INNER JOIN people
USING(playerid)
WHERE (hr >= 1)
AND yearid = '2016'
GROUP BY namefirst, namelast, hr, yearid, debut, finalgame
ORDER BY hr DESC








