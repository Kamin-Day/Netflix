require 'csv'
require 'pg'
require 'pry'


conn = PGconn.open(:dbname => 'netflix')

#takes in params of user name a and password b from params on a web form and searches the DB users table
#for a matching entry.  
def checklogin (loginName , loginPwd)
	loginName = a
	loginPwd = b
	result = @conn.exec("SELECT * FROM users WHERE name=#{loginName};")


	# result = @conn.exec("SELECT * FROM users WHERE name=#{loginName} AND password=#{loginPwd};")
	return checkValidLogin(result, loginPwd)	
end

# Checks to see if the password entered mathes the password in the database
def checkLoginMatch(result, loginName, loginPwd)
	return result['password'] == loginPwd
end

#Function that gathers all of the videos from the DB and adds HTML tags to the data to make an array of line items
# containing links to videos with titles. Returns the output of a function which places the li elements into an ol
def displayURLS
	result = conn.exec("SELECT * FROM videos;").to_a
	urls = []
	result.each do |video|
		urls.push('<li><a href="https://www.youtube.com/embed/' + video["video"]+'">'+video['title']+'></li>')
	end
	return outputURLS(urls)
end

#takes in an array of li elements and creates a html string with ol tags before and after the li elements
def outputURLS(urls)
	output = "<ol>"
	urls.each do |link|
		output += link
	end
	output += "</ol>"
	return output
end

# displays a random video on page load
def displayRandomOnLoad
	
	result = conn.exec("SELECT * FROM videos;").to_a
	return '<iframe width="854" height="480" src="https://www.youtube.com/embed/' + result[randomNum]["video"] +'" frameborder="0" allowfullscreen></iframe>'
end






