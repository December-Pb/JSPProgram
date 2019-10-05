
/*This function is used to let the log in part faded out*/
$(document).ready(function() {
				$("#LogIn").click(function() {
   				$("#welcome").fadeOut();
   				$("#log").fadeIn();
   				});
			});

/*This is used to let the login part fade in*/
$(document).ready(function() {
				$("#cancel").click(function() {
					$("#log").fadeOut();
					$("#welcome").fadeIn();
				})
			})

/* This is the log function*/
$(document).ready(function() {
	
				$("#logIn").click(function() {
					var id=$("#UserID").val();
					var password=$("#Password").val();
					
					$.ajax({
					    type: "GET",
					    url: "Login",
					    data: {
					    	id:id,
					    	password:password
					    },
					    dataType: "text",
					    success: function (res) {
					    	alert(res.toString());
					        if(res.toString()=="OK"){
					        	window.open('movie_menu.jsp?page=1','_self');
					        }
					        else{
					        	alert("Password error or user not exist, please correct your password. Or you can register as a new user");
					        }
					    },
					    error: function () {
					        alert("error");
					    }
					});

				})
			})

//Register
$(document).ready(function() {
		$("#signUp").click(function() {
				var id=$("#UserID").val();
				var password=$("#Password").val();

				if(id.length==0||id.length>10){
					alert("Your user name's length is no more than 10 and can't be empty!");
				}
				else if(password.length==0||password.length>18){
					alert("Your password's length is no more than 18 and can't be empty!");
				}
				else{
				$.ajax({
				    type: "GET",
				    url: "Register",
				    data: {
				    	id:id,
				    	password:password
				    },
				    dataType: "text",
				    success: function (res) {
				    	alert(res.toString());
				        if(res.toString()=="OK"){
				        	window.open('movie_menu.jsp?page=1','_self');
				        }
				        else{
				        	alert("Sorry, this ID has been used, please try another name.");
				        }
				    },
				    error: function () {
				        alert("error");
				    }
				});
			}
	})
})

