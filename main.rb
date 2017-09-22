require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'functions.rb'

# TODO: Write some Ruby here that loops through models/ and for each Ruby file in that directory, it does `require_relative(...)` on that file.

enable :sessions

# TODO: Organize all of the route handlers below into small, easily-explained controller files.

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
   	else
      redirect '/index'
   	end

end

#Loads a new video
# => Gets a video code from a param
# => Sends that  information to a function to fetch information about the video from the DB
post '/load_video' do
	videoSelection = params["video"]
	displayVideoInfo(videoSelection)
end

#Checks to see if a user is logged in,
# => If they are, loads the main page,
# => If thery are not, they are redirected to the log in page
get '/index' do
  permitAccess ? erb :index : redirect '/'
end
