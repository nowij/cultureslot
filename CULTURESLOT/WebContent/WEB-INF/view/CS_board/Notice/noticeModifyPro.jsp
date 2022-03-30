<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert("수정이 완료되었습니다.");	
	window.location='/CULTURESLOT/notice/noticeAdminContent.do?n_num=${n_num}';
</script>