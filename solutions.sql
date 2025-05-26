
CREATE TABLE netflix(
	show_id	varchar(10),
	type varchar(10),
	title varchar(150),
	director varchar(255),	
	casts varchar(1000),
	country varchar(255),	
	date_added varchar(50),
	release_year int,
	rating	varchar(10),
	duration varchar(15),
	listed_in	varchar(100),
	description varchar(255)
);
SELECT * FROM netflix;
SELECT DISTINCT type FROM netflix;
SELECT COUNT(*) AS total_content
FROM netflix;

--1.count the number of movies vs tv shows
SELECT type,COUNT(*) AS content
FROM netflix
GROUP BY type;

--2.Find the most common rating for movies and tv shows
SELECT type,rating
FROM(
SELECT type,rating ,COUNT(*) AS common_rating,
	RANK() OVER (PARTITION BY type ORDER BY COUNT(*) desc) AS rnk
FROM netflix
GROUP BY type,rating
) AS TEMP
WHERE rnk=1;

--3.List all movies released in a specific year(eg:2020)
SELECT *
FROM netflix
WHERE type = 'Movie' AND release_year = 2020;

--4.Find the top 5 countries with the most content on netflix
SELECT TRIM(UNNEST(STRING_TO_ARRAY(country,','))) AS new_country,
	COUNT(show_id) AS contents
FROM netflix
WHERE country IS NOT NULL
GROUP BY new_country
ORDER BY contents DESC
LIMIT 5;

--5.Idnetify the longest movie
SELECT *
FROM netflix
WHERE type = 'Movie' AND 
	duration = (SELECT MAX(duration) FROM netflix);

--6.Find the content added in last 5 years
SELECT * FROM netflix
WHERE date_added IS NOT NULL
	AND TO_DATE(date_added,'Month DD,YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--7.Find all the movie/TV shows by director 'Rajiv Chilaka'
SELECT *
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%'

--8.List all tv shows with more than 5 seasons
SELECT * FROM netflix
WHERE type = 'TV Show'
	AND CAST(SPLIT_PART(duration, ' ',1)AS INTEGER)>5;

--9.count the number of content items in each genre
SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in,',')) as genre,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY genre;

--10.Find each year and the number of content released
--by India on netflix.return top 5 years with highest avg content release
SELECT release_year, COUNT(show_id) AS content
FROM netflix
WHERE country = 'India'
 AND release_year IS NOT NULL
GROUP BY release_year
ORDER BY content DESC
LIMIT 5;

--List all movies that are documentaries
SELECT* FROM netflix
WHERE type='Movie'
AND listed_in ILIKE '%Documentaries%'

--12.Find all the content without a director
SELECT * FROM netflix 
WHERE director IS NULL

--13.Find in how many movies actor 'Venessa Hudgens' appeared in last 10 years
SELECT * FROM netflix
WHERE casts ILIKE '%Venessa Hudgens%'
	AND release_year > EXTRACT(YEAR FROM CURRENT_DATE)-10;

--14.Find the top 10 actors who have appeared in the highest number of movies produced in India
SELECT TRIM(actor) AS actor, COUNT(*) AS movie_count
FROM netflix,
     UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor
WHERE type = 'Movie'
  AND country ILIKE '%India%'
  AND casts IS NOT NULL
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 10;

	

