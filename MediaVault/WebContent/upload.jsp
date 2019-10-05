<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/upload.js"></script>
<link rel="stylesheet" href="css/upload.css">
<link rel="stylesheet" href="css/Nav&skip.css">
<title>Upload</title>
</head>
<body>
	<form id="upload" action="upload" method="post"
		enctype="multipart/form-data">
		<nav class="topPart" role="navigation">
		<div class="TP">
			<h4 id="exit">
				<a href="Welcome.jsp">Exit</a>
			</h4>
			<div class="top-menu">
				<div>
					<div id="welcome">
						Welcome to our community
					</div>
				</div>
				<div>
					<ul>
						<li><a href="tvShow_menu.jsp">TVshow</a>
							<ul>
								<li><a href="tvShow_menu.jsp?type=comedy">Comedy</a></li>
								<li><a href="tvShow_menu.jsp?type=suspense">Suspense</a></li>
								<li><a href="tvShow_menu.jsp?type=action">Action</a></li>
								<li><a href="tvShow_menu.jsp?type=affectional">Affectional</a></li>
							</ul></li>
						<li><a href="movie_menu.jsp">Movie</a>
							<ul>
								<li><a href="movie_menu.jsp?type=comedy">Comedy</a></li>
								<li><a href="movie_menu.jsp?type=suspense">Suspense</a></li>
								<li><a href="movie_menu.jsp?type=action">Action</a></li>
								<li><a href="movie_menu.jsp?type=affectional">Affectional</a></li>
							</ul></li>
						<li><a href="music.jsp">Music</a>
							<ul>
								<li><a href="music.jsp?type=rock">Rock</a></li>
								<li><a href="music.jsp?type=classic">Classic</a></li>
								<li><a href="music.jsp?type=blue">Blue</a></li>
							</ul></li>
						<div align="right">
							<select id="sel" name="sel">
								<option value="null">Choose</option>
								<option value="movie" id="movie">movie</option>
								<option value="tv" id="tv">tv</option>
								<option value="music" id="music">music</option>
							</select>
						</div>
						</li>
					</ul>
				</div>
			</div>

		</div>
		</nav>
		<div class="bottom">
				<div id="movieTable" style="display: none">
					<table border="1">
						<tr>
							<th>The title</th>
							<td><input type="text" name="movieName" id="movieName"
								value="" style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The genre</th>
							<td align="center"><select id="movieSelect"
								name="movieSelect">
									<option value="comedy">Comedy</option>
									<option value="suspense">Suspense</option>
									<option value="action">action</option>
									<option value="affectional">affectional</option>
							</select></td>
						</tr>
						<tr>
							<th>Summary</th>
							<td>
								<textarea name="movieDiscription" id="movieDiscription"  style="width: 98.5%; height: 100%;">
								</textarea>
							</td>
						</tr>
						<tr>
							<th>Rating</th>
							<td align="center"><select id="movieRating"
								name="movieRating">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select></td>
						</tr>
						<tr>
							<th>Duration</th>
							<td><input type="text" name="movieDuration" value=""
								id="movieDuration" style="width: 100%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>Cover</th>
							<td><img id="moviePreview" width="200" height="200" /> <input
								type="file" name="movieFile" id="movieFile"
								onchange="movieImgPreview(this)" /></td>
						</tr>
						<tr>
							<th>File</th>
							<td><input type="file" name="movieF" id="movieF"
								onchange="videoPreview(this)" style="width: 100%; height: 100%;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="submitButton1" align="center">
									<input type="submit" id="submit1" value="submit" /> <input
										type="button" id="cancel1" value="cancel" />
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div id="tvTable" style="display: none">
					<table border="1">
						<tr>
							<th>The title</th>
							<td><input type="text" name="tvName" value="" id="tvName"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>Episode</th>
							<td><input type="text" name="tvID" value="" id="tvID"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The genre</th>
							<td align="center"><select id="tvSelect" name="tvSelect">
									<option value="comedy">Comedy</option>
									<option value="suspense">Suspense</option>
									<option value="action">action</option>
									<option value="affectional">affectional</option>
							</select></td>
						</tr>
						<tr>
							<th>Summary</th>
							<td><textarea name="tvDiscription" id="tvDiscription" style="width: 98.5%; height: 100%;"></textarea></td>
						</tr>
						<tr>
							<th>Rating</th>
							<td align="center"><select id="tvRating" name="tvRating">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select></td>
						</tr>
						<tr>
							<th>Duration</th>
							<td><input type="text" name="tvDuration" value=""
								id="tvDuration" style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>Studio</th>
							<td><input type="text" name="tvStudio" value=""
								id="tvStudio" style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>Premiered</th>
							<td><input type="text" name="tvPremiered" value=""
								id="tvPremiered" style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The first actor's name</th>
							<td><input type="text" name="actorName1" id="actorName1"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The first actor's role</th>
							<td><input type="text" name="role1" id="role1"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The first actor's picture</th>
							<td><input type="file" name="file1" id="file1"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The second actor's name</th>
							<td><input type="text" name="actorName2" id="actorName2"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The second actor's role</th>
							<td><input type="text" name="role2" id="role2"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The Cover</th>
							<td><input type="file" name="file2" id="file2"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>The File</th>
							<td><input type="file" name="file3" id="file3"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="submitButton3" align="center">
									<input type="submit" id="submit3" value="submit" /> <input
										type="button" id="cancel3" value="cancel" />
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div id="musicTable" style="display: none">
					<table border="1">
						<tr>
							<th>The title</th>
							<td><input type="text" name="musicName" id="musicName"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<th>Summary</th>
							<td>	
								<textarea name="musicDiscription" id="musicDiscription" style="width: 98.5%; height: 100%;"></textarea>
							</td>
						</tr>
						<tr>
							<th>Genre</th>
							<td align="center"><select id="musicDuration"
								name="musicDuration">
									<option value="blue">blue</option>
									<option value="rock">rock</option>
									<option value="classical">classical</option>
							</select></td>
						</tr>
						<tr>
							<th>Cover</th>
							<td><img id="musicPreview" width="200" height="200" /> <input
								type="file" name="file" id="file"
								onchange="musicImgPreview(this)" /></td>
						</tr>
						<tr>
							<th>File</th>
							<td><input type="file" name="musicF" id="musicF"
								onchange="videoPreview(this)"
								style="width: 98.5%; height: 100%;" /></td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="submitButton2" align="center">
									<input type="submit" id="submit2" value="submit" /> <input
										type="button" id="cancel2" value="cancel" />
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
	</form>
	<div class="footer" align="center">
	<div class="left box">
	<h3 class="title">Before upload you need to know:</h3>
		<ul class="help-menu" style="list-style-type:none">
			<li>
				<span class="dot"></span>
				<span>
					When you upload the media, that means you have already agreed with the 
					<a class="protocal-link link" href="https://passport.bilibili.com/register/licence"
					target="_blank">the upload agreement</a>, please don't upload the medias which are against the government
				</span>
			</li>
			<li>
				<span class="dot"></span>
				<span>Please upload the video which is less than 2 GB</span>
			</li>
			<li>
				<span>Please make the video rate bit under 1800kbps, the music rate bit under 192kbps, or it will be compressed by system again</span>
			</li>
		</ul>
	</div>
	<div class="right box">
		<div class="tool-row">
			<h3>The compress tool</h3>
			<ul style="list-style-type:none">
				<li>
					<span class="dot"><a class="tool-btn" href="http://dl.pconline.com.cn/download/405230.html">Click here</a></span>
				</li>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>