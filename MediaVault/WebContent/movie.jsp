<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Watching</title>
		
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
		<link rel="stylesheet" href="css/play.css">
		<link rel="stylesheet" href="css/Nav&skip.css">
	</head>
	
	<body>
	<nav class="topPart" role="navigation">
		<div class="TP">
			<h4 id="exit"><a href="Welcome.jsp">Exit</a> </h4>
			<div class="top-menu">
				<div class="row">
					<div >
						<div id="welcome">Welcome to our community</div>
					</div>
					<div >
						<ul>
							<li ><a href="tvShow_menu.jsp?page=1" >TVshow</a>
								<ul >
									<li><a href="tvShow_menu.jsp?type=comedy&page=1">Comedy</a></li>
									<li><a href="tvShow_menu.jsp?type=suspense&page=1" >Suspense</a></li>
									<li><a href="tvShow_menu.jsp?type=action&page=1" >Action</a></li>
									<li><a href="tvShow_menu.jsp?type=affectional&page=1"  >Affectional</a></li>
								</ul>
							</li>
							<li class="active" ><a href="movie_menu.jsp?page=1" >Movie</a>
									<ul>
									<li><a href="movie_menu.jsp?type=comedy&page=1">Comedy</a></li>
									<li><a href="movie_menu.jsp?type=suspense&page=1">Suspense</a></li>
									<li><a href="movie_menu.jsp?type=action&page=1">Action</a></li>
									<li><a href="movie_menu.jsp?type=affectional&page=1">Affectional</a></li>
								</ul>
							</li>
							<li ><a href="music.jsp?page=1">Music</a>
								<ul>
								<li><a href="music.jsp?type=rock&page=1">Rock</a></li>
								<li><a href="music.jsp?type=classical&page=1">Classic</a></li>
								<li><a href="music.jsp?type=blue&page=1">Blue</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<h4 id="upload"><a href="upload.jsp" style="float: right;">upload</a> </h4>
			</div>
		</div>
	</nav>
	<%
	
	String N =request.getParameter("name");
	String[] urls=database.Movie.getOneMovie(N);  //Get all needed data for making up the play page
	
	String cover=urls[0];
	String des=urls[1];
	String movie=urls[2];
	String name=urls[3];
	%>
	<div class="movieMD">
		<video controls="controls"  src="<%=movie %>"  poster="<%=cover %>" width="1060px" height="800px" >
			
		</video>
	</div>
	<div  style="margin: 20px 200px;" >
		<a href="<%=movie %>" download="<%=name %>"> 
			<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
		</a>
		
		<p style="font-size:larger">Introduction</p>
			
		<p id="introduction">"<%=des %>"</p>
	</div>
	</body>
</html>