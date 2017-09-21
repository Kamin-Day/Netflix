window.addEventListener("load", function(){

	// adds an event listener to each link in the list of videos
	// when clicked, splits the URL in the link and takes then
	// sends the video code into functions
	var videoLink = document.getElementsByClassName("listItem");
 	for (var e = 0; e < videoLink.length; e++){
        videoLink[e].addEventListener("click", function(){
	        event.preventDefault();
			
			videoSelection = event.target.href.split("/")[4];
			loadVideoToPage(videoSelection);
			loadVideoInfo(videoSelection);
	    });
    }
	
	// takes in the new video code	
	// Changes the src of the video player iframe element to reflect the new video url
	var loadVideoToPage = function(video){
		var videoPlayer = document.getElementsByTagName("iframe");
		videoPlayer[0].src = "https://www.youtube.com/embed/" + video;

	}

    // takes in a video url code 
	// makes a request to the server to load information to the corresponding video
	// when the response is recieved, it seperates the information from within the 
	// response string (which was formatted with /'s) and sends each part to a respective 
	// function to update the display information.  
	var loadVideoInfo = function(video){
		var request = new XMLHttpRequest();
		request.open("POST", "/load_video?video=" + video);
		request.send();
		request.addEventListener("load", function(){
			// [0] = title
			// [1] = description
			// [2] = video URL
			// [3] = views
			videoInfo = request.response.split("/");
			updateTitle(videoInfo[0])
			updateViews(videoInfo[3])
			updateDescription(videoInfo[1])
		});
	}
	// takes in a string
	// updates the title display
	var updateTitle = function(title){
		var titleField = document.getElementsByClassName("video-title")[0];
		titleField.innerText = title
	}

	// takes in a string
	// updates the number of views display
	var updateViews = function(views){
		var viewsField = document.getElementsByClassName("video-views")[0];
		viewsField.innerText = views 
	}

	// takes in a string
	// updates the description display
	var updateDescription = function(description){
		var descriptionField = document.getElementsByClassName("video-description")[0];
		descriptionField.innerText = description
	}
});





