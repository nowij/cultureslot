<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩</title>
</head>
<body>
	<c:if test = "${ id eq null }">
		<script>
			alert("로그인 시 이용 가능합니다.");
			window.location = '/CULTURESLOT/member/loginForm.do';
		</script>
	</c:if>
	
	<c:if test = "${ id ne null }">
		<c:if test = "${ check != 1 }">
			<script>
				alert("스크랩 되었습니다.");
				history.go(-1);
			</script>
		</c:if>
				
		<c:if test = "${ check == 1 }">
			<script>
				alert("이미 스크랩한 게시물입니다.");
				history.go(-1);
			</script>
		</c:if>
	</c:if>
</body>
</html>