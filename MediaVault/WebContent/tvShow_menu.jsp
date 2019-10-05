<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>Bilibili Videos Community</title>
	
	
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript"> 
	document.onreadystatechange = function() {
	if (document.readyState == "complete") {
		$(".pic").each(function(){
			var src=$(this)[0].src;
		
			if(src.substr(src.length-4,4)=="null"){
				$(this).parents(".child").remove();
			}
		})
		
	}
	};
	</script>
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="css/Nav&skip.css">


</head>

<body>
	<nav class="topPart" role="navigation">
		<div class="TP">
			<h4 id="exit"><a href="Welcome.jsp">Exit</a> </h4>
			<div class="top-menu">
		
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
		
				<h4 id="upload"><a href="upload.jsp" style="float: right;">upload</a> </h4>
			</div>
		</div>
	</nav>

	
	<div class="MD" id="total">
		<div class="content">
			<%@page import="java.util.ArrayList"%>
		
		<%
		
			String page_type=request.getParameter("type");
			String page_num=request.getParameter("page");
			String[][] data=database.PreLoadData.getTV(page_type, page_num);
			
			boolean islastpage=database.PreLoadData.isLastPage(page_type, page_num, "tv");
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
				 <div class="child" id="c11" >
						<div  >
							<a href="tv.jsp?name=<%=data[1][0] %>&episode=<%=data[4][0] %>" id="a11" ><img src="<%=data[2][0] %>"  class="pic" id="pic11"/>	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][0] %>&episode=<%=data[4][0] %>" id="a11"><p class="mediaName"><%=data[1][0] %></p></a>
							<a href="<%= data[0][0] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"   src="images/delete.jpg" class="delete"  />
							<p id="type11"><%=data[3][0] %></p>
						</div>
					</div>
					<div class="child" id="c12">
						<div>
							<a href="tv.jsp?name=<%=data[1][1] %>&episode=<%=data[4][1] %>" id="a12" ><img src="<%=data[2][1] %>"  class="pic" id="pic12"/>	
						</div>
					<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][1] %>&episode=<%=data[4][1] %>" id="a12"><p  class="mediaName" ><%=data[1][1] %></p></a>
							<a href="<%= data[0][1] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type12"><%=data[3][1] %> </p>
						</div>
					</div>
					<div class="child" id="c13">
						<div>
							<a href="tv.jsp?name=<%=data[1][2] %>&episode=<%=data[4][2] %>" id="a13" ><img src="<%=data[2][2] %>"  class="pic" id="pic13"/>	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][2] %>&episode=<%=data[4][2] %>" id="a13"><p  class="mediaName"><%=data[1][2] %></p></a>
							<a href="<%= data[0][2] %>" download="<%=data[1][0] %>">  
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type13"> <%=data[3][2] %></p>
						</div>
					</div>
					<div class="child" id="c14">
						<div>
							<a  href="tv.jsp?name=<%=data[1][3] %>&episode=<%=data[4][3] %>" id="a14" ><img src="<%=data[2][3] %>"  class="pic" id="pic14"/>	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][3] %>&episode=<%=data[4][3] %>" id="a14"><p class="mediaName"><%=data[1][3] %></p></a>
							<a href="<%= data[0][3] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type14"> <%=data[3][3] %></p>
						</div>
					</div>
			
		
					<div class="child" id="c21">
						<div>
							<a  href="tv.jsp?name=<%=data[1][4] %>&episode=<%=data[4][4] %>"  id="a21"><img src="<%=data[2][4] %>"  class="pic" id="pic21"/>	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][4] %>&episode=<%=data[4][4] %>" id="a21"><p class="mediaName"><%=data[1][4] %></p></a>
							<a href="<%= data[0][4] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type21"> <%=data[3][4] %> </p>
						</div>
					</div>
					<div class="child" id="c22">
						<div>
							<a  href="tv.jsp?name=<%=data[1][5] %>&episode=<%=data[4][5] %>" id="a22" ><img src="<%=data[2][5] %>"  class="pic" id="pic2"/>	
						</div>
						<div class="key_div">
							<a  href="tv.jsp?name=<%=data[1][5] %>&episode=<%=data[4][5] %>" id="a22"><p class="mediaName"><%=data[1][5] %></p></a>
							<a href="<%= data[0][5] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type22"> <%=data[3][5] %> </p>
						</div>
					</div>
					<div class="child" id="c23">
						<div>
							<a  href="tv.jsp?name=<%=data[1][6] %>&episode=<%=data[4][6] %>" id="a23"><img src="<%=data[2][6] %>" class="pic" id="pic23" />	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][6] %>&episode=<%=data[4][6] %>" id="a23"><p class="mediaName" ><%=data[1][6] %></p></a>
							<a href="<%= data[0][6] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type23"> <%=data[3][6] %> </p>
						</div>
					</div>
					<div class="child" id="c24">
						<div>
							<a  href="tv.jsp?name=<%=data[1][7] %>&episode=<%=data[4][7] %>"  id="a24"><img src="<%=data[2][7] %>"  class="pic" id="pic24" />	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][7] %>&episode=<%=data[4][7] %>" id="a24"><p class="mediaName" ><%=data[1][7] %></p></a>
							<a href="<%= data[0][7] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type24"><%=data[3][7] %></p>
						</div>
					</div>
					
					<div class="child" id="c31">
						<div>
							<a href="tv.jsp?name=<%=data[1][8] %>&episode=<%=data[4][8] %>"  id="a31"><img src="<%=data[2][8] %>"  class="pic" id="pic31" />	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][8] %>&episode=<%=data[4][8] %>"  id="a31"><p class="mediaName"><%=data[1][8] %></p></a>
							<a href="<%= data[0][8] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type31"><%=data[3][8] %> </p>
						</div>
					</div>
					<div class="child" id="c32">
						<div>
							<a  href="tv.jsp?name=<%=data[1][9] %>&episode=<%=data[4][9] %>" id="a32" ><img src="<%=data[2][9] %>" class="pic" id="pic32" />	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][9] %>&episode=<%=data[4][9] %>" id="a32"><p class="mediaName"><%=data[1][9] %></p></a>
							<a href="<%= data[0][9] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type32"><%=data[3][9] %></p> 
						</div>
					</div>
					<div class="child" id="c33">
						<div>
							<a href="tv.jsp?name=<%=data[1][10] %>&episode=<%=data[4][10] %>" id="a33"><img src="<%=data[2][10] %>"  class="pic" id="pic33" />	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][10] %>&episode=<%=data[4][10] %>" id="a33"><p class="mediaName"><%=data[1][10] %></p></a>
							<a href="<%= data[0][10] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type33"><%=data[3][10] %> </p>
						</div>
					</div>
					<div class="child" id="c34">
						<div>
							<a href="tv.jsp?name=<%=data[1][11] %>&episode=<%=data[4][11] %>" id="a34" ><img src="<%=data[2][11] %>" class="pic" id="pic34" />	
						</div>
						<div class="key_div">
							<a href="tv.jsp?name=<%=data[1][11] %>&episode=<%=data[4][11] %>" id="a34"><p  class="mediaName" ><%=data[1][11] %></p></a>
							<a href="<%= data[0][11] %>" download="<%=data[1][0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg" class="delete"/>
							<p id="type34"><%=data[3][11] %></p>
						</div>
					</div>  
				
				</div>	
		
	</div>
			<ul class="UL">
					<div class="tres"> 
						<li>
							
							<a href="tvShow_menu.jsp?<%=page_type %>&page=<%=former %>">&lt; </a>
						</li>
						<li> 
							<div class="jump">
								Jump to <input type="text" value="1" id="text"> page  <input type="button" value="skip" id="skip" class="skip"/>
							</div>
						</li>
						<li>
						<a href="tvShow_menu.jsp?t<%=page_type %>&page=<%=next %>"> &gt; </a>
						</li>
						        
					</div> 
		</ul>
	
	
</body>
</html>