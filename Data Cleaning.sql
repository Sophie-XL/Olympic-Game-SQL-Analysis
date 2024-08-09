-- 1. Identifying data types
-- Pull column_name & data_type from the columns table
SELECT 
	column_name,
    data_type
FROM information_schema.columns
-- Filter for the table 'country_stats'
WHERE table_name = 'country_stats';

-- 2. Convert Data Types
SELECT AVG(CAST(population AS float)) AS avg_population
FROM country_stats;

-- 3. Date Functions: bucket years in decade
SELECT 
	year,
    -- Pull decade, decade_truncate, and the world's gdp
    (FLOOR(YEAR(CAST(year AS DATE))/10)*10) AS decade,
    SUM(gdp) AS world_gdp
FROM country_stats
-- Group and order by year in descending order
GROUP BY year
ORDER BY year DESC;

-- 4. Cleaning Strings
SELECT 
	region, 
    -- Trim trailing spaces
    TRIM(region) AS trim,
    -- Replace all '&' characters with the string 'and'
    REPLACE(TRIM(region),'&','and') AS character_swap,
    -- Remove all periods
    REPLACE(TRIM(region),'.','') AS character_remove,
    -- Combine the functions to run both changes at once
    REPLACE(REPLACE(TRIM(region), '.', ''), '&', 'and') AS character_swap_and_remove
FROM countries
WHERE region = 'LATIN AMER. & CARIB    '
GROUP BY region;