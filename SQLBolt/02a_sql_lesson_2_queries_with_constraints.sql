/*
SQL Lesson 2: Queries with constraints (Pt. 1)

Using the right constraints, find the information we need from the Movies table for each task below.
*/


-- Find the movie with a row id of 6 
SELECT * FROM movies WHERE id = "6";

-- Find the movies released in the years between 2000 and 2010
SELECT * FROM movies WHERE Year BETWEEN 2000 AND 2010

-- Find the movies not released in the years between 2000 and 2010; 
SELECT * FROM movies WHERE Year NOT BETWEEN 2000 AND 2010;

-- Find the first 5 Pixar movies and their release year
SELECT Title,Year FROM movies WHERE id BETWEEN 1 AND 5
