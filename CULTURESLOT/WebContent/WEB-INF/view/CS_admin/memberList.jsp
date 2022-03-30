<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
	#memSection{
		margin:0 auto;
		margin-top:120px;
		width:60%;
		text-align:center;
		height:600px;
		margin-bottom:120px;
	}
	#memSection h1{
		margin-top:50px;
		margin-bottom:50px;
	}
	#memSection	#memList{
		margin:0 auto;
		width:600px;
		font-family:'나눔바른고딕';
	}
	#memSection	#memList td{
		border:1px solid #BDBDBD;
		border-radius:5px;
		height:30px;
	}
	#memSection	#memList td.menu{
		text-align:center;
		height:40px;
		font-weight:bold;
		font-size:14pt;
		background-color:#000000;
		color:#ffffff;
	}
	#memSection	#memList td.meminfo{
		text-align:left;
		height:30px;
		font-size:12pt;
		padding-left:5px;
	}
</style>
</head>

<body>
<%@ include file="/etc/adminTop.jsp" %>
<div id ="memSection">
	<h1>- 회원 목록 -</h1>
	<table id ="memList">
		<tr>
			<td class="menu">아이디</td>
			<td class="menu">비밀번호</td>
			<td class="menu">이름</td>
			<td class="menu">나이</td>
			<td class="menu">성별</td>
			<td class="menu">이메일</td>
			<td class="menu">삭제</td>
		</tr>
	<c:forEach var="c" items="${list}">
		<tr>
			<td class="meminfo">${c.id}</td>
			<td class="meminfo">${c.pw}</td>
			<td class="meminfo">${c.name}</td>
			<td class="meminfo">${c.birth}</td>
			<td class="meminfo">${c.gender}</td>
			<td class="meminfo">${c.email}</td>
			<td style="text-align:center; ">
				<a href="/CULTURESLOT/CS_admin/delMemberPro.do?id=${c.id}">삭제</a>
			</td>
		</tr>
	</c:forEach>
	</table>
	<!-- 0704 지원 수정 -->
		<c:if test="${startPage>10 }">
			<a href="/CULTURESLOT/CS_admin/memberList.do?pageNum=${startPage-10 }">[이전]</a>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
			<a href="/CULTURESLOT/CS_admin/memberList.do?pageNum=${i}">[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<a href="/CULTURESLOT/CS_admin/memberList.do?pageNum=${startPage+10 }">[다음]</a>
		</c:if>
</div>
</body>
</html>