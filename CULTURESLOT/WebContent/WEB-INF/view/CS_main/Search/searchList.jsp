<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
</head>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
 <div id="searchSection">
 	<div class="search_box">
	 	<div class="searchResultBox">
		<h3>'${ search }' 단어를 포함한 검색 결과입니다.</h3>
		<h4>검색 결과(${ count })</h4>
		
		<hr>
		</div>
		<c:if test = "${ count == 0 }">
		<div class="searchResultBox">
			<div class="search_box_no">
				
					<h3>검색 결과가 없습니다.</h3>
			</div>
		</div>
		</c:if>
		<c:if test = "${ count != 0 }">
			<c:if test = "${ searchMusicCount != 0 }">
				<div class="searchResultBox">
					<h2>음악</h2>
			<c:if test="${musicsize==null }">		
				<c:forEach var = "searchMusic" items = "${ searchMusic }">
				<table class="result">
					<tr><td>	
						<div class="ImageBox"
							onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${searchMusic.year}&genre=${searchMusic.category}&title=${searchMusic.title}&num=${searchMusic.content_num }'">
							<input type="image" src="${searchMusic.title_image}" style="width:200px;height:200px;"/>
						</div>
					</td></tr>
					<tr><td class="title">
						<p class="title">
							<a href="/CULTURESLOT/CS_content/content.do?year=${searchMusic.year}&genre=${searchMusic.category}&title=${searchMusic.title}&num=${searchMusic.content_num }">
								<b>${searchMusic.title}</b><br/>
								${searchMusic.creator}</a>
						</p></td></tr>
				</table>
				</c:forEach>
			</c:if>
			<c:if test="${musicsize>6 }">
				<c:forEach var = "searchMusic" items = "${ searchMusic }" begin="1" end="6">
				<table class="result">
					<tr><td>	
						<div class="ImageBox"
							onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${searchMusic.year}&genre=${searchMusic.category}&title=${searchMusic.title}&num=${searchMusic.content_num }'">
							<input type="image" src="${searchMusic.title_image}" style="width:200px;height:200px;"/>
						</div>
					</td></tr>
					<tr><td class="title">
						<p class="title">
							<a href="/CULTURESLOT/CS_content/content.do?year=${searchMusic.year}&genre=${searchMusic.category}&title=${searchMusic.title}&num=${searchMusic.content_num }">
								<b>${searchMusic.title}</b><br/>
								${searchMusic.creator}</a>
						</p></td></tr>
				</table>
				</c:forEach>
				<a href="/CULTURESLOT/CS_main/searchMusic.do?search=${search }"><b>>>전체보기</b></a>
			</c:if>
		</div>
		</c:if>
		
		<c:if test = "${ searchMovieCount != 0 }">
		<div class="searchResultBox">
			<h2>영화</h2>
			<c:if test="${moviesize==null }">	
			<c:forEach var = "searchMovie" items = "${ searchMovie }">
			<table class="result">
				<tr><td>
					<div class="ImageBox"
						onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${ searchMovie.year }&genre=${ searchMovie.category }&title=${ searchMovie.title }&num=${searchMovie.content_num }'">
						<input type="image" src="${searchMovie.title_image}" style="width:200px;height:200px;"/>
					</div>
				</td></tr>
				<tr><td>
					<p class="title">
						<a href = "/CULTURESLOT/CS_content/content.do?year=${searchMovie.year}&genre=${searchMovie.category}&title=${searchMovie.title}&num=${searchMovie.content_num }"> 
						 	<b>${ searchMovie.title }</b><br/>
						 	${ searchMovie.creator }</a>
					</p>
				</td></tr>
			</table>	
			</c:forEach>
			</c:if>
			
			<c:if test="${moviesize>6 }">
				<c:forEach var = "searchMovie" items = "${ searchMovie }" begin="1" end="6">
				<table class="result">
					<tr><td>
						<div class="ImageBox"
							onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${ searchMovie.year }&genre=${ searchMovie.category }&title=${ searchMovie.title }&num=${searchMovie.content_num }'">
							<input type="image" src="${searchMovie.title_image}" style="width:200px;height:200px;"/>
						</div>
					</td></tr>
					<tr><td>
						<p class="title">
							<a href = "/CULTURESLOT/CS_content/content.do?year=${searchMovie.year}&genre=${searchMovie.category}&title=${searchMovie.title}&num=${searchMovie.content_num }"> 
							 	<b>${ searchMovie.title }</b><br/>
							 	${ searchMovie.creator }</a>
						</p>
					</td></tr>
				</table>	
				</c:forEach>
				<a href="/CULTURESLOT/CS_main/searchMovie.do?search=${search }"><b>>>전체보기</b></a>
			</c:if>
		</div>
		</c:if>
		
		<c:if test = "${ searchDramaCount != 0 }">
		<div class="searchResultBox">
			<h2>드라마</h2>
			<c:if test="${dramasize==null }">
			<c:forEach var = "searchDrama" items = "${ searchDrama }">
			<table class="result">
			<tr><td>
				<div class="ImageBox"
					onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${ searchDrama.year }&genre=${ searchDrama.category }&title=${ searchDrama.title }&num=${searchDrama.content_num }'">
					<input type="image" src="${searchDrama.title_image}" style="width:200px;height:200px;"/>
				</div>
			</td></tr>
			<tr><td>
				<p class="title">
					<a href = "/CULTURESLOT/CS_content/content.do?year=${ searchDrama.year }&genre=${ searchDrama.category }&title=${ searchDrama.title }&num=${searchDrama.content_num }">
					 	<b>${ searchDrama.title }</b><br/>
					 	${ searchDrama.creator }</a></p>
			</td></tr>
			</table>
			</c:forEach>
			</c:if>
			
			<c:if test="${dramasize>6 }">
			<c:forEach var = "searchDrama" items = "${ searchDrama }" begin="1" end="6">
			<table class="result">
			<tr><td>
				<div class="ImageBox"
					onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${ searchDrama.year }&genre=${ searchDrama.category }&title=${ searchDrama.title }&num=${searchDrama.content_num }'">
					<input type="image" src="${searchDrama.title_image}" style="width:200px;height:200px;"/>
				</div>
			</td></tr>
			<tr><td>
				<p class="title">
					<a href = "/CULTURESLOT/CS_content/content.do?year=${ searchDrama.year }&genre=${ searchDrama.category }&title=${ searchDrama.title }&num=${searchDrama.content_num }">
					 	<b>${ searchDrama.title }</b><br/>
					 	 ${ searchDrama.creator }</a></p>
			</td></tr>
			</table>
			</c:forEach>
			<a href="/CULTURESLOT/CS_main/searchDrama.do?search=${search }"><b>>>전체보기</b></a>
			</c:if>
		</div>
		</c:if>
		
		<c:if test = "${ searchAnimationCount != 0 }">
		<div class="searchResultBox">
			<h2>애니메이션</h2>
			<c:if test="${anisize==null }">
			<c:forEach var = "searchAnimation" items = "${ searchAnimation }">
			<table class="result">
			<tr><td>
				<div class="ImageBox"
					onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${ searchAnimation.year }&genre=${ searchAnimation.category }&title=${ searchAnimation.title }&num=${searchAnimation.content_num }'">
					<input type="image" src="${searchAnimation.title_image}" style="width:200px;height:200px;"/>
				</div>
			</td></tr>
			<tr><td>
				<p class="title">
					<a href = "/CULTURESLOT/CS_content/content.do?year=${ searchAnimation.year }&genre=${ searchAnimation.category }&title=${ searchAnimation.title }&num=${searchAnimation.content_num }"> 
						<b>${searchAnimation.title }</b><br/>
						${ searchAnimation.creator }</a></p>
			</td></tr>
			</table>
			</c:forEach>
			</c:if>
			
			<c:if test="${anisize>6 }">
			<c:forEach var = "searchAnimation" items = "${ searchAnimation }" begin="1" end="6">
			<table class="result">
			<tr><td>
				<div class="ImageBox"
					onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${ searchAnimation.year }&genre=${ searchAnimation.category }&title=${ searchAnimation.title }&num=${searchAnimation.content_num }'">
					<input type="image" src="${searchAnimation.title_image}" style="width:200px;height:200px;"/>
				</div>
			</td></tr>
			<tr><td>
				<p class="title">
					<a href = "/CULTURESLOT/CS_content/content.do?year=${ searchAnimation.year }&genre=${ searchAnimation.category }&title=${ searchAnimation.title }&num=${searchAnimation.content_num }"> 
						<b>${searchAnimation.title }</b><br/>
						${ searchAnimation.creator }</a></p>
			</td></tr>
			</table>
			</c:forEach>
			<a href="/CULTURESLOT/CS_main/searchAnimation.do?search=${search }"><b>>>전체보기</b></a>
			</c:if>
		</div>
		</c:if>
	</c:if>
	</div>
</div>
</body>
</html>