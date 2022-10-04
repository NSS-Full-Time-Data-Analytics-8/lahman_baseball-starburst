--Question 1

SELECT * 
FROM teams;

SELECT DISTINCT MIN(yearid) AS first_year,
                MAX(yearid) AS latest_year
FROM teams;

--First year-1871
--Latest year-2016

--Question 2

SELECT DISTINCT namegiven,
       height,
	   g
FROM people AS p
LEFT JOIN appearances AS a
USING(playerid)
LEFT JOIN teams AS t
USING(yearid)
ORDER BY height;



