<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Genre Select</title>
 <body>
  <%@ include file="/etc/mainTop.jsp" %>
 <div class="title_box">
 	<h1 class="title">${year}년</h1>
 </div>
 <div id = "selectGenreSection">
 	<div class = "box">
		<ul class="genre">
			<li class="genre">
				<div class="GenreBox"
					onclick="javascript:window.location.href='../CS_content/genreList.do?year=${year }&genre=음악'">
						<p class="genre">음악</p>
				</div>
			</li>
			<li class="genre">
				<div class="GenreBox" 
					onclick="javascript:window.location.href='../CS_content/genreList.do?year=${year }&genre=영화'">
						<p class="genre">영화</p>
				</div>
			</li>
		</ul>
	</div>
	<div class = "box">
		<ul class="genre">
			<li class="genre">
				<div class="GenreBox" 
					onclick="javascript:window.location.href='../CS_content/genreList.do?year=${year }&genre=드라마'">
						<p class="genre">드라마</p>
				</div>
			</li>
			<li class="genre">
				<div class="GenreBox" 
					onclick="javascript:window.location.href='../CS_content/genreList.do?year=${year }&genre=애니메이션'">
						<p class="genre">만화/애니</p>
				</div>
			</li>
		</ul>
	</div>
</div>
 </body>
</html>
    