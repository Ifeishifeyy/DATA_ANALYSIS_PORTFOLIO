--VIDEO GAME DATA ANALYSIS


/* Key Questions,
	1. What are the top 5 most selling video games of all times? 
	2. What is the most selling region?
	3. What is the most selling genre and platform?
	4. What years has the highest global sales?
	5. What are the top 5 most selling video game publishers?
*/

-- 1. Top 5 most selling video games of all times
SELECT name, publisher, SUM(global_sales) AS Global_sales 
FROM vgsales
GROUP BY name
ORDER BY Global_sales DESC
LIMIT 5;

--2. What is the most selling video region
SELECT SUM(na_sales) as North_America,
	   SUM(eu_sales) AS Europe,
       SUM(jp_sales) AS Japan,
       SUM(other_sales) AS Other
FROM vgsales

--3a. Most popular video game genre
SELECT genre, 
	  SUM(eu_sales) AS EU_Sales, 
      SUM(jp_sales) AS JP_Sales, 
      SUM(na_sales) AS NA_Sales, 
      SUM(other_sales) AS Other_Sales, 
      SUM(global_sales) AS Total_Amt_of_Sales
FROM vgsales
GROUP BY genre
ORDER BY Total_Amt_of_Sales DESC ;
 
 
 --3b. Top 5 Most selling platforms
SELECT platform, COUNT(platform) AS Num_of_games, 
	   SUM(global_sales) AS Total_Copies_sold 
FROM vgsales
GROUP BY platform
ORDER BY Total_Copies_sold DESC -- ORDER BY Num_of_games DESC
LIMIT 5;


--4. What year has the highest global sales?
SELECT year, COUNT(year) AS Num_of_Games, 
	   SUM(global_sales) AS Total_Copies_sold 
FROM vgsales
GROUP BY year
ORDER BY Total_Copies_sold DESC;


--5. The top 5 most selling video game publisher 
SELECT publisher,COUNT(publisher) AS Num_of_Games,
	   SUM(global_sales) AS Total_Copies_sold 
FROM vgsales
GROUP BY publisher
ORDER BY Total_Copies_sold DESC
LIMIT 5;


--Specifics
--How much was made by a publishers in a particular year
SELECT publisher, SUM(global_sales) AS Total_Amt_of_sales
FROM vgsales
WHERE year = 2006
GROUP BY publisher;


--Get top selling games for specifically given genres
SELECT * FROM vgsales 
WHERE genre = "Puzzle"
ORDER BY global_sales DESC
LIMIT 10;