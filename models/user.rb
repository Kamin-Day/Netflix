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
	return '<img src="/images/'+ result[0]["img"] + '" alt="' + result[0]["name"]+ '">'
	#{result[0]["img"]}" alt="#{result[0]["name"]} profile image">'
end


#Fetches information from the DB on the user whos information matches the session ID
#Returns an HTML string to display their user name on a web page
def getUserName
	id = session[:id]
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM users WHERE id=#{id};").to_a
	return "<h1>#{result[0]['name']}</h1>"
end
