<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 error!</title>
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
		background:
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
	<img src="../img/500error.png" width="500" height="250"/><br/><br/>
	<div class="errorContent">
		<p><b><font size=8  color="#898999">현재 찾을 수 없는 페이지를 요청 하셨습니다.</font></b></p>
		<font size=4>
			알 수 없는 에러가 발생했습니다.<br />
			이용에 불편을 드려 죄송합니다.<br/><br/><br/>
		</font>
	</div>
	<br/>
	<br/>
	<br/>
	<input type="button"  id="mainBTN"  value="메인으로"  onclick="window.location='/CULTURESLOT/CS_main/main.do'"/>
</div>
</body>
</html>