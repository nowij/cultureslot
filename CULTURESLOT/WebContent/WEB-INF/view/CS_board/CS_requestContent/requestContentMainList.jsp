<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 : 자료요청 게시판</title>
<style>
#rcList {
	width: 50%;
	margin: 0 auto;
	font-family: '나눔바른고딕';
}
#rcList h3{
	margin:30 auto;
	font-size:20pt;
	text-align:center;
}
#rcList hr{
	margin-bottom:30px;
}
</style>
</head>
<script language = "javascript">
	function loginAlert(){
			alert("로그인이 필요합니다.");
			window.location='../member/loginForm.do';
	}
</script>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
<div id ="rcList">
<h3>자료 요청</h3>
<hr>
<table class ="list">
		<c:set var = "check" value="${RCList}"/>
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
				<a href="RC_MainContent.do?num=${list.rc_num}">
					${list.title} 
				</a>
			</td>
			<td class="td2">${list.id}</td>
			<td class="td2">
				<fmt:formatDate value="${list.reg_date}" type="both" pattern="yyyy.MM.dd HH:mm"/>
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
		<tr><td style="height:20px;"></td></tr>
		<tr>
			<td colspan="6" align="right">
			<c:if test="${sessionScope.memId == null }">
				<input type="button" value="요청 등록" class="submitBtn"
					 onclick="loginAlert()">
			</c:if>
			<c:if test="${sessionScope.memId != null}">
				<input type="button" value="요청 등록" class="submitBtn"
					onclick="javascript:window.location='RC_Form.do'">
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="6" >
				<c:if test="${rcStartPage > 10}">
					<a href="RC_MainList.do?pageNum=${rcStartPage - 10}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${rcStartPage}" end="${rcEndPage}">
					<a href="RC_MainList.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${rcEndPage < rcPageCount}">
					<a href="RC_MainList.do?pageNum=${rcStartPage + 10}">다음</a>
				</c:if>
			</td>
		</tr>
	</c:if>
	</table>
</div>
</body>
</html>