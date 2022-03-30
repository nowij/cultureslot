<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 확인</title>
<style>
	#useable{
		text-align:center;
	}
	#useable input {
		width: 200px;
		height: 30%;
		border-radius:5px;
		border:1px solid #BDBDBD;
		font-size:12pt;
	}	
	#useable .btn{
		width:100px;
	    background-color: #ffffff;
	    border-width : medium;
	    padding: 15px 0;
	    text-align: center;
	    font-size: 13px;
	    margin: 4px;
	    border-radius:10px;
	}
	#useable p{
		size:13px;
	}
	
	#unuseable{
		margin-right:auto;
		margin-left:auto;
		text-align:center;
	}
	#unuseable input {
		width: 200px;
		height: 30%;
		border-radius:5px;
		border:1px solid #BDBDBD;
		font-size:12pt;
	}	
	#unuseable .btn{
		width:100px;
	    background-color: #ffffff;
	    border-width : medium;
	    padding: 15px 0;
	    text-align: center;
	    font-size: 13px;
	    margin: 4px;
	    border-radius:10px;
	}
	#unuseable p{
		size:13px;
		color:red;
	}
</style>
</head>
<script>
	function Wclose(){
		opener.document.userinput.id.value="${memid}";
		self.close();
	}
</script>
<body>
<br/>
<br/>
<br/>
	<c:if test="${check!=1}">
	<div id="useable">
		<p>${memid}은/는 사용할 수 있는 아이디입니다<br /></p>
		<input type="button" value="확인" onclick="Wclose()" class="btn">
	</div>
	</c:if>
	
	<c:if test="${check==1}">
	<div id="unuseable">
		<p>중복된 아이디입니다!</p><br />
		<form method = "post" action ="confirmId.do">
			<input type="text"  maxlength="12" name="id" id="id" ><br/><br/>
			<input type="submit" value="중복확인"  class="btn"> 
		</form>
	</div>
	</c:if>
</body>
</html>