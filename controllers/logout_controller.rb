require 'rubygems'
require 'bundler'

Bundler.require



# TODO: Write some Ruby here that loops through models/ and for each Ruby file in that directory, it does `require_relative(...)` on that file.

enable :sessions


# Homepage
get '/logout' do 
	session.clear
	redirect '/'
end


