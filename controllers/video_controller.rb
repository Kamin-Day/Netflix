# Contains controller methods regarding video page and display on index


# Loads a new video
# Gets a video code from a param
# Sends that  information to a function to fetch information about the video from the DB
post '/load_video' do
	videoSelection = params["video"]
	displayVideoInfo(videoSelection)
end

# Checks to see if a user is logged in,
# If they are, loads the main page,
# If thery are not, they are redirected to the log in page
get '/index' do
	@currentVideo = displayRandomOnLoad()
	
	# @videoTitle =
	# @videoViews =
	# @videoURL =

	@title = "YouFlix."
    permitAccess ? erb(:index) : redirect('/')
end
