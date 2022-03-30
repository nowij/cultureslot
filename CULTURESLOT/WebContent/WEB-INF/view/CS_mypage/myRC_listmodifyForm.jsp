<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>메인 : 자료 요청 수정 </title>
<style>
	#myRcMod{
		width:50%;
		margin:0 auto;
	}
	#myRcMod table.form {
		margin: 0 auto;
		margin-top:50px;
		width: 550px;
		height: auto;
		text-align: center;
	}
	table.form td {
		height: 30px;
		font-family: '나눔바른고딕';
		border-radius: 10px;
	}
	table.form td.title {
		height: 50px;
		font-size: 30px;
		font-weight: bold;
		background-color: #000000;
		color: #ffffff;
	}
	table.form td.td1 {
		width: 200px;
		font-size: 20px;
		background-color: #000000;
		color: #ffffff;
	}
	table.form #subject {
		width: 98%;
		height: 98%;
		border: 0;
	}
	table.form td.td2 {
		width: 300px;
		border: 1px solid #BDBDBD;
	}
	table.form #selectCategory {
		width: 98%;
		height: 100%;
		border: 1px solid #BDBDBD;
		border-radius:5px;
		text-align: center;
		font-family: '나눔바른고딕';
	}
	table.form #textarea {
		width: 98%;
		height: 400px;
		border: none;
		resize: none;
	}
	table.form td.BtnArea {
		height: 40px;
	}
	table.form input.submitBtn {
		width: 100px;
		height: 50px;
		font-family: '나눔바른고딕';
		font-size: 20px;
		border: 1px solid #ffffff;
		border-radius: 10px;
		background-color: #000000;
		color: #ffffff;
	}
	table.form input.buttonBtn {
		width: 100px;
		height: 50px;
		font-family: '나눔바른고딕';
		font-size: 20px;
		border: 1px solid black;
		border-radius: 10px;
		background-color: #ffffff;
		color: #000000;
	}
</style>
 </head>
 
 <script>
 function inputcheck(){
 		var myRc_list = eval("document.Rc_form");
 		if(myRC_list.title.value == ""){
 				alert("제목을 입력하세요")
 				return false
 		}
 		if(RC_form.pw.value=="") {
 			alert("비밀번호를 압력하세요")
 			return false
 		}
 } 
 </script>
 
 <body>
<%@ include file="/etc/mainTop.jsp" %>
<div id ="myRcMod">
<h3>나의 자료 요청</h3>
<hr>
	<c:forEach var="rc" items="${RCContent}">
		<form action="myRC_listmodifyPro.do?num=${rc.rc_num}" method="post"
			onSubmit="inputCheek()" name="myRC_list">
			<table class="form">
				<tr>
					<td colspan="4" class="title">- 자료 요청 수정 -</td>
				</tr>
				<tr>
					<td colspan="4"></td>
				</tr>
				<tr height="40px">
					<td class="td1">제목</td>
					<td class="td2" colspan="3">
						<input type="text" name="title"
							value="${rc.title}" id="subject"></td>
				</tr>

				<tr>
					<td class="td1">조회수</td>
					<td class="td2">${rc.hit}</td>
					<td class="td1">등록일자</td>
					<td class="td2">
						<fmt:formatDate value="${rc.reg_date}"
							type="both" pattern="yyyy.MM.dd HH:mm" /></td>
				</tr>
				<tr>
					<td class="td1">장르선택</td>
					<td class="td4">
						<select name="category" id="selectCategory">
							<option value="${rc.category}">${rc.category}</option>
							<option value="음악">음악</option>
							<option value="영화">영화</option>
							<option value="드라마">드라마</option>
							<option value="애니메이션">애니메이션</option>
						</select>
					<td class="td1">작성자</td>
					<td class="td2">${rc.id}</td>
				</tr>
				<tr>
					<td class="td1">내용</td>
					<td class="td2" colspan="3">
						<textarea id="textarea"name="content">${rc.content}</textarea>
					</td>
				</tr>
				<tr><td></td></tr>
				<tr>
					<td colspan="4" class="BinArea">
						<input type="submit"
							value="수정하기" class="submitBtn"> 
						<input type="button"
							value="목록으로" class="buttonBtn" onclick="myRC_list.do">
					</td>
				</tr>
			</table>
		</form>
	</c:forEach>
</div>
</body>
 </html>