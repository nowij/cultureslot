<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${selectList}" var ="select">
<script>
	var num = "${select.content_num}";
	var cate = "${select.category}";
	var up = confirm("삭제하시겠습니까?");
	if (up){
		window.location="contentDeletePro.do?category=${cate}&num=${num}";
	}else{
		history.back();
	}
</script>
</c:forEach>

<h1>삭제 하시겠습니까?</h1>
<form method="post" action="contentDeletePro.do">
	<c:forEach items="${selectList }" var="select">
	<input type="hidden" value="${select.content_num }" name="content_num"/>
	<input type="hidden" value="${select.category }" name="category"/>
	<table border="1">
		<tr>
			<td>${select.category }</td>
			<td>${select.year }</td>
			<td>${select.title }</td>
			<td>${select.creator }</td>
		</tr>
		<tr>
			<td colspan="4"><input type="submit" value="삭제"/>
			<input type="button" value="취소" onclick="history.back()"/></td>
		</tr>
	</table>
	</c:forEach>
</form>