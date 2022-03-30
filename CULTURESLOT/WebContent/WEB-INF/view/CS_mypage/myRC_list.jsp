<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE : 나의 자료 요청</title>
<style>
#rcList {
	width: 40%;
	margin: 0 auto;
	font-family: '나눔바른고딕';
}
#rcList h3{
	margin:30 auto;
	font-size:20pt;
}
#rcList p{
	margin:0 auto;
	margin-top:50px;
	text-align:center;
}
#rcList table {
	margin:0 auto;
	margin-top: 50px;
	text-align:center;
}
#rcList tb{
	height:40px;
}
#rcList td.no {
	width: 50px;
	height:30px;
	font-weight:bold;
	text-align:center;
	color: #fff;
	background-color: #000000;
	border: 1px solid #ffffff;
	border-radius:3px;
}
#rcList td.sub {
	width: 400px;
	font-weight: bold;
	text-align: center;
	color: #fff;
	background-color: #000000;
	border: 1px solid #ffffff;
	border-radius:3px;
}
#rcList td.state {
	width: 100px;
	height:30px;
	font-weight:bold;
	text-align:center;
	color: #fff;
	background-color: #000000;
	border: 1px solid #ffffff;
	border-radius:3px;
}

#rcList td.del {
	width: 100px;
	font-weight: bold;
	text-align: center;
	color: #fff;
	background-color: #000000;
	border: 1px solid #ffffff;
	border-radius:3px;
}

#rcList td.text {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
}
#rcList input.btn2{
	width:50px;height:30px;
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
<div id="rcList">
<h3>나의 자료 요청</h3>
<hr>
	<c:if test = "${ myRC_Count == 0 }">
		<p>아직 자료 요청한 게시글이 없습니다.</p>
	</c:if>
	<c:if test = "${ myRC_Count > 0 }"> 
	<table>
		<tr><td class="no">NO</td>
			<td class="sub">제목</td>
			<td class="state">답변상태</td>
			<td class="del" colspan="2">수정/삭제</td>
		</tr>
		<c:forEach var = "myRC" items = "${mylist}">
		<tr>
			<td class="text">${number}</td>
			<td class="text">${myRC.title}</td>
		<c:if test="${myRC.comment_state == 0}">
		<c:set var="state" value="답변대기"/>
			<td class="text">${state}</td>
		</c:if>
		<c:if test="${myRC.comment_state > 0}">
		<c:set var="state" value="답변완료"/>
			<td class="text">${state}</td>
		</c:if>
			<td class="text">
				<input type="button" value="수정" class="btn2"
					onclick="javascript:window.location='myRC_listmodifyForm.do?num=${myRC.rc_num}'">
			</td>
			<td class="text">
				<input type="button" value="삭제" class="btn2"
					onclick="javascript:window.location='myRc_listdeleteForm.do?num=${myRC.rc_num}'">
			</td>
		</tr>
		<c:set var="number" value="${number+1}"/>
		</c:forEach>
	</table>
	</c:if>
</div>
</body>
</html>