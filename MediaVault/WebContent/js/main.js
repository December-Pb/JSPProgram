
/*Go back to the welcome page*/
$(document).ready(function() {
				$("#exit").click(function() {
   					window.open('Welcome.jsp','_self')
   				});
			});


$(function(){
	$(".delete").live("click",function(){ 
		var url;
		var tName;
		var fName;
		
		if($(this).parents(".child").children().attr("tagName")=="DIV"){
			
			url=$(this).parents(".child").children(".key_div").children("a").attr("href");
			if(url.substring(0,2)==="tv"){
				tName="tv"
				var list=url.split("=");
				fName=list[1].split("&")[0];
			}
			else if(url.substring(0,2)==="mo"){
				tName="movie";
				fName=url.split("=")[1];
			
			}
			else{
				alert("ERROR");
			}
		}
			
		else{
			url=$(this).parents(".child").children(".musicName").text();
			tName="music";
			fName=$(this).parents(".child").children(".musicName").text();
			
		}
		
	
		
		$.ajax({
		    type: "GET",
		    url: "Delete",
		    data: {
		    	name:fName,
		    	table_name:tName
		    },
		    dataType: "text",
		    success: function (res) {
		        alert(res);
		    },
		    error: function () {
		        alert("error");
		    }
		});
			$(this).parents(".child").remove();
	});         
});



$(function(){
	$(".skip").live("click",function(){ 
		var url=$(this).parents(".tres").children("li").children("a").attr("href").split("page")[0];
		var target_page=$("#text").val();
		
			$.ajax({
			    type: "GET",
			    url: "Skip",
			    data: {
			    	url:url,
			    	pagenum:target_page
			    },
			    dataType: "text",
			    success: function (res) {
			    	 if(res.toString()=="OK"){
				        	window.open(url+"page="+target_page,'_self');
				        }
				        else{
				        	alert("Out of range!");
				        }
			    },
			    error: function () {
			        alert("error");
			    }
			});
	
	}); 
});
