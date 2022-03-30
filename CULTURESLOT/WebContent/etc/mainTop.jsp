<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/etc/CS_style.jsp" %>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>메인</title>
 </head>
 <body>
 <header>
  <div class="tap">
	<ul id ="menu">
	<c:if test="${sessionScope.memId == null }">
 		<li><a href="/CULTURESLOT/member/loginForm.do">로그인</a>&nbsp;&nbsp;</li>
		<li><a href="/CULTURESLOT/member/joinForm.do">회원가입</a>&nbsp;&nbsp;</li>
	</c:if>
	<c:if test="${sessionScope.memId != null }">
		<li><a href ="/CULTURESLOT/member/logout.do">로그아웃</a>&nbsp;&nbsp;</li>
		<li><a href="/CULTURESLOT/member/mypage.do" onclick="">마이 페이지</a>&nbsp;&nbsp;</li>
	</c:if>
		<li><a href="/CULTURESLOT/notice/noticeMainList.do">공지사항</a>&nbsp;&nbsp;</li>
		<li><a href="/CULTURESLOT/RC/RC_MainList.do">자료요청</a>&nbsp;&nbsp;</li>
		<c:if test="${sessionScope.memId eq 'admin'}">
			<li><a href="/CULTURESLOT/CS_admin/contentList.do">관리자 페이지</a></li>
		</c:if>
	</ul>
	<div id ="search">
		<form action = "../CS_main/searchList.do">
			<input type="text" name="search" id="searchBox">
			<input type="submit" value="검색" id="searchBtn">
		</form>
	</div>
 </div>
 <div class="head">
 	<h1 id="title"><a href="/CULTURESLOT/CS_main/main.do">CULTURES'LOT</a></h1>
 </div>
 </header>
</body>
</html>