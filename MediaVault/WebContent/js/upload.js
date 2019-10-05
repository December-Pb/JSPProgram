$(document).ready(function() {
				$("#exit").click(function() {
   					window.open('Welcome.jsp','_self')
   				});
			});
			

function selected(){
	var video=document.getElementById("share").files[0];
	document.getElementById("vName").innerHTML=video.name;
	document.getElementById("vSize").innerHTML=video.size/1024+"Mb"
	document.getElementById("vType").innerHTML=video.type
}


function movieImgPreview(fileDom){
    //Judge whether support the FileReader
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("Please upload your facility");
    }
    //Obtain file
    var file = fileDom.files[0];
    var imageType = /^image\//;
    //Judge whether it is a picture
    if (!imageType.test(file.type)) {
        alert("Please choose a picture!");
        return;
    }
     //Finish Reading
    reader.onload = function(e) {
        //Obtain the dom of the picture
        var img = document.getElementById("moviePreview");
        //Set the path as reading the picture
        img.src = e.target.result;
    };
    reader.readAsDataURL(file);
}
function musicImgPreview(fileDom){
    //Judge whether support the FileReader
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("Please upload your facility");
    }
    //Obtain picture
    var file = fileDom.files[0];
    var imageType = /^image\//;
    //Judge whether it is a picture
    if (!imageType.test(file.type)) {
        alert("Please choose a picture!");
        return;
    }
     //Finish reading
    reader.onload = function(e) {
        //Obtain the picture's dom
        var img = document.getElementById("musicPreview");
        //Set the path as reading the picture
        img.src = e.target.result;
    };
    reader.readAsDataURL(file);
}
$(document).ready(function() {
	//Judge whether the value in text is undefined or null
	$("#submit1").click(function() {
		if(($("#movieName").val()=="")||($("#movieName").val()==undefined)||
		($("#movieDiscription").val()=="")||($("#movieDiscription").val()==undefined)
		||($("#movieDuration").val()=="")||($("#movieDuration").val()==undefined)) {
			alert("Please fill in information");
			window.open('upload.jsp','_self');
		}
		else {
			alert("OK");
			window.open('movie_menu.jsp','_self');
		}
	})
})
$(document).ready(function() {
	$("#submit2").click(function() {
		//Judge whether the value in text is undefined or null
		if(($("#musicName").val()=="")||($("#musicName").val()==undefined)
		||($("#musicDiscription").val()=="")||($("#musicDiscription").val()==undefined)
		||($("#musicDuration").val()=="")||($("#musicDuration").val()==undefined)) {
			alert("Please fill in information");
			window.open('upload.jsp','_self');
		}
		else {
			alert("OK");
			window.open('music.jsp','_self');
		}
	})
})
$(document).ready(function() {
	$("#submit3").click(function() {
		//Judge whether the value in text is undefined or null
		if(($("#tvName").val()=="")||($("#tvName").val()==undefined)||
		($("#tvID").val()=="")||($("#tvID").val()==undefined)
		||($("#tvDiscription").val()=="")||($("#tvDiscription").val()==undefined)||
		($("#tvDuration").val()=="")||($("#tvDuration").val()==undefined)||
		($("#tvStudio").val()=="")||($("#tvStudio").val()==undefined)||
		($("#tvPremiered").val()=="")||($("#tvPremiered").val()==undefined)||
		($("#actorName1").val()=="")||($("#actorName1").val()==undefined)||
		($("#role1").val()=="")||($("#role1").val()==undefined)||
		($("#actorName2").val()=="")||($("#actorName2").val()==undefined)||
		($("#role2").val()=="")||($("#role2").val()==undefined)) {
		
			window.open('upload.jsp','_self');
		}
		else {
			alert("OK");
			window.open('tvShow_menu.jsp','_self')
		}
	})
})
function videoPreview(fileDom){
    //Judge whether support the FileReader
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("Please upload your facility");
    }
    //Obtain picture
    var file = fileDom.files[0];
    var imageType = /^video\//;
    //Judge whether it is a picture
    if (!imageType.test(file.type)) {
      
        return;
    }
    reader.readAsDataURL(file);
}

$(document).ready(function() {
	$("#sel").change(function() {
		//Obtain the value in select bar and show or hide table respectively
		var opt=$("#sel option:selected").val();
		if(opt=="movie") {
			$("#movieTable").fadeIn();
			//create a new div and give it an id
			var oMask = document.createElement("div");
			oMask.id = "mask";
			//add it to the body
			document.body.appendChild(oMask);
			$("#cancel1").click(function() {
				$("#movieTable").fadeOut();
				//remove the div
				$("#mask").remove();
			})
			
		}
		else if(opt=="music") {
			//Obtain the value in select bar and show or hide table respectively
			$("#musicTable").fadeIn();
			//create a new div and give it an id
			var oMask = document.createElement("div");
			oMask.id = "mask";
			//add it to the body
			document.body.appendChild(oMask);
			$("#cancel2").click(function() {
				$("#musicTable").fadeOut();
				//remove the div
				$("#mask").remove();
			})
		}
		else if(opt=="tv") {
			//Obtain the value in select bar and show or hide table respectively
			$("#tvTable").fadeIn();
			//create a new div and give it an id
			var oMask = document.createElement("div");
			oMask.id = "mask";
			//add it to the body
			document.body.appendChild(oMask);
			$("#cancel3").click(function() {
				$("#tvTable").fadeOut();
				//remove the div
				$("#mask").remove();
			})
		}
		else if(opt=="Choose") {
			$("#tvTable").fadeOut();
			$("#movieTable").fadeOut();
			$("#musicTable").fadeOut();
		}
	})
})