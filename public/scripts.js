window.addEventListener("load", function(){

	var videoLink = document.getElementsByClassName("listItem");
 	for (var e = 0; e < videoLink.length; e++){
        videoLink[e].addEventListener("click", function(){
        event.preventDefault();
		
		videoSelection = event.target.href.split("/")[-1];
		loadVideoToPage(videoSelection)
		// var request = new XMLHttpRequest();
		// request.open("POST", "/load_video?video=" + videoSelection);
		// request.send()
		// request.addEventListener("load", loadVideoToPage(request))
        });
    }
	
		


	var videoPlayer = document.getElementsByTagName("iframe");


	var loadVideoToPage = function(video){
		var videoPlayer = document.getElementsByTagName("iframe");
		videoPlayer[0].src = "https://www.youtube.com/embed/" + video;
		loadvideoInfo(video)

	}
// '<iframe width="854" height="480" src="https://www.youtube.com/embed/' + result[randGet()]["video"] +'" frameborder="0" allowfullscreen></iframe>'

	var loadVideoInfo = function(video){
		var request = new XMLHttpRequest();
		request.open("POST", "/load_video?video=" + video);
		request.send();
		result = request.addEventListener("load");
		

		send 'video' to ruby
		get back the information about the video
			Results


		// event.preventDefault();
		// event.target;
		// debugger;
		// videoSelection = event.target;

		// var request = new XMLHttpRequest();
		// request.open("POST", "/load_video?video=" + videoSelection);
		// request.send()
		// request.addEventListener("load", loadVideoToPage)
	}






// 	var loadButton = document.getElementById("load");
// 	loadButton.addEventListener("click", function(){


// 		event.preventDefault();
// 		var currentSelection = document.getElementsByTagName("form")[0].childNodes[1];
// 		var chosenSelection = currentSelection.options[currentSelection.selectedIndex].text;
					
// 		var request = new XMLHttpRequest();
// 		request.open("POST", "/load_painting?loadArt=" + chosenSelection);
// 		request.send()
	
// 		request.addEventListener("load", refillCanvas)
// 	});

// 	var refillCanvas = function(event){
// 		var request = event.target; 
// 		alert(request.response);


// 		var testcolors = "wwwwyyywbbwwwwww";
// 		for (var e = 0; e <rows.length; e++){
// 			if (request.response.charAt(e) == "w"){
// 				rows[e].style.backgroundColor = "white"
// 			} else if (request.response.charAt(e) == "y"){
// 				rows[e].style.backgroundColor = "yellow"
// 			} else if (request.response.charAt(e) == "r"){
// 				rows[e].style.backgroundColor = "red"
// 			} else if (request.response.charAt(e) == "b"){
// 				rows[e].style.backgroundColor = "blue"
// 			}
// 		}
		
// 	}



// // Creates an array of color values to save a painting.
// 	var savePainting = function(event){
// 		var boxColors = "";
// 		for (var i = 0; i < rows.length; i++){
// 			if (rows[i].style.backgroundColor.charAt(0) == ""){
// 				boxColors += "w"
// 			} else {
// 				boxColors += rows[i].style.backgroundColor.charAt(0);
// 			}
// 		}
// 		var data = "?saveArt=" + boxColors;
// 		// window.history.replaceState(null, null, "/" + data);
// 		var request = new XMLHttpRequest();
// 		request.open("POST", "/save_painting" + data);
// 		request.send()
// 		request.addEventListener("load", alert_Save_Success)

// 		// saveToFile(boxColors)
// 		//return boxColors;
// 	}


// // Once a response has been received back from the server, alert success
// 	var alert_Save_Success = function(event){
// 		alert("Good job! Your masterpiece has been preserved.");
// 		var request = event.target; 
		
// 	}

});





