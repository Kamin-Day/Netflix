require "pry"
require "sinatra"
require_relative 'functions.rb'

# Homepage
get '/' do 
	erb :login
end

post '/submit' do
	a = params["loginID"]
	b = params["passwordInput"]
	checkLogin(a, b)

end

get '/index' do
	erb :index
end
