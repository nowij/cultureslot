<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:if test="${check==0}">
	<script>
		alert("아이디나 비밀번호를 확인하세요");
		history.go(-1);
	</script>
</c:if>
<!-- 0615 수정 -->
<c:if test="${check==1}">
	<script>
		location.href="${sessionScope.page}"
	</script>
</c:if>
<c:if test="${check==2 }">
	<script>
		alert("본인인증 후 로그인을 진행해 주세요!");
		location.href="/CULTURESLOT/member/loginForm.do"
	</script>
</c:if>
<c:if test="${check==3 }">
	<script>
		alert("등록되지 않은 회원입니다. 회원가입을 해주세요!");
		history.go(-1);
	</script>
</c:if>