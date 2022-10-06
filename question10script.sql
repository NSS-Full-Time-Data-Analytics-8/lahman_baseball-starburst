WITH max_hr AS (SELECT playerid,
	  				   MAX(hr) AS hr
					   FROM batting
				       GROUP BY playerid
					   ORDER BY hr DESC),
					   
	season_count AS (SELECT (EXTRACT(year FROM finalgame::date))-(EXTRACT(year FROM debut::date))+1 AS seas_count,
					 playerid
				 FROM people
      			 WHERE (EXTRACT(year FROM finalgame::date))-(EXTRACT(year FROM debut::date))+1 >= 10)

SELECT namefirst, 
	   namelast,
	   b.playerid,
	   hr
FROM batting AS b
		INNER JOIN people
		USING(playerid)
		INNER JOIN max_hr
		USING(playerid,hr)
		INNER JOIN season_count
		USING(playerid)
WHERE hr >= 1
AND b.yearid = '2016'
GROUP BY namefirst, namelast, hr, b.yearid,b.playerid
ORDER BY hr DESC;






