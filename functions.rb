require 'csv'
require 'pg'
require 'pry'
enable :session 


conn = PGconn.open(:dbname => 'netflix')

#takes in params of user name a and password b from params on a web form and searches the DB users table
#for a matching entry.  
def checkLogin (loginName , loginPwd)
	conn = PGconn.open(:dbname => 'netflix')

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
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM videos;").to_a
	urls = []
	result.each do |video|
		urls.push('<li><a class="listItem" href="https://www.youtube.com/embed/' + video["video"]+'">'+video['title']+'</a></li>')
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

# returns an html string containing a random video url from the database
def displayRandomOnLoad
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM videos;").to_a
	return '<iframe width="854" height="480" src="https://www.youtube.com/embed/' + result[randGet()]["video"] +'" frameborder="0" allowfullscreen></iframe>'
end

#Generates a random number from 0 to 49
def randGet
	num = Random.new
	num.rand(0..49)
end

# Takes in the entered username and password, and checks to find a matching name/password pair in the users table of the DB
# If there is no match, nothing is returned from the database and the id = nil, so false is returned from the function.
# If there is a matching pair, the user id is returned from the function.
def returnID (username, password)
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT id FROM users WHERE name='#{username}' AND password='#{password}';").to_a
	if result[0] == nil 
		return false
	else return result[0]["id"].to_i
	end
end

#take in the results of return id.
# it id is a valid integer, it sets a session to the users id
#else returns false
def setSession(id)
	if id.class == Integer 
		session[:id] = id
	else return false 
	end
end

def getUserImage
	id = session[:id]
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM users WHERE id=#{id};").to_a
	return '<img src="/images/'+ result[0]["img"] + '" alt="' + result[0]["name"]+ '">'
	#{result[0]["img"]}" alt="#{result[0]["name"]} profile image">'
end

def getUserName
	id = session[:id]
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM users WHERE id=#{id};").to_a
	return "<h1>#{result[0]['name']}</h1>"
end

def loadVideoInfo(video)
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM users WHERE video=#{video};").to_a
	return result[0]["video"]

end


def displayVideoInfo(video)
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT title, description, views FROM videos WHERE video=#{video};").to_a
	return result
end
