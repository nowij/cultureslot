<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<title>회원 정보 수정 </title>


 

<!--    <script language="javaScript" src="script.js">
	function init(){
		setRadioTelecom("");
	}
	
	function setRadioTelecom(tel){
		var telecom = document.getElementById('telecom');
		for(i = 0, j = telecom.length; i<j; i++){
			if(telecom.option[i].value == tel){
				telecom.option[i].selected = true;
				break;
			}
		}
	}
			
	// 회원 정보 수정 검사
	function checkIt(){
		var userinput = eval("document.userinput");
		var ch;
		
		for(var i = 0; i < userinput.pw.value.length;i++){
			ch = userinput.pw.value.charAt(i);
			if(!(ch >= '0' && ch <= '9') && !(ch>='a' && ch<='z') && !(ch>='A' && ch<='Z')){
				alert("비밀번호는 영문 대소무자, 숫자만 입력가능합니다 ");
				return false;
				
			}
		}
		
		if(userinput.pw.value.legth <4 || userinput.pw.value.length > 12){
			alert("비밀번호를 4~!2자 사이로 입력하세요");
			return false;
		}
		
		for(var i = 0; i  < userinput.name.value.length;i++){
			ch = userinput.name.value.charAt(i);
			if(!(ch>='a' && ch<= 'z') && !(ch>= 'A' && ch<= 'Z')){
				alert("이름은 한글로만 가능합니다");
				return false;
			}
		}
		
		if(userinput.birth.value.length != 6){
			alert("생년월일 6자를 입력하세요");
			return false;
		}
		
		for(var i = 0; i < userinput.birth.value.length;i++){}
			ch = userinput.birth.value.charAt(i);
			if(!(ch >= '0' && ch <= '9')){
				alert("생년 월일은 숫자로만 입력 가능합니다.");
				return false;
			}
		}
	}
</script>
-->
<body>
 <%@ include file="/etc/mainTop.jsp" %>
<div id ="joinSection">
	<div id ="join">
	<form action="modifyPro.do" method="post">
	<table style="margin-top:50px;">
		<tr>
			<td colspan="2" class="sub">회원 정보 수정</td>
		</tr>
		<tr>
			<td style="height:40px;"></td>
		</tr>
		<c:forEach items="${info}" var="dto">
		<tr>
			<td class="td1">아이디</td>
			<td class="td2">${dto.id}</td>
		</tr>
		<tr>
			<td class="td1">비밀번호</td>
			<td class="td2">
				<input type="password" name="pw" size="60" maxlength="12" value="${dto.pw }" required>
			</td>
		</tr>
		<tr>
			<td class="td1">이름</td>
			<td class="td2">
				<input type="text" name="name" size="60" maxlength="10" value="${dto.name}" required>
			</td>
		</tr>
		<tr>
			<td class="td1">이메일</td>
			<td class="td2">
				<input type="text" name="email" size="60" maxlength="30" value="${dto.email}" required>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td colspan="2" class="td2">
				<input type="submit" name="modifyform" value= "수 정" class="Btn">
				<input type="reset" name="reset" value="되돌리기" class="Btn">
				<input type="button" value="취 소" class="Btn" onclick="window.location='/CULTURESLOT/member/mypage.do'">
			</td>
		</tr>
	</table>
	</form>
	</div>
</div>
</body>
</html> 