# Build.rb is a file used to populate the videos table of the 'netflix' database with data which is read from a CSV file. 
require 'rubygems'
require 'bundler'
require "csv"
Bundler.require

# Sets utility to open the correct database.
conn = PGconn.open(:dbname => 'netflix')

# This reads through the CSV file and adds the data to the videos table.
CSV.foreach("NetflixDatabase.csv", {headers: true, return_headers: false}) do |row|	 
	title = row["title"].chomp
	description = row["description"].chomp
	video = row["video"].chomp
	views = row["views"].to_i
	result = conn.exec("INSERT INTO videos (title, description, video, views) VALUES('"+title.to_s+"', '" +description.to_s+"', '"+video+"', #{views});")
end
