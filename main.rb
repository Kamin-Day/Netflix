require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'functions.rb'
require_relative 'controllers/main_controller.rb'

# TODO: Write some Ruby here that loops through models/ and for each Ruby file in that directory, it does `require_relative(...)` on that file.

enable :sessions


# Homepage
get '/' do 
	erb :login_form
end


