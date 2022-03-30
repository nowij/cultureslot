<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 결과</title>
</head>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
 <div id="searchSection">
 	<div class="search_box">
	 	<div class="searchResultBox">
		<h3>'${ search }' 단어를 포함한 검색 결과입니다.</h3>
		<h4>검색 전체 결과(${ searchDramaCount })</h4>
		<hr>
		</div>
				<div class="searchResultBox">
					<h2>드라마</h2>
			<c:forEach var = "searchDrama" items = "${ searchDrama }">
			<table class="result">
				<tr><td>	
					<div class="ImageBox"
						onclick="javacript:window.location.href ='/CULTURESLOT/CS_content/content.do?year=${searchDrama.year}&genre=${searchDrama.category}&title=${searchDrama.title}&num=${searchDrama.content_num }'">
						<input type="image" src="${searchDrama.title_image}" style="width:200px;height:200px;"/>
					</div>
				</td></tr>
				<tr><td class="title">
					<p class="title">
						<a href="/CULTURESLOT/CS_content/content.do?year=${searchDrama.year}&genre=${searchDrama.category}&title=${searchDrama.title}&num=${searchDrama.content_num }">
							<b>${searchDrama.title}</b><br/>
							${searchDrama.creator}</a>
					</p></td></tr>
			</table>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>