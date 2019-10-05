<%@page import="database.Music"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript"> 
	
		document.onreadystatechange = function() {
			if (document.readyState == "complete") {
				$(".play").each(function(){
					var src=$(this)[0].src;
				
					if(src.substr(src.length-4,4)=="null"){
						$(this).parents(".child").remove();
					}
				})
				
			}
			};
	</script>
		<link rel="stylesheet" href="css/music.css">
		<link rel="stylesheet" href="css/Nav&skip.css">
		<title>Music</title>
	</head>
	<body background="images/music.png">
		<nav class="topPart" role="navigation">
			<div class="TP">
				<h4 id="exit"><a href="Welcome.jsp">Exit</a> </h4>
				<div class="top-menu">
		
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
							<li  ><a href="movie_menu.jsp?page=1" >Movie</a>
									<ul>
									<li><a href="movie_menu.jsp?type=comedy&page=1">Comedy</a></li>
									<li><a href="movie_menu.jsp?type=suspense&page=1">Suspense</a></li>
									<li><a href="movie_menu.jsp?type=action&page=1">Action</a></li>
									<li><a href="movie_menu.jsp?type=affectional&page=1">Affectional</a></li>
								</ul>
							</li>
							<li class="active"><a href="music.jsp?page=1">Music</a>
								<ul>
								<li><a href="music.jsp?type=rock&page=1">Rock</a></li>
								<li><a href="music.jsp?type=classical&page=1">Classic</a></li>
								<li><a href="music.jsp?type=blue&page=1">Blue</a></li>
								</ul>
							</li>
						</ul>
					</div>
		
				<h4 id="upload"><a href="upload.jsp" style="float: right;">upload</a> </h4>
			</div>
		</div>
	</nav>
	
	<div class="MD" >
		<div class="content">
		<%@page import="java.util.ArrayList"%>
		
		<%
		
		String page_type=request.getParameter("type");
		String page_num=request.getParameter("page");
		String[] url=database.PreLoadData.getData(page_type, page_num, "url", "music");
		String[] name=database.PreLoadData.getData(page_type, page_num, "name", "music");
		
		boolean islastpage=database.PreLoadData.isLastPage(page_type, page_num, "music");
		String former=null;
		String next=null;
		
		
		//It runs when current page is the last page 
		if(islastpage==true){
				 //It means this is the default page and with no page number in url, or it is the first page as well as the last page
			if(page_num==null){
				former="1";
				next="1";
			}
			else{
				if(Integer.parseInt(page_num)==1){
					former="1";
					next="1";
				}
				else{
				int current=Integer.valueOf(page_num).intValue();
				former=String.valueOf(current-1);
				next=page_num;
				}
			}
		}
		else {
			if(page_num==null){
				former="1";
				next="2";
			}
		}
		if(page_type==null){
			page_type="";
		}
		else{
			page_type="type="+page_type;
		}
		%>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p  class="musicName" style="float: left; margin: 5px 0;"><%=name[0] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[0] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[0] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
				<div class="child" style="width:1000px;height: 40px;">
				
					<p  class="musicName" style="float: left; margin: 5px 0;"><%=name[1] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[1] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[1] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p  class="musicName" style="float: left; margin: 5px 0;"><%=name[2] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[2] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[2] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p  class="musicName" style="float: left; margin: 5px 0;"><%=name[3] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[3] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[3] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p class="musicName"  style="float: left; margin: 5px 0;"><%=name[4] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[4] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[4] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p  class="musicName" style="float: left; margin: 5px 0;"><%=name[5] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[5] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[5] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p  class="musicName" style="float: left; margin: 5px 0;"><%=name[6] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[6] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"></audio>
					
					<a href="<%=url[6] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p class="musicName"  style="float: left; margin: 5px 0;"><%=name[7] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[7] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[7] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p class="musicName"  style="float: left; margin: 5px 0;"><%=name[8] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[8] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[8] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p class="musicName"  style="float: left; margin: 5px 0;"><%=name[9] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[9] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[9] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p  class="musicName" style="float: left; margin: 5px 0;"><%=name[10] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[10] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[10] %>" download="Secret Garden" style="float: right;"> 
						<input  type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
			<div class="child" style="width:1000px;height: 40px;">
				
					<p class="musicName"  style="float: left; margin: 5px 0;"><%=name[11] %></p>
					<input  type="image"    class="delete"  src="images/delete.jpg" width="27px" height="27px" style="float: right;"/>
					<audio controls="controls" class="play" src="<%=url[11] %>" style="float: right; width: 500px;height: 35px; margin: 0 50px;"> </audio>
					
					<a href="<%=url[11] %>" download="Secret Garden" style="float: right;"> 
						<input  class="download" type="image"    src="images/download.jpg" width="30px" height="30px" style="float: right;"/>
					</a>
				
			</div>
		
		
		</div>
	</div>
		<ul class="UL">
					<div class="tres"> 
						<li>
							
							<a href="music.jsp?<%=page_type %>&page=<%=former %>">&lt; </a>
						</li>
						<li> 
							<div class="jump">
								Jump to <input type="text" value="1" id="text"> page  <input type="button" value="skip" id="skip" class="skip"/>
							</div>
						</li>
						<li>
						<a href="music.jsp?<%=page_type %>&page=<%=next %>"> &gt; </a>
						</li>
						        
					</div> 
				</ul>
	
	</body>
</html>