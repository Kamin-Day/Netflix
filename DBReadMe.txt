psql postgres

CREATE DATABASE netflix;

CREATE TABLE videos(id SERIAL PRIMARY KEY, title VARCHAR, description VARCHAR, video VARCHAR, views INTEGER);


CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR, password VARCHAR);

CREATE TABLE ratings(id SERIAL PRIMARY KEY, video_id INTEGER, user_id INTEGER, rating INTEGER);



