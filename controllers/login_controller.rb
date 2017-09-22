# Contains controller functions related to logging a user in

# Logs a user in
post '/submit' do
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