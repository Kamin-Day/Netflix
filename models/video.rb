
require 'rubygems'
require 'bundler'

Bundler.require

require 'csv'

enable :session 

# Returns data from videos table to be used in erb 
def getVideos
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM videos;").to_a
	return result
end

# Returns an html string containing a random video url from the database
#TODO : HTML access
def displayRandomOnLoad
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM videos;").to_a
	@currentVideo = result[randGet()]
	return @currentVideo
	# return '<iframe width="854" height="480" src="https://www.youtube.com/embed/' + @currentVideo +'" frameborder="0" allowfullscreen></iframe>'
end

# Generates a random number from 0 to 49
def randGet
	num = Random.new
	num.rand(0..49)
end


# Takes in a video code and fetches information about the video from the DB
# Returns a string with a "/" delimiter containing the information from each field
def displayVideoInfo(video)
	conn = PGconn.open(:dbname => 'netflix')
	result = conn.exec("SELECT * FROM videos WHERE video='#{video}';").to_a[0]
	d = "/"
	return result["title"] + d + result["description"] + d + result["video"] + d + result["views"]
end




# The following functions are not currently in use

# # Function that gathers all of the videos from the DB and adds HTML tags to the data to make an array of line items
# # containing links to videos with titles. Returns the output of a function which places the li elements into an ol
# def displayURLS
# 	conn = PGconn.open(:dbname => 'netflix')
# 	result = conn.exec("SELECT * FROM videos;").to_a
# 	urls = []
# 	result.each do |video|
# 		urls.push('<li><a class="listItem" href="https://www.youtube.com/embed/' + video["video"]+'">'+video['title']+'</a></li>')
# 	end
# 	return outputURLS(urls)
# end

# # Takes in an array of li elements and creates a html string with ol tags before and after the li elements
# def outputURLS(urls)
# 	output = "<ol>"
# 	urls.each do |link|
# 		output += link
# 	end
# 	output += "</ol>"
# 	return output
# end
