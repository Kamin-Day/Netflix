require 'csv'
require 'pg'
require 'pry'


conn = PGconn.open(:dbname => 'netflix')

#takes in params of user name a and password b from params on a web form and searches the DB users table
#for a matching entry.  
# def checklogin (a , b)
# 	loginName = a
# 	loginPwd = b

# 	result = @conn.exec("SELECT * FROM users WHERE name=#{loginName} AND password=#{loginPwd};")
# 	checkLoginMatch(result, loginName, loginPwd)	
# end

# def checkLoginMatch(result, loginName, loginPwd)
# if 
#   	result['name'] == 'admin' && result['password']
#   	# If successful, set the session var
#   	session[:id] = @username
#   # and redirect back to the homepage.
#   	redirect '/admin'
# 	else
# 	redirect '/login'
# 	end

# end


def displayURLS
	conn = PGconn.open(:dbname => 'netflix')
	binding.pry
	result = conn.exec("SELECT * FROM videos;").to_a

	urls = []
	result.each do |video|
		urls.push('<li><a href="https://www.youtube.com/embed/' + video["video"]+'">'+video['title']+'></li>')
	end
	return outputURLS(urls)
end

def outputURLS(urls)
	output = "<ol>"
	urls.each do |link|
		output += link
	end
	output += "</ol>"
	return output
end







