//200612 창우 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>insert title here</title>

<c:if test="${msg==null}">
		<script>
				alert("죄송합니다 시스탬에 장애가 있습니다 다시한번시도해주세요");
				history.go(-1);
		</script>
</c:if>

<c:if test="${msg!=null}">
		<script>
				alert("수정 되었습니다.");
				window.location = 'myRC_list.do';
		</script>
</c:if>
