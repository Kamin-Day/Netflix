TODO: Clean this up--make it perfect.

===========================================
Enter these lines in terminal to create,
open, and populate your DB.
===========================================


psql postgres

CREATE DATABASE netflix;

\q

psql netflix

CREATE TABLE videos(id SERIAL PRIMARY KEY, title VARCHAR, description VARCHAR, video VARCHAR, views INTEGER);


CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR, password VARCHAR, img VARCHAR);

CREATE TABLE ratings(id SERIAL PRIMARY KEY, video_id INTEGER, user_id INTEGER, rating INTEGER);

ruby build.rb

	
	NetflixDatabase.png
	INSERT INTO users (name, password, img) VALUES('kamin', 'pass', 'NetflixDatabase.png');