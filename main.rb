require "pry"
require "sinatra"

# Homepage
get '/' do 
	erb :index
end

