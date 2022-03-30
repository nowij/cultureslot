<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 댓글 관리</title>
<style>
	#commSec{
		width:60%;
		margin:0 auto;
		margin-top:120px;
		text-align:center;
	}
	#commSec h1{
		margin:30 auto;
		font-size:24pt;
	}
	#commSec table {
		margin:0 auto;
		margin-top: 50px;
		text-align:center;
	}
	#commSec tb{
		height:40px;
	}
	#commSec td.cate {
		width: 100px;
		height:40px;
		font-weight:bold;
		text-align:center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
		border-radius:3px;
	}
	#commSec td.id {
		width: 100px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
		border-radius:3px;
	}
	#commSec td.content {
		width: 300px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
	}
	#commSec td.sub {
		width: 300px;
		font-weight: bold;
		text-align: center;
		color: #fff;
		background-color: #000000;
		border: 1px solid #ffffff;
		border-radius:3px;
	}
	#commSec td.text {
		border-bottom: 1px solid #BDBDBD;
		height: 50px;
	}
	#commSec input.btn2{
		width:90px;height:30px;
		background-color:#ffffff;
		color:#000000;
		border:1px solid #BDBDBD;
		border-radius:3px;
		font-size:10pt;
		font-family:'나눔바른고딕';
	}
</style>
</head>

<body>
 <%@ include file="/etc/adminTop.jsp" %>
<div id="commSec">
	<h1>- 댓글 관리 -</h1>
	<table>
		<tr>
			<td class="cate">카테고리</td>
			<td class="id">아이디</td>
			<td class="sub">콘텐츠 제목</td>	
			<td class="content">댓글 내용</td>
			<td class="cate">삭제</td>
		</tr>
		<c:forEach items="${commentList }" var="comment">
		<tr>
			<td class="text">${comment.category }</td>
			<td class="text">${comment.id}</td>
			<td class="text">${comment.title }</td>
			<td class="text">${comment.content }</td>
			<td class="text">
				<input type="button" value="삭제" class="btn2"
					onclick="window.location='commentDelete.do?num=${comment.comment_num}'"/>
			</td>
		</tr>
		</c:forEach>
		</table>
		<c:if test="${startPage>10 }">
			<a href="/CULTURESLOT/CS_admin/commentList.do?pagenum=${startPage-10 }">[이전]</a>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
			<a href="/CULTURESLOT/CS_admin/commentList.do?pagenum=${i}">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<a href="/CULTURESLOT/CS_admin/commentList.do?pagenum=${startPage+10 }">[다음]</a>
		</c:if>
		
</div>

</body>