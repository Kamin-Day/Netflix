require "pry"
require "sinatra"
require_relative 'functions.rb'

# Homepage
get '/' do 
	erb :index
end

