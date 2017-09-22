# At the top of every file, add a sentence or two describing what it is for. Simple explanations only! If the explanation isn't simple, it means the file should be split up into smaller (simpler) files.

require "pry"
require "csv"
require "pg"

conn = PGconn.open(:dbname => 'netflix')


	CSV.foreach("NetflixDatabase.csv", {headers: true, return_headers: false}) do |row|
		 
		title = row["title"].chomp
		description = row["description"].chomp
		video = row["video"].chomp
		views = row["views"].to_i
	

		result = conn.exec("INSERT INTO videos (title, description, video, views) VALUES('"+title.to_s+"', '" +description.to_s+"', '"+video+"', #{views});")
	end


 # id | title | description | video | views 
 '
 '
 INSERT INTO users (name, password) VALUES('kamin', 'pw');