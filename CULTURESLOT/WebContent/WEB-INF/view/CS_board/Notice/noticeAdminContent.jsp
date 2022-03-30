<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
<style>
	div.noticeSection {
		margin-top: 120px;
	}
	table.form{
		margin:0 auto;
		width:auto; height:auto;
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
		width:100px;
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
		width:auto;
		border:1px solid #BDBDBD;
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
		width:140px; height:50px;
		text-align:center;
		font-family:'나눔바른고딕';
		font-size:12pt;
		border:1px solid #ffffff;
		border-radius:10px;
		background-color:#3b3a39;
		color:#ffffff;
	}
	table.form input.buttonBtn{
		width:140px; height:50px;
		font-family:'나눔바른고딕';
		text-align:center;
		font-size:12pt;
		border:1px solid black;
		border-radius:10px;
		background-color:#ffffff;
		color:#3b3a39;
	}
</style>

</head>
<body>
<%@ include file="/etc/adminTop.jsp" %>
<div class="noticeSection">
<c:forEach var="notice" items="${noticeContent}">
<table class ="form">
	<tr>
		<td colspan="2" class="title"> - 공지사항 보기 - </td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr height="40px">
		<td class="td1">제목</td>
		<td class="td2">
			${notice.n_subject}
		</td>
	</tr>
	<tr>
		<td class="td1">
			작성자
		</td>
		<td class="td2">
			${notice.n_writer}
		</td>
	</tr>
	<tr>
		<td class="td1">내용</td>
		<td class="td2">
			<pre id="textarea">${notice.n_content}</pre>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td colspan="2" class="BtnArea">
			<input type="button" value="공지사항 목록" class="submitBtn"
				onclick="javascript:window.location='noticeAdminList.do'">
			<input type="button" value="공지사항 수정" class="buttonBtn"
				onclick="javascript:window.location='noticeModifyForm.do?n_num=${notice.n_num}'">&nbsp;&nbsp;
			<input type="button" value="공지사항 삭제" class="buttonBtn"
				onclick="javascript:window.location='noticeDeleteForm.do?n_num=${notice.n_num}'">&nbsp;&nbsp;
		</td>
	</tr>
</table>
</c:forEach>
</div>

</body>
</html>