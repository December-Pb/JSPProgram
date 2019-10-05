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
						<div id="welcome">Welcome to our community</a></div>
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
		String[] url=database.PreLoadData.getData(page_type, page_num, "url", "movie");
		String[] name=database.PreLoadData.getData(page_type, page_num, "name", "movie");
		String[] cover=database.PreLoadData.getData(page_type, page_num, "cover", "movie");
		String[] type=database.PreLoadData.getData(page_type, page_num, "genre", "movie");
		
		
		boolean islastpage=database.PreLoadData.isLastPage(page_type, page_num, "movie");
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
			else{
				int current=Integer.valueOf(page_num).intValue();
				if(current!=1){
				former=String.valueOf(current-1);
				next=String.valueOf(current+1);
				}
				else{
					former="1";
					next="2";
				}
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
							<a href="movie.jsp?name=<%=name[0] %>" id="a11" ><img src="<%=cover[0] %>"  class="pic" id="pic11"/>	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[0] %>" id="a11"><p class="mediaName" ><%=name[0] %></p></a>
							<a href="<%= url[0] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"   src="images/delete.jpg" class="delete"  />
							<p id="type11"><%=type[0] %></p>
						</div>
					</div>
					<div class="child" id="c12">
						<div>
							<a href="movie.jsp?name=<%=name[1] %>" id="a12" ><img src="<%=cover[1] %>"  class="pic" id="pic12"/>	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[1] %>" id="a12"><p class="mediaName"><%=name[1] %></p></a>
							<a href="<%= url[1] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type12"><%=type[1] %> </p>
						</div>
					</div>
					<div class="child" id="c13">
						<div>
							<a href="movie.jsp?name=<%=name[2] %>" id="a13" ><img src="<%=cover[2] %>"  class="pic" id="pic13"/>	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[2] %>" id="a13"><p class="mediaName"><%=name[2] %></p></a>
							<a href="<%= url[2] %>" download="<%=name[0] %>">  
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type13"> <%=type[2] %></p>
						</div>
					</div>
					<div class="child" id="c14">
						<div>
							<a  href="movie.jsp?name=<%=name[3] %>" id="a14" ><img src="<%=cover[3] %>"  class="pic" id="pic14"/>	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[3] %>" id="a14"><p  class="mediaName"><%=name[3] %></p></a>
							<a href="<%= url[3] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type14"> <%=type[3] %></p>
						</div>
					</div>
			
		
					<div class="child" id="c21">
						<div>
							<a  href="movie.jsp?name=<%=name[4] %>"  id="a21"><img src="<%=cover[4] %>"  class="pic" id="pic21"/>	
						</div>
						<div>
							<a href="movie.jsp?name=<%=name[4] %>" id="a21"><p class="mediaName"><%=name[4] %></p></a>
							<a href="<%= url[4] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type21"> <%=type[4] %> </p>
						</div>
					</div>
					<div class="child" id="c22">
						<div>
							<a  href="movie.jsp?name=<%=name[5] %>" id="a22" ><img src="<%=cover[5] %>"  class="pic" id="pic2"/>	
						</div>
						<div class="key_div">
							<a  href="movie.jsp?name=<%=name[5] %>" id="a22"><p class="mediaName"><%=name[5] %></p></a>
							<a href="<%= url[5] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type22"> <%=type[5] %> </p>
						</div>
					</div>
					<div class="child" id="c23">
						<div>
							<a  href="movie.jsp?name=<%=name[6] %>" id="a23"><img src="<%=cover[6] %>" class="pic" id="pic23" />	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[6] %>" id="a23"><p  class="mediaName" ><%=name[6] %></p></a>
							<a href="<%= url[6] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type23"> <%=type[6] %> </p>
						</div>
					</div>
					<div class="child" id="c24">
						<div>
							<a  href="movie.jsp?name=<%=name[7] %>"  id="a24"><img src="<%=cover[7] %>"  class="pic" id="pic24" />	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[7] %>" id="a24"><p  class="mediaName" ><%=name[7] %></p></a>
							<a href="<%= url[7] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type24"><%=type[7] %></p>
						</div>
					</div>
					
					<div class="child" id="c31">
						<div>
							<a href="movie.jsp?name=<%=name[8] %>"  id="a31"><img src="<%=cover[8] %>"  class="pic" id="pic31" />	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[8] %>"  id="a31"><p  class="mediaName"><%=name[8] %></p></a>
							<a href="<%= url[8] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type31"><%=type[8] %> </p>
						</div>
					</div>
					<div class="child" id="c32">
						<div>
							<a  href="movie.jsp?name=<%=name[9] %>" id="a32" ><img src="<%=cover[9] %>" class="pic" id="pic32" />	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[9] %>" id="a32"><p class="mediaName"><%=name[9] %></p></a>
							<a href="<%= url[9] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type32"><%=type[9] %></p> 
						</div>
					</div>
					<div class="child" id="c33">
						<div>
							<a href="movie.jsp?name=<%=name[10] %>" id="a33"><img src="<%=cover[10] %>"  class="pic" id="pic33" />	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[10] %>" id="a33"><p class="mediaName"><%=name[10] %></p></a>
							<a href="<%= url[10] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg"class="delete"/>
							<p id="type33"><%=type[10] %> </p>
						</div>
					</div>
					<div class="child" id="c34">
						<div>
							<a href="movie.jsp?name=<%=name[11] %>" id="a34" ><img src="<%=cover[11] %>" class="pic" id="pic34" />	
						</div>
						<div class="key_div">
							<a href="movie.jsp?name=<%=name[11] %>" id="a34"><p class="mediaName" ><%=name[11] %></p></a>
							<a href="<%= url[11] %>" download="<%=name[0] %>"> 
							<input  type="image"    src="images/download.jpg" class="down"/>
							</a>
							<input  type="image"    class="delete"  src="images/delete.jpg" class="delete"/>
							<p id="type34"><%=type[11] %></p>
						</div>
					</div>  
				
				</div>
		
	</div>
		<ul class="UL">
					<div class="tres"> 
						<li>
							
							<a class="former" href="movie_menu.jsp?<%=page_type %>&page=<%=former %>">&lt; </a>
						</li>
						<li> 
							<div class="jump">
								Jump to <input type="text" value="1" id="text"> page  <input type="button" value="skip" id="skip" class="skip"/>
							</div>
						</li>
						<li>
						<a class="next" href="movie_menu.jsp?<%=page_type %>&page=<%=next %>"> &gt; </a>
						</li>
						        
					</div> 
		</ul>
			
</body>
</html>