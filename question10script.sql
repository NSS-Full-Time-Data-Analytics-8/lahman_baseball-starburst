--question 10
--Find all players who hit their career highest number of home runs in 2016.
--Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
--Report the players' first and last names and the number of home runs they hit in 2016.


SELECT namefirst, 
	   namelast, 
	   MAX(hr), 
	   yearid,
	   debut,
	   finalgame
FROM batting
INNER JOIN people
USING(playerid)
WHERE yearid = '2016'
GROUP BY namefirst, namelast, hr, yearid, debut, finalgame;

 