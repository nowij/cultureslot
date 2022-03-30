<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 자료 요청 보기</title>
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
		width:200px;
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
<%@ include file="/etc/adminTop.jsp" %>
<div class="section" style="margin-top:120px;">
<c:forEach var="rc" items="${RcContent}">
    <table class="form">
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
	    		<fmt:formatDate value="${rc.reg_date}" type="both" pattern="yyyy.MM.dd HH:mm"/>
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
    		<td class="td2" colspan="3" style="text-align:left;">
    			<pre id ="textarea">${rc.content}</pre>
    		</td>
    	</tr>
    	<tr>
    		<td></td>
    	</tr>
    <c:if test="${rc.comment_state == 0 }">
    <form action="rccommentPro.do" method="post" name="rccommentWrite">
    	<tr>
			<td class="td1">
			<input type="hidden" name="rc_num" value="${rc.rc_num}">
			<input type="hidden" name="category" value="${rc.category}">
			<input type="hidden" name="rc_writer" value="관리자">
				<input type="submit" value="답변등록" class="submitBtn"/>
			</td>
			<td colspan="3"
				style="width::250px;height:80px;">
				<textarea name="content"
					 style="width:98%;height:100%;border:1px solid #BDBDBD;"required></textarea></td>
    	</tr>
    </form>
    </c:if>
    <c:if test="${rc.comment_state > 0 }">
    <c:forEach var="c" items="${list}">
	<form action="rccommentdelPro.do?num=${rc.rc_num}&comment_num=${c.comment_num}" method="post">
	<input type="hidden" name="content" value="${c.content}">
			<tr>
				<td class="td1">
					<input type="submit" value="답변 삭제" class="submitBtn"/></td>
				<td colspan="3"
				style="height:80px;">
					<pre
					style="padding:15px;width:98%;height:100%;border:1px solid #BDBDBD;text-align:left;">${c.content}</pre></td>
			</tr>
	</form>
	</c:forEach>
    </c:if>
    	<tr>
    		<td></td>
    	</tr>
  	 	 <tr>
   	 		<td colspan="4" class="BtnArea">
 				<input type="button" value="목록으로" class="buttonBtn"
 					onclick="javascript:window.location='RC_AdminList.do'">
 			</td>
 		</tr>
    </table>
</c:forEach>
</div>
</body>
</html>