/*
SQL Lesson 1: SELECT queries 101

We will be using a database with data about some of Pixar's classic movies for most of our exercises. This first exercise will only involve the Movies table, and the default query below currently shows all the properties of each movie. To continue onto the next lesson, alter the query to find the exact information we need for each task.
*/


-- Find the title of each film
SELECT title FROM movies;

-- Find the director of each film 
SELECT Director FROM movies;

-- Find the title and director of each film
SELECT Title, Director FROM movies;

-- Find the title and year of each film 
SELECT Title, Year FROM movies;

-- Find all the information about each film
SELECT * FROM movies;
