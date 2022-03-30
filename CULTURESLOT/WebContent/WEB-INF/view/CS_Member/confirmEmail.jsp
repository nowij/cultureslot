<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증</title>
<style>
	#emailSuccess{
		margin-right:auto;
		margin-left:auto;
		text-align:center;
	}
	#emailSuccess h1{
		font-size:45pt;
		color:#898999;
	}
	#emailSuccess #second{
		font-size:15pt;
		font-family:'나눔바른고딕';
		padding:5px 5px 5px 5px;
	}
	#emailSuccess .btn{
		width:100px;
	    background-color: #ffffff;
	    border-width : medium;
	    padding: 15px 0;
	    text-align: center;
	    font-size: 13px;
	    margin: 4px;
	    border-radius:10px;
	}
</style>
</head>

<body>
<br/>
<br/>
<br/>
	<div id="emailSuccess">
	<c:if test="${result==1 }">
		<img src="../img/congtu.png" width="150" height="150"/><h1>본인인증 성공!</h1>
		<div id="second">
			환영합니다!<br/>
			회원가입이 정상적으로 이루어졌습니다.
		</div>
		<br/>
		<br/>
		<br/>
		<input type="button" class="btn" onclick="window.location='/CULTURESLOT/member/loginForm.do'" value="로그인"/>
		<input type="button" class="btn" onclick="window.location='/CULTURESLOT/CS_main/main.do'" value="메인"/>
	</c:if>
		<c:if test="${result!=1 }">
			<img src="../img/xxx.png" width="150" height="150"/>
			<h1>본인 인증 실패</h1>
			<div id="second">
				인증에 실패하셨습니다.<br/>
				오류가 발생했거나 이미 인증이 된 회원입니다.<br/>
				이메일을 다시 한 번 확인해 주시고 다시 인증해주세요.
				<br/>
				<br/>
				<br/>
				<input type="button" class="btn" onclick="window.location='/CULTURESLOT/CS_main/main.do'" value="메인"/>
			</div>
		</c:if>

	</div>
</body>
</html>