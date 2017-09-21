require "pry"
require "sinatra"
require_relative 'functions.rb'

# Homepage
get '/' do 
	erb :login_form
end

post '/login' do
	# a = params["loginID"]
	# b = params["passwordInput"]
	# checkLogin(a, b)

end

get '/index' do
	erb :index
end
