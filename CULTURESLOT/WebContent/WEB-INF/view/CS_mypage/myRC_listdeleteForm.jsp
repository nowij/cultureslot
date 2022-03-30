<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<script>
	var up = confirm("삭제하시겠습니다");
	if(up){
			window.loction='myRC_listdeletePro,do?num=${rc_num}';
	}
	else{
			history.go(-1);
	}
</script>
<body>

</body>
</html>