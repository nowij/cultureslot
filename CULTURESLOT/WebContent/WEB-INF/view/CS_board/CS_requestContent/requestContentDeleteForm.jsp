<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	var up = confirm("삭제하시겠습니까?");
	if (up){
		window.location='RC_DeletePro.do?num=${rc_num}';
	}
	else{
		history.go(-1);
	}
</script>
<body>

</body>
</html>