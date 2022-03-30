<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<style>
	table.form{
		margin:0 auto;
		width:500px; height:auto;
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
		background-color:#000000;
		color:#ffffff;
	}
	table.form td.td1{
		width:100px;
		font-size:20px;
		background-color:#000000;
		color:#ffffff;
	}
	table.form #subject{
		width:98%;
		height:98%;
		border:0;
	}
	table.form td.td2{
		width:400px;
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
		width:100px; height:50px;
		font-family:'나눔바른고딕';
		font-size:20px;
		border:1px solid #ffffff;
		border-radius:10px;
		background-color:#000000;
		color:#ffffff;
	}
	table.form input.buttonBtn{
		width:100px; height:50px;
		font-family:'나눔바른고딕';
		font-size:20px;
		border:1px solid black;
		border-radius:10px;
		background-color:#ffffff;
		color:#000000;
	}
</style>
<script >
function inputCheck(){
	var noticeForm = eval("document.noticeForm");
	if (noticeForm.n_subject.value == ""){
		alert("제목을 입력하세요");
		return false
		
	}
	if (noticeForm.n_content.value == ""){
		alert("내용을 입력하세요");
		return false	
	}
}
</script>
</head>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
<form action="noticePro.do" name="noticeForm" onSubmit="return inputCheck()">
<table class ="form">
	<tr>
		<td colspan="2" class="title"> - 공지사항 등록 - </td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr height="40px">
		<td class="td1">제목</td>
		<td class="td2">
			<input type="text" name="n_subject" id="subject">
		</td>
	</tr>
	<tr>
		<td class="td1">내용</td>
		<td class="td2">
			<textarea name="n_content" id ="textarea"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td colspan="2" class="BtnArea">
			<input type="submit" value="공지 등록" class="submitBtn" onclick="inputcheck()">
			<input type="button" value="공지 목록" class="buttonBtn"
				onclick="javascript:window.location='noticeAdminList.do'">
		</td>
	</tr>
</table>
</form>

</body>
</html>