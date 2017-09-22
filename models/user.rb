require 'rubygems'
require 'bundler'

Bundler.require

require 'csv'

enable :session 




#Fetches information from the DB on the user whos information matches the session ID
#Returns an HTML string to display their user image on a web page
def getUserImage
	id = session[:id]
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM users WHERE id=#{id};").to_a
	return result[0]
end


#Fetches information from the DB on the user whos information matches the session ID
#Returns an HTML string to display their user name on a web page
def getUserName
	id = session[:id]
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM users WHERE id=#{id};").to_a
	return result[0]['name']
end
