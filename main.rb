require "pry"
require "sinatra"
require_relative 'functions.rb'

# Homepage
get '/' do 
	erb :login_form
end

post '/login' do
	loginName = params["loginID"]
	loginPwd = params["passwordInput"]
	checkLogin(loginName, loginPwd)

end

get '/index' do
	erb :index
end
