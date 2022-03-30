<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 error!</title>
<style>
	#mainBTN{
		width:100px;
	    background-color: #ffffff;
	    border-width : medium;
	    padding: 15px 0;
	    text-align: center;
	    font-size: 13px;
	    margin: 4px;
	    border-radius:10px;
	}
	#errorPage{
		margin-right:auto;
		margin-left:auto;
		text-align:center;
	}
	.errorContent font{
		font-family:'나눔바른고딕';
		padding:5px 5px 5px 5px;
	}
</style>
</head>
<body>
<br/>
<br/>
<br/>
<div id="errorPage">
	<img src="../img/404error.png" width="500" height="250"/><br/><br/>
	<div class="errorContent">
		<p><b><font size=8  color="#898999">현재 찾을 수 없는 페이지를 요청 하셨습니다.</font></b></p>
		<font size=4>
			존재하지 않은 주소를 입력하셨거나,<br/>
			요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.<br/>
			궁금한 점이 있으시면 언제든 고객센터를 통해 문의해 주시기 바랍니다.<br/><br/><br/>
			감사합니다. <br/>
		</font>
	</div>
	<br/>
	<br/>
	<br/>
	<input type="button"  id="mainBTN"  value="메인으로"  onclick="window.location='/CULTURESLOT/CS_main/main.do'"/>
</div>
</body>
</html>