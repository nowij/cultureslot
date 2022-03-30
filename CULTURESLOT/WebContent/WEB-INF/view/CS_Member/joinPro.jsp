<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<style>
	#joinSuccess{
		margin-right:auto;
		margin-left:auto;
		text-align:center;
	}
	#joinSuccess h1{
		font-size:40pt;
		color:#898999;
	}
	#joinSuccess #second{
		font-size:15pt;
		font-family:'나눔바른고딕';
		padding:5px 5px 5px 5px;
	}
	#joinSuccess .btn{
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
	<div id="joinSuccess">
		<img src="../img/email.png" width="150" height="150"/>
		<h1>회원 가입 성공!</h1>
		<div id="second">
			인증 메일을 보냈습니다.<br/>
			본인인증 후 로그인 해주세요.
		</div>
		<br/>
		<br/>
		<br/>
		<input type="button" value="메인으로" class="btn" onclick="window.location='/CULTURESLOT/CS_main/main.do'"/>
	</div>
</body>
</html>