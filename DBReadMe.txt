TODO: Clean this up--make it perfect.

===========================================
Enter these lines in terminal to create your netflix database, open it and then create its users, videos, and ratings table, and then finally popuate your videos table by running the script in build.rb.
===========================================
The final line is an example of adding a row to the users table. At least one user must exist to log into the website and view its content.
===========================================
1. Starts postgres
2. Creates database
3. Quits postgres
4. Opens the 'netflix' database and starts postgres
5. Creates a 'videos' table
6. Creates a 'users' table
7. Creates a 'ratings' table
8. Closes postgres
9. Runs build.rb to populate 'videos'
10. Is an example line for adding a row to the 'users' table.
===========================================


psql postgres

CREATE DATABASE netflix;

\q

psql netflix

CREATE TABLE videos(id SERIAL PRIMARY KEY, title VARCHAR, description VARCHAR, video VARCHAR, views INTEGER);


CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR, password VARCHAR, img VARCHAR);

CREATE TABLE ratings(id SERIAL PRIMARY KEY, video_id INTEGER, user_id INTEGER, rating INTEGER);

\q

ruby build.rb


INSERT INTO users (name, password, img) VALUES('kamin', 'pass', 'NetflixDatabase.png');