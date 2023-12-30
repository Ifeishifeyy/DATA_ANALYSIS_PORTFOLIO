/*
TAYLOR SWIFT CONCERT TOUR ANALYSIS

	KEY QUESTIONS
		1. What are the top opening acts and how many times have they performed?
		2. What Tour generated the highest revenue? What are the average cost of ticket per person across various tours?
		3. Which countries have hosted the most concerts? what were their revenue in each country?
		4. What cities and countries have generated the highest revenue?
		5. What is the ratio of ticket sold to ticket available?
		6. What venue generated the highest revenue with respect to the country that hosted the most concert?

---------------------------------------------------------------------------------------------- */


--1. What are the top 5 opening acts
SELECT opening_acts, count(opening_acts) AS Number_of_Performance
FROM TaylorConcertTourTaylor_Train
GROUP BY opening_acts
ORDER BY Number_of_Performance DESC
LIMIT 5;


--2. Which tour generated the highest revenue?
SELECT tour, SUM(revenue) AS Revenue_Generated
FROM TaylorConcertTourTaylor_Train
GROUP BY tour
ORDER BY Revenue_Generated;


--2b. Average cost of ticket across the various tour years
SELECT tour, AVG(ticket_per_person) AS Average_Ticket_Price
FROM TaylorConcertTourTaylor_Train
GROUP BY tour;


--3. What Countries have hosted the most concerts?
SELECT country, SUM(revenue) AS Revenue_Generated
		      , COUNT(country) AS Number_of_Concerts_Held
FROM TaylorConcertTourTaylor_Train
GROUP BY country
ORDER BY Number_of_Concerts_Held DESC;


--4. What cities have generated the highest revenue?
SELECT city, SUM(revenue) AS Revenue_Generated
FROM TaylorConcertTourTaylor_Train
GROUP BY city
ORDER BY Revenue_Generated DESC
LIMIT 10;


--5. What is the ratio of tickets sold to tickets available
SELECT tour, SUM(tickets_sold) AS Tickets_Sold
			, SUM(tickets_available) AS Tickets_Available
FROM TaylorConcertTourTaylor_Train
GROUP BY tour;


--6. What are the top 10 selling venues in the united states
SELECT venue, SUM(revenue) AS Revenue_Generated
FROM TaylorConcertTourTaylor_Train
WHERE country = 'United States'
GROUP BY venue
ORDER BY Revenue_Generated DESC
LIMIT 10;




