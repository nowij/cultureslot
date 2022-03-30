<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test = "${msg == null }">
	<script>
		alert("죄송합니다. 시스템에 장애가 있습니다. 다시한번 시도해주세요.");
		history.go(-1);
	</script>
</c:if>
<c:if test= "${msg != null }">
	<script>
		alert("수정이 완료되었습니다.");
		window.location='RC_MainContent.do?num=${rc_num}';
	</script>
</c:if>
</head>
<body>

</body>
</html>