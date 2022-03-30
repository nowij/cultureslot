<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 : 자료 요청 등록</title>
<style>
	table.form{
		width:500px;
		margin:0 auto;
		height:auto;
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
		
		border:1px solid #BDBDBD;
	}
	table.form td.td3{
		width:100px;
		font-size:20px;
		background-color:#3b3a39;
		color:#ffffff;
	}
	table.form td.td4{
		width:150px;
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
<script language="javascript">
function inputCheck(){
	var RC_form = eval("document.RC_form");
	if (RC_form.title.value == ""){
		alert("제목을 입력하세요");
		return false
		
	}
	if (RC_form.content.value == ""){
		alert("내용을 입력하세요");
		return false	
	}
}
</script>
</head>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
<form action="RC_Pro.do" name="RC_form" method ="post" onSubmit="return inputCheck()">
    <table class="form">
    	<tr>
    		<td colspan="4" class="title">- 자료 요청 등록 -</td>
    	</tr>
    	<tr>
    		<td colspan="4"></td>
    	</tr>
    	<tr height="40px">
    		<td class="td1">제목</td>
    		<td class="td2" colspan="3">
    			<input type="text" name="title" id ="subject"
    				placeholder="000콘텐츠를 요청합니다.">
    		</td>
    	</tr>
    	<tr>
    		<td class="td3">장르 선택</td>
    		<td class="td4">
    			<select name="category" id = "selectGenre">
    				<option value="음악">음악</option>
    				<option value="영화">영화</option>
    				<option value="드라마">드라마</option>
    				<option value="애니메이션">애니메이션</option>
    			</select>
    		</td>
    		<td class="td3">작성자</td>
    		<td class="td4">
    			${memId} <input type="hidden" name="id" value="${memId}">
    		</td>
    	</tr>
    	<tr>
    		<td class="td1">내용</td>
    		<td class="td2" colspan="3">
    			<textarea name="content" id ="textarea" 
    			placeholder="아래의 형식을 지켜주세요.&#13;&#10;&#13;&#10;- 제목:요청하는 콘텐츠 제목 &#13;&#10;-아티스트:가수이름, 감독이름 등 "></textarea>
    		</td>
    	</tr>
		<tr style="height:50px;"><td></td></tr>
 		<tr>
 			<td colspan="4" class="BtnArea">
 				<input type="submit" value="등록하기" class="submitBtn" onclick="inputCheck()">
 				<input type="button" value="목록으로" class="buttonBtn"
 					onclick="javascript:window.location='RC_MainList.do'">
 			</td>
 		</tr>
    </table>
</form>

</body>
</html>