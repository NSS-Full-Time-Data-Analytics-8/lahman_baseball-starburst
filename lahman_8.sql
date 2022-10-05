--8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 
--(where average attendance is defined as total attendance divided by number of games). 
--Only consider parks where there were at least 10 games played. **
--Report the park name, team name, and average attendance. 
--Repeat for the lowest 5 average attendance.
--highest 5 average attendance

SELECT p.park_name, t.name, SUM(h.attendance) / SUM (h.games) as avg_attendance
FROM parks as p
LEFT JOIN homegames as h
USING (park)
left JOIN teams as t
ON h.year = t.yearid and t.teamid = h.team
WHERE Year = '2016' AND games >=10
Group BY P.park_name, t.name
Order BY avg_attendance desc
limit 5


--lowest 5 average attendance
SELECT p.park_name, t.name, SUM(h.attendance) / SUM (h.games) as avg_attendance
FROM parks as p
LEFT JOIN homegames as h
USING (park)
LEFT JOIN teams as t
ON h.year = t.yearid and t.teamid = h.team
WHERE Year = '2016' AND games >=10
Group BY P.park_name, t.name
Order BY avg_attendance 
limit 5;