<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE : 나의 댓글 목록</title>
<style>
	#commentSec{
		width: 40%;
		margin: 0 auto;
		font-family: '나눔바른고딕';
	}
	#commentSec h3{
		margin:30 auto;
		font-size:20pt;
	}
	#commentSec table {
		margin:0 auto;
		margin-top: 50px;
		text-align:center;
	}
	#commentSec tb{
		height:40px;
	}
	#commentSec td.cate {
		width: 100px;
		height:40px;
		font-weight:bold;
		text-align:center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
		border-radius:3px;
	}
	#commentSec td.year {
		width: 100px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
		border-radius:3px;
	}
	#commentSec td.content {
		width: 300px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
	}
	#commentSec td.sub {
		width: 300px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
		border-radius:3px;
	}
	#commentSec td.text {
		border-bottom: 1px solid #BDBDBD;
		height: 50px;
	}
</style>
</head>
<body>
<%@ include file="/etc/mainTop.jsp" %>
<div id="commentSec">
	<h3>나의 댓글 리스트</h3>
	<hr>
	<table>
	<c:if test="${count == 0}">
		<tr>
			<td>등록한 댓글이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${count != 0}">
		<tr>
			<td class="year">연도</td>
			<td class="cate">장르</td>
			<td class="sub">제목</td>
			<td class="content">댓글 내용</td>
		</tr>
	<c:forEach var="c" items="${commentList}">
		<tr>
			<td class="text">${c.year}</td>
			<td class="text">${c.category}</td>
			<td class="text">
				<a href="/CULTURESLOT/CS_content/content.do?year=${c.year }&genre=${c.category}&title=${c.title}&num=${c.content_num}">
					${c.title}</a></td>
			<td class="text">${c.content}</td>
		</tr>
	</c:forEach>
	</c:if>
	</table>
</div>
<div id="pageNumber">
	<c:if test="${startPage>10 }">
		<a href="/CULTURESLOT/member/myCommentList.do?pagenum=${startPage-10 }">[이전]</a>
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
		<a href="/CULTURESLOT/member/myCommentList.do?pagenum=${i}">[${i }]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount }">
		<a href="/CULTURESLOT/member/myCommentList.do?pagenum=${startPage+10 }">[다음]</a>
	</c:if>
</div>
</body>
</html>