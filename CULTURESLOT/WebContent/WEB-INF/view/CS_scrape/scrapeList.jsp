<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE : 나의 스크랩</title>
<style>
	#scrapeList {
		width: 40%;
		margin: 0 auto;
		font-family: '나눔바른고딕';
	}
	#scrapeList h3{
		margin:30 auto;
		font-size:20pt;
	}
	#scrapeList p{
		margin:0 auto;
		margin-top:50px;
		text-align:center;
	}
	#scrapeList table {
		margin:0 auto;
		margin-top: 50px;
		text-align:center;
	}
	#scrapeList tb{
		height:40px;
	}
	#scrapeList td.cate {
		width: 100px;
		height:30px;
		font-weight:bold;
		text-align:center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
		border-radius:3px;
	}
	#scrapeList td.year {
		width: 100px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
	}
	#scrapeList td.thumnail {
		width: 150px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
	}
	#scrapeList td.sub {
		width: 300px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
	}
	#scrapeList td.del {
		width: 50px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
	}
	#scrapeList td.text {
		border-bottom: 1px solid #BDBDBD;
		height: 150px;
	}
	#scrapeList input.btn2{
		width:90px;height:30px;
		background-color:#000000;
		color:#ffffff;
		border:1px solid #000000;
		border-radius:3px;
		font-size:10pt;
		font-family:'나눔바른고딕';
	}
</style>
</head>
<%@ include file="/etc/mainTop.jsp" %>
<body>
<div id="scrapeList">
<h3>나의 스크랩</h3>
<hr>
	<c:if test = "${ scrapeCount == 0 }">
		<p>아직 스크랩한 목록이 없습니다.</p>
	</c:if>
	<c:if test = "${ scrapeCount > 0 }"> 
	<table>
		<tr>
			<td class="year">연도</td>
			<td class="cate">장르</td>
			<td class="thumnail">대표 이미지</td>
			<td class="sub">제목</td>
			<td class="del">스크랩 취소</td>
		</tr>
		<c:forEach var = "scrapeList" items = "${ scrapeList }">
		<tr>
			<td class="text">${scrapeList.year}</td>
		<c:if test="${scrapeList.category eq '음악'}">
			<c:set var ="cate" value="음악"/>
			<td class="text">${cate}</td>
		</c:if>
		<c:if test="${scrapeList.category eq '영화'}">
			<c:set var ="cate" value="영화"/>
			<td class="text">${cate}</td>
		</c:if>
		<c:if test="${scrapeList.category eq '드라마'}">
			<c:set var ="cate" value="드라마"/>
			<td class="text">${cate}</td>
		</c:if>
		<c:if test="${scrapeList.category eq '애니메이션' || scrapeList.category eq 'animation'}">
			<c:set var ="cate" value="애니메이션"/>
			<td class="text">${cate}</td>
		</c:if>
			<td class="text"> 
				<img src=${ scrapeList.img } style="width:150px;height:150px;">
			</td>
			<td class="text">
				<a href = "/CULTURESLOT/CS_content/content.do?year=${scrapeList.year }&genre=${scrapeList.category}&title=${scrapeList.title}&num=${scrapeList.content_num}">
					${scrapeList.title }</a>
			</td>
			<td class="text">
				<form action = "scrapeDelete.do">
					<input type="hidden" name="content_num" value="${scrapeList.content_num }"/>
					<input type = "hidden" name = "year" value = "${ scrapeList.year }" />
					<input type = "hidden" name = "category" value = "${scrapeList.category }" />
					<input type = "hidden" name = "title" value = "${ scrapeList.title }" />
				<input type = "submit" value = "스크랩 취소" class="btn2"/>
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div id="pageNumber">
		<c:if test="${startPage>10 }">
			<a href="/CULTURESLOT/CS_scrape/scrapeList.do?pageNum=${startPage-10 }">[이전]</a>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage}" step="1" var="i">
			<a href="/CULTURESLOT/CS_scrape/scrapeList.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<a href="/CULTURESLOT/CS_scrape/scrapeList.do?pageNum=${startPage+10}">[다음]</a>
		</c:if>
	</div>
	
	</c:if>
</div>
</body>
</html>