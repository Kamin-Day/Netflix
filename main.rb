require "pry"
require "sinatra"
require_relative 'functions.rb'
enable :sessions

# Homepage
get '/' do 
	erb :login_form
end

# logs a user in
post '/login' do
	# Grabs the username and password from params and stores them in variables
	loginName = params["loginID"]
	loginPwd = params["passwordInput"]
	# If the information matches a name/password pair, sets a session with the user id
   	if !setSession(returnID(loginName, loginPwd))
   		redirect '/'
   	else redirect '/index'
   	end

end

#Loads a new video
post '/load_video' do
	videoSelection = params["video"]
	loadVideoInfo(videoSelection)
end

get '/index' do
	erb :index
end
