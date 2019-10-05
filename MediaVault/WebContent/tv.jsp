<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java"  import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Watching</title>
		
			<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		
		<link rel="stylesheet" href="css/Nav&skip.css">
		<link rel="stylesheet" href="css/play.css">
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
							<li class="active"><a href="tvShow_menu.jsp?page=1" >TVshow</a>
								<ul >
									<li><a href="tvShow_menu.jsp?type=comedy&page=1">Comedy</a></li>
									<li><a href="tvShow_menu.jsp?type=suspense&page=1" >Suspense</a></li>
									<li><a href="tvShow_menu.jsp?type=action&page=1" >Action</a></li>
									<li><a href="tvShow_menu.jsp?type=affectional&page=1"  >Affectional</a></li>
								</ul>
							</li>
							<li  ><a href="movie_menu.jsp?page=1" >Movie</a>
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
	
	String N=request.getParameter("name");
	String episode=request.getParameter("episode");
	String[] datas=database.TV.getPlayPage(N,episode);
	
	String cover=datas[0];
	String summary=datas[1];
	String url=datas[2];
	
	
	ArrayList<String> episodes=database.TV.getEpisodesList(N);
	
	%>
	<div class="tvMD" >
		<div  style="float: left; width: 15%; padding: 60px 0;">
			<ul>
			<% 
			for(int i=0; i<episodes.size(); i++) {
			  String a="<li ><a href=\"tv.jsp?name="+N+"&episode="+episodes.get(i)+"\">episode:"+episodes.get(i)+"</a></li>";
			  out.println(a);
			}
			%>
			</ul>
		</div>
	
		<div  style="float:left; width:85%;">
			<video id="v1" controls="controls" width="1060px" height="800px" src="<%=url %>"  poster="<%=cover %>>">
			</video>
		</div>
	</div>
	
	<div  style="margin: 20px 200px;" >
		
		<a href="<%=url %>" download="<%=N %>>" onclick="fuc()" > 
			<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
		</a>
		<p style="font-size:larger">Introduction</p>
			
		<p id="introduction">"<%=summary %>"</p>
	</div>

	</body>
</html>