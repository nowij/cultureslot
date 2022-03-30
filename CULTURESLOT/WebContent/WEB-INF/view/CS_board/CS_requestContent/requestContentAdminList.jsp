<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 자료요청 게시판</title>
<style>
div.section {
	margin-top: 120px;
}

table.list {
	margin: 0 auto;
	width: 700px;
	height: auto;
	text-align: center;
}

table.list td {
	height: 30px;
	font-family: '나눔바른고딕';
}

table.list td.title {
	height: 50px;
	font-size: 30px;
	font-weight: bold;
	background-color: #3b3a39;
	border-radius: 10px;
	color: #ffffff;
}

table.list td.td1 {
	font-size: 20px;
	background-color: #3b3a39;
	color: #ffffff;
	border-radius: 5px;
}

table.list td.td2 {
	border: 1px solid #BDBDBD;
	border-radius: 5px;
}

table.list #textarea {
	width: 98%;
	height: 400px;
	border: none;
	resize: none;
}

table.list td.BtnArea {
	width: 100px;
	height: 40px;
}

table.list input.submitBtn {
	width: 100px;
	height: 30px;
	text-align: center;
	font-family: '나눔바른고딕';
	font-size: 10pt;
	border: 1px solid #ffffff;
	border-radius: 10px;
	background-color: #3b3a39;
	color: #ffffff;
}

table.list input.buttonBtn {
	width: 40px;
	height: 40px;
	font-family: '나눔바른고딕';
	text-align: center;
	font-size: 10pt;
	border: 1px solid #BDBDBD;
	border-radius: 10px;
	background-color: #ffffff;
	color: #3b3a39;
}

table.list #no {
	width: 40px;
}

table.list #subject {
	
}

table.list #writer {
	width: 100px;
}

table.list #reg {
	width: 140px;
}

table.list #hit {
	width: 80px;
}

table.list #btnarea {
	width: 100px;
}
</style>
</head>
<script language = "javascript">
	function loginAlert(){
			alert("로그인이 필요합니다.");
			window.location='';
	}
</script>
<body>
 <%@ include file="/etc/adminTop.jsp" %>
<div class ="section">
<table class ="list">
		<c:set var = "check" value="${RCList}"/>
		<tr>
			<td colspan="6" class="title">자료 요청</td>
		</tr>
		<tr>
			<td colspan="6" align="right">
			</td>
		</tr>
		<tr height="40px">
			<td class="td1" id ="no">NO</td>
			<td class="td1" id ="subject">제목</td>
			<td class="td1" id ="writer">작성자</td>
			<td class="td1" id ="reg">등록일</td>
			<td class="td1" id ="hit">조회수</td>
			<td class="td1" id ="hit">답변상태</td>
		</tr>
	<c:if test="${count == 0 }">
		<tr>
			<td colspan="5">등록된 자료 요청이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${count > 0 }">
		<c:forEach items="${RCList}" var="list">
		<tr>
			<td class="td2">${number}</td>
			<td class="td2">
				<a href="RC_AdminContent.do?num=${list.rc_num}">
					${list.title} 
				</a>
			</td>
			<td class="td2">${list.id}</td>
			<td class="td2">
				<fmt:formatDate value="${list.reg_date}" type="both" 
					pattern="yyyy.MM.dd HH:mm"/>
			</td>
			<td class="td2">${list.hit}</td>
		<c:if test = "${list.comment_state == 1 }">
		<c:set var = "state" value="답변완료"/>
			<td class="td2">${state}</td>
		</c:if>
		<c:if test = "${list.comment_state == 0 }">
		<c:set var = "state" value="답변대기"/>
			<td class="td2">${state}</td>
		</c:if>
		</tr>
			<c:set var="number" value="${number+1}"/>
		</c:forEach>
		<tr>
			<td colspan="6" >
				<c:if test="${rcStartPage > 10}">
					<a href="RC_AdminList.do?pageNum=${rcStartPage - 10}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${rcStartPage}" end="${rcEndPage}">
					<a href="RC_AdminList.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${rcEndPage < rcPageCount}">
					<a href="RC_AdminList.do?pageNum=${rcStartPage + 10}">다음</a>
				</c:if>
			</td>
		</tr>
	</c:if>
	</table>
</div>
</body>
</html>