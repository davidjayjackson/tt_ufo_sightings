-- Check if there are any missing values in the dataset
SELECT COUNT(*) AS count
FROM ufo_sightings
WHERE reported_date_time_utc IS NULL
   OR reported_date_time IS NULL
   OR posted_date IS NULL
   OR city IS NULL
   OR state IS NULL
   OR country_code IS NULL
   OR shape IS NULL
   OR reported_duration IS NULL
   OR duration_seconds IS NULL
   OR summary IS NULL
   OR has_images IS NULL
   OR day_part IS NULL;

  -- Check if there are any NAs
  
SELECT COUNT(*) AS count
FROM ufo_sightings
WHERE reported_date_time_utc = 'NA'
   OR reported_date_time = 'NA'
   OR posted_date = 'NA'
   OR city = 'NA'
   OR state = NULLIF('NA', 'NA')
   OR country_code = 'NA'
   OR shape = 'NA'
   OR reported_duration = 'NA'
   OR duration_seconds = NULLIF('NA', 'NA')
   OR summary = 'NA'
   OR (has_images != 'true' AND has_images != 'false')
   OR day_part = 'NA';

SELECT *
FROM ufo_sightings
WHERE reported_date_time_utc = 'NA'
   OR reported_date_time = 'NA'
   OR posted_date = 'NA'
   OR city = 'NA'
   OR state = NULLIF('NA', 'NA')
   OR country_code = 'NA'
   OR shape = 'NA'
   OR reported_duration = 'NA'
   OR duration_seconds = NULLIF('NA', 'NA')
   OR summary = 'NA'
   OR (has_images != 'true' AND has_images != 'false')
   OR day_part = 'NA';


SELECT *
FROM main.ufo_places ;

SELECT DISTINCT shape
FROM ufo_sightings

-- Get an overview of the data
SELECT *
FROM main.ufo_sightings 
LIMIT 10;

-- Check the distribution of shapes reported
SELECT shape, COUNT(*) AS count
FROM ufo_sightings
GROUP BY shape
ORDER BY count DESC;

-- Calculate the average duration in hours
SELECT AVG(duration_seconds/60) AS average_minutes,
	AVG(duration_seconds/3600) AS average_hours,
FROM ufo_sightings;

-- Find the cities with the most sightings
SELECT city, COUNT(*) AS count
FROM ufo_sightings
GROUP BY city
ORDER BY count DESC
LIMIT 10;

-- Identify the countries with the highest number of sightings
SELECT country_code, COUNT(*) AS count
FROM ufo_sightings
GROUP BY country_code
ORDER BY count DESC;

-- Explore the distribution of sightings by day part
SELECT day_part, COUNT(*) AS count
FROM ufo_sightings
GROUP BY day_part
ORDER BY count DESC;

