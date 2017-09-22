# Contains a group of functions which handle the log in process

require 'rubygems'
require 'bundler'
Bundler.require
require 'csv'

enable :session 
conn = PGconn.open(:dbname => 'netflix')

# Takes in params of user name a and password b from params on a web form and searches the DB users table for a matching entry.  
def checkLogin (loginName , loginPwd)
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM users WHERE name=#{loginName};")
	return checkValidLogin(result, loginPwd)	
end

# Checks to see if the password entered mathes the password in the database
def checkLoginMatch(result, loginName, loginPwd)
	return result['password'] == loginPwd
end

# Checks to see if a user is logged in 
# Returns a true(logged in)/false(logged out) response
def permitAccess
	if session[:id] == nil
		return false
	else
		return true
	end
end

# Takes in the entered username and password, and checks to find a matching name/password pair in the users table of the DB
# If there is no match, nothing is returned from the database and the id = nil, so false is returned from the function.
# If there is a matching pair, the user id is returned from the function.
def returnID (username, password)
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT id FROM users WHERE name='#{username}' AND password='#{password}';").to_a
	if result[0] == nil 
		return false
	else 
		return result[0]["id"].to_i
	end
end

# Take in the results of returnID. If it is a valid integer, it sets a session to the users id. Otherwise it returns false
def setSession(id)
	if id.class == Integer 
		session[:id] = id
	else 
		return false 
	end
end
