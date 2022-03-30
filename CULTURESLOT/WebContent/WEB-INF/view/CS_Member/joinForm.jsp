<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<title>회원가입</title>


<script language="javascript">
	var userinput = eval("document.userinput");
	var ch ;
	function checkIt() {
	if (userinput.id.value == "" || 
			userinput.pw.value == "" || 
			userinput.name.value == "" ||
			userinput.gender.value == "" ||
			userinput.email.value == "" ||
			userinput.birth.value == "")
		alert("빈칸을 입력하세요");
		return false;
		
	}
	function openConfirmid(){
		var inputId = document.getElementById("id").value;
		if (inputId == ""){
			alert("아이디를 입력하세요");
			return;
		}
		uri = "confirmId.do?id="+inputId; 
		window.open(uri, "confirm", "toolbar=no,loction=no, srarus=no,menuber=no,scrollbars=no,resizable=no,width=350,height=270")
		
		
	}
	function sendId(id){
		opener.document.getElementById("id").value = document.getElementById("id").value;
	}
</script>
<body>
 <%@ include file="/etc/mainTop.jsp" %>
<section>
<div id ="joinSection">
	<h1 class="title">회원가입</h1>
			
	<div id ="join">
			
		<form method="post" action="joinPro.do" name="userinput" onSubmit="return checkIt()">
			<table>
				<tr>
					<td colspan="2" class="empty"></td>
				</tr>
				<tr>
					<td colspan="2" class="sub">
						- 회원 정보 입력 -
					</td>
				</tr>
				<tr>
					<td colspan="2" class="empty"></td>
				</tr>
				<tr>
					<td class="td1">아이디</td>
					<td class="td2">
						<input type="text" id="id" name="id" size="60" maxlength="12" placeholder="4~12자리 문자와  숫자 " required>
						<input type="button" name="confirm_id" value="아이디 중복확인" 
							class="Btn" onClick="openConfirmid()">
					</td>
				</tr>
				<tr>
					<td class="td1">비밀번호</td>
					<td class="td2">
						<input type="password" name="pw" size="60" maxlength="12" required>
					</td>
				<tr>
					<td class="td1">이름</td>
					<td class="td2"> 
						<input type="text" name="name" size="60" maxlength="10" required>
					</td>
				</tr>
				<tr>
					<td class="td1">성별</td>
					<td class="td2">
						&nbsp;
						<input type="radio" name="gender" value="남성"  class="select" required/>남
						&nbsp;
						<input type="radio" name="gender" value="여성"  class="select"/>여
					</td>
				</tr>
				<tr>
					<td class="td1">이메일</td>
					<td class="td2">
						<input type="text" name="email" size="60"	 
							maxlength="30" required>
					</td>
				</tr>
				<tr>
					<td class="td1">출생년도</td>
					<td class="td2">
						<select name = "birth">
							<c:forEach begin="1960" end = "2020" step="1" var="y">
								<option value="${y}">${y}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr style="height:40px;">
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" value = "x" name="key" class="Btn"/>
						<input type="submit" value = "회원가입" class="Btn"/>
					</td>
				</tr>
		  </table>
		 </form>
	</div>
</div>
</section>
</body>		
</html>