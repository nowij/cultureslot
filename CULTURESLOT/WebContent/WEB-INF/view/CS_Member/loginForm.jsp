<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head> 
<title>로그인</title>
</head>
<%@ include file="/etc/mainTop.jsp" %>
<div style="width:100%;">
<div id ="login">
<form action="loginPro.do" method="post">
<table> 
	<tr>
		<td colspan="2" class="title">회원 로그인</td></tr>
	<tr>
		<td class="td1">아이디</td>
		<td>
			<input type="text" name="id" size="15" maxlength="12"/>
		</td>
		</tr>
	<tr>
		<td class="td1">비밀번호</td>
		<td>
			<input type="password" name="pw" size="15" maxlength="12"/>
		</td>
	</tr>
	<tr>
		 <td colspan ="2" class="td2">    
		 	 <input type="submit" value="로그인" id="loginBtn" class="Btn"/>
	 	 	 <input type="button" value="회원가입" id="joinBtn" class="Btn"
		 	 	 	onClick="javascript:window.location='/CULTURESLOT/member/joinForm.do'"/> 	
	 	 </td>
	 </tr>
</table>
</form>	
</div>
</div>

</body>
</html>    