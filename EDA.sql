-- Exploratary Data Analysis

-- 1. Query the sport and distinct number of athletes
SELECT 
	sport, 
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games
GROUP BY sport
-- Only include the 3 sports with the most athletes
ORDER BY athletes DESC
LIMIT 3;

-- 2. Query sport, events, and athletes from summer_games
SELECT 
	sport, 
    COUNT(DISTINCT event) AS events, 
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games
GROUP BY sport;

-- 3. Select the age of the oldest athlete for each region
SELECT 
	region, 
    MAX(a.age) AS age_of_oldest_athlete
FROM summer_games AS s
-- First JOIN statement
JOIN countries AS c
ON c.id=s.country_id
-- Second JOIN statement
JOIN athletes AS a
ON s.athlete_id = a.id
GROUP BY c.region;

-- 4. Find total events in summer and winter games
-- Select sport and events for summer sports
SELECT 
	sport, 
    COUNT(DISTINCT event) AS events
FROM summer_games
GROUP BY sport
UNION
-- Select sport and events for winter sports
SELECT 
	sport, 
    COUNT(DISTINCT event) AS events
FROM winter_games
GROUP BY sport
-- Show the most events at the top of the report
ORDER BY events DESC;

-- 5. Inspect NULL values in bronze medals
-- Update the query to explore the bronze field
SELECT bronze
FROM summer_games;
-- Update query to explore the unique bronze field values
SELECT DISTINCT bronze
FROM summer_games;
-- Recreate the query by using GROUP BY 
SELECT bronze
FROM summer_games
GROUP BY bronze;
-- Inspect how much of our dataset is NULL
SELECT 
	bronze, 
	COUNT(*) AS _rows
FROM summer_games
GROUP BY bronze;

-- 5. Validate Query by using the query as a subquery
-- Pull total_bronze_medals from summer_games below
SELECT SUM(bronze) AS total_bronze_medals
FROM summer_games;
-- Select the total bronze_medals from your query
SELECT SUM(bronze_medals)
FROM 
-- Previous query is shown below.  Alias this AS subquery
  (SELECT 
      c.country, 
      SUM(bronze) AS bronze_medals
  FROM summer_games AS s
  JOIN countries AS c
  ON s.country_id = c.id
  GROUP BY c.country) AS subquery;

-- 6. Pull distinct event names found in winter_games
SELECT DISTINCT event
FROM winter_games;

-- 7. Pull events and golds by athlete_id for summer events
SELECT 
    athlete_id, 
    -- Add a field that averages the existing gold field
    AVG(gold) AS avg_golds,
    COUNT(event) AS total_events, 
    SUM(gold) AS gold_medals
FROM summer_games
GROUP BY athlete_id
-- Order by total_events descending and athlete_id ascending
ORDER BY total_events DESC, athlete_id;
