--question 3 
---Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total 
---salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?
	
SELECT distinct namefirst,  namelast, SUM(salary) as salary
FROM schools as s
INNER JOIN collegeplaying as c
USING (schoolid)
INNER JOIN people as p
USING (playerid)
INNER JOIN Salaries as sa
USING (playerid)
where schoolname = 'Vanderbilt University'
GROUP BY namefirst, namelast, 
ORDER BY salary desc