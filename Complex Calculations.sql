-- Windows Function
-- 1. Total GDP for each country across all years
SELECT 
	country_id,
    year,
    gdp,
    -- Show total gdp per country and alias accordingly
	SUM(gdp) OVER (PARTITION BY country_id) AS country_sum_gdp
FROM country_stats;

-- 2.1 Query total_golds by region and country_id
SELECT 
	region, 
    country_id, 
    SUM(gold) AS total_golds
FROM summer_games AS s
JOIN countries AS c
ON s.country_id = c.id
GROUP BY region, country_id;

-- 2.2 Pull in avg_total_golds by region
SELECT 
	region,
  AVG(total_golds) AS avg_total_golds
FROM
  (SELECT 
      region, 
      country_id, 
      SUM(gold) AS total_golds
  FROM summer_games AS s
  JOIN countries AS c
  ON s.country_id = c.id
  -- Alias the subquery
  GROUP BY region, country_id) AS subquery
GROUP BY region
-- Order by avg_total_golds in descending order
ORDER BY avg_total_golds DESC;

-- 3 Percent of gdp per country
-- Pull country_gdp by region and country
SELECT 
	region,
    country,
	SUM(gdp) AS country_gdp,
    -- Calculate the global gdp
    SUM(SUM(gdp)) OVER () AS global_gdp,
    -- Calculate percent of global gdp
    SUM(gdp) / SUM(SUM(gdp)) OVER () AS perc_global_gdp,
    -- Calculate percent of gdp relative to its region
    SUM(gdp) / SUM(SUM(gdp)) OVER (PARTITION BY region) AS perc_region_gdp
FROM country_stats AS cs
JOIN countries AS c
ON cs.country_id = c.id
-- Filter out null gdp values
WHERE gdp IS NOT NULL
GROUP BY region, country
-- Show the highest country_gdp at the top
ORDER BY country_gdp DESC;

-- 4. GDP per capita performance index
 -- Bring in region, country, and gdp_per_million
SELECT 
    region,
    country,
    SUM(gdp) / SUM(population) AS gdp_per_capita,
    -- Output the worlds gdp_per_capita
    SUM(SUM(gdp)) OVER () / SUM(SUM(population)) OVER () AS gdp_per_capita_total,
    -- Build the performance_index in the 3 lines below
    (SUM(gdp) / SUM(population))
    /
    (SUM(SUM(gdp)) OVER () / SUM(SUM(population)) OVER ()) AS performance_index
-- Pull from country_stats_clean
FROM country_stats AS cs
JOIN countries AS c 
ON cs.country_id = c.id
-- Filter for 2016 and remove null gdp values
WHERE year = '2016-01-01' AND gdp IS NOT NULL
GROUP BY region, country
-- Show highest gdp_per_capita at the top
ORDER BY gdp_per_capita DESC;