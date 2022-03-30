<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>회원탈퇴</title>
<script>

	function begin(){
		document.myform.pw.focus();
	}
	// 비밀번호 입력 확인 
	function checkIt(){
		if(!document.myform.pw.value){
			alert("비밀번호 입력하지 않으셨습니다 ");
			document.myform.pw.focus();
		}
	}	
	
</script>
</head>
</html>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
<section>
<div  id ="withdrawSection">
	<h1 class="title">회원 탈퇴</h1>
	<div id="withdraw">
	<form onload="begin()" name="myform" action="deletePro.do" method="post" onSubmit="return checkIt">
	<table>
			<tr>
				<td>비밀번호를 입력하세요</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pw" size="15" maxlength="12">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원탈퇴" class="btn">
					<input type="button" value="취소" onclick="javascript:window.location='mypage.do'"	 class="btn">
				</td>
	</tr>
	</table>
	</form>
	</div>
</div>
</section>
</body>