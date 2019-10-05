<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Log in</title>
		<link href="css/style.css" rel="stylesheet"/>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div id="welcome">
			<div id="wel" align="top">WELCOME TO OUR WEBSITE</div>
			<div id="tag" align="center">We provide lots of services including TV shows<br>Moives and Musics.</div>
			<div align="center">
				<br><button id="LogIn">Log in</button>
			</div>
		</div>
		<div id="log" style="display: none;">
			<div id="header" align="center">
				<h1>Log In Interface</h1>
			</div>
			<div id="table" align="center">
				<table>
					<tr>
						<th>
							  User ID:
						</th>
						<th>  </th>
						<th>
							<input type="text" name="UserID" id="UserID" value="" placeholder="User name">
						</th>
					</tr>
					<tr>
						<th>
							  Password:
						</th>
						<th>  </th>
						<th>
							<input type="password" name="Password" id="Password" value="" placeholder="Password">
						</th>
					<tr>
						<th><br></th>
						<th><br></th>
					<tr>
						<th>
							<button id="logIn">Log in</button> 
						</th>
						<th>
							<button id="cancel">Cancel</button>
						</th>
						<th>
							<button id="signUp">Register</button>
						</th>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html> 

