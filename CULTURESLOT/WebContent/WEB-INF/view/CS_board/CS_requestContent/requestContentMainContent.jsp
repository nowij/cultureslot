<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 : 자료 요청 보기</title>
<style>
	table.form{
		margin:0 auto;
		width:550px; height:auto;
		text-align:center;
	}
	table.form td{
		height:30px;
		font-family:'나눔바른고딕';
		border-radius:10px;
	}
	table.form td.title{
		height:50px;
		font-size:30px;
		font-weight:bold;
		background-color:#3b3a39;
		color:#ffffff;
	}
	table.form td.td1{
		width:250px;
		font-size:20px;
		background-color:#3b3a39;
		color:#ffffff;
	}
	table.form #subject{
		width:98%;
		height:98%;
		border:0;
	}
	table.form td.td2{
		width:300px;
		border:1px solid #BDBDBD;
	}
	table.form #selectGenre{
		width:98%;
		height:100%;
		border:0;
		text-align:center;
		font-family:'나눔바른고딕';
	}
	table.form #textarea{
		width:98%; 
		height:400px;
		border:none;
		resize:none;
	}
	table.form td.BtnArea{
		height:40px;
	}
	table.form input.submitBtn{
		width:100px; height:50px;
		font-family:'나눔바른고딕';
		font-size:20px;
		border:1px solid #ffffff;
		border-radius:10px;
		background-color:#3b3a39;
		color:#ffffff;
	}
	table.form input.buttonBtn{
		width:100px; height:50px;
		font-family:'나눔바른고딕';
		font-size:20px;
		border:1px solid black;
		border-radius:10px;
		background-color:#ffffff;
		color:#3b3a39;
	}
	
</style>
</head>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
    <table class="form">
    <c:forEach var="rc" items="${RcContent}">
    	<tr>
    		<td colspan="4" class="title">- 자료 요청 -</td>
    	</tr>
    	<tr>
    		<td colspan="4"></td>
    	</tr>
    	<tr height="40px">
    		<td class="td1">제목</td>
    		<td class="td2" colspan="3">
    			${rc.title}
    		</td>
    	</tr>
    	<tr>
	    	<td class="td1">조회수</td>
	    	<td class="td2">${rc.hit}</td>
	    	<td class="td1">등록일자</td>
	    	<td class="td2">
	    		<fmt:formatDate value="${rc.reg_date}" type="both" 
	    			pattern="yyyy.MM.dd HH:mm"/>
			</td>
    	</tr>
    	<tr>
    		<td class="td1">요청 장르</td>
    		<td class="td2">
    			${rc.category}
    		</td>
    		<td class="td1">작성자</td>
    		<td class="td2">
    			${rc.id}
    		</td>
    	</tr>
    	<tr>
    		<td class="td1">내용</td>
    		<td class="td2" colspan="3"style="text-align:left;">
    			<pre id ="textarea">${rc.content}</pre>
    		</td>
    	</tr>
    	<tr>
    		<td></td>
    	</tr>
    	<!-- 댓글 영역 -->
    	<c:if test="${state > 0 }">
   		 <c:forEach var="c" items="${list}">
			<tr>
				<td class="td1">관리자<br>답변</td>
				<td colspan="3"
				style="height:80px;">
					<pre id ="textarea"
					style="padding:15px;width:98%;height:100%;border:1px solid #BDBDBD;text-align:left;border-radius:10px;">${c.content}</pre></td>
			</tr>
		</c:forEach>
    	</c:if>
    		<tr>
    			<td></td>
    		</tr>
 			<tr>
 			<td colspan="4" class="BtnArea">
 		 <c:if test="${sessionScope.memId == rc.id}">
 				<input type="button" value="수정하기" class="submitBtn"
 					onclick="javascript:window.location='RC_ModifyForm.do?num=${rc.rc_num}'">
 				<input type="button" value="삭제하기" class="buttonBtn"
 					onclick="javascript:window.location='RC_DeleteForm.do?num=${rc.rc_num}'">
 		</c:if>
 				<input type="button" value="목록으로" class="buttonBtn"
 					onclick="javascript:window.location='RC_MainList.do'">
 			</td>
 		</tr>
 		</c:forEach>
 	</table>
</body>
</html>