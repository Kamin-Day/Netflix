# TODO: At the top of every file, add a sentence or two describing what it is for. Simple explanations only! If the explanation isn't simple, it means the file should be split up into smaller (simpler) files.

# TODO: Indentation is messed up. Fix please.

# Build.rb is a file used to populate the videos table of the 'netflix' database with data which is read from a CSV file. 
require 'rubygems'
require 'bundler'

Bundler.require

require "csv"

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
