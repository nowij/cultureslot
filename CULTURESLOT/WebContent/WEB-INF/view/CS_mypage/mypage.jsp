<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#mypage{
	width:53%; height:auto;
	margin:0 auto;
	font-family:'나눔바른고딕';
}

#mypage h3{
	margin:30 auto;
	font-size:20pt;
}
#mypage div.sec {
	margin:0 auto;
	margin-top:30px;
}
#mypage div.sec table{
	margin:0 auto;
	margin-bottom:30px;
	width:400px;
	text-align:center;
	float:left;
}
#mypage div.sec th{
	height:50px;
	font-size:14pt;
	text-align:left;
	padding-left:10px;
	border-bottom:3px solid #BDBDBD;
}
#mypage div.sec td{
	height:30px;
}
#mypage div.sec td.td1{
	background-color:#000000;
	color:#ffffff;
	font-weight:bold;
	border-radius:3px;
	height:40px;
}
#mypage div.sec h3{
	margin:30 auto;
}

#mypage input.btn2{
	width:120px;height:40px;
	background-color:#ffffff;
	color:#000000;
	border:1px solid #000000;
	border-radius:3px;
	font-size:12pt;
	font-family:'나눔바른고딕';
}
</style>
<title>마이페이지</title>
</head>
<%@ include file="/etc/mainTop.jsp"%>
<body>
<div id ="mypage">
	<h3>MY PAGE</h3>
	<hr>
	<div class="sec">
	<c:forEach items="${info}" var="dto">
		<table>
			<tr>
				<th colspan="2">회원 정보</th>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="td1">이름</td>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<td class="td1">아이디</td>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<td class="td1">비밀번호</td>
				<td>${dto.pw}</td>
			</tr>
			<tr>
				<td class="td1">이메일</td>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<td class="td1">성별</td>
				<td>${dto.gender}</td>
			</tr>
			<tr>
				<td class="td1">생년</td>
				<td>${dto.birth}</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="Button" value="회원정보변경" class="btn2"
					onclick="window.location='/CULTURESLOT/member/modify.do'">&nbsp;
					<input type="Button" value="회원탈퇴" class="btn2"
						onclick="window.location='/CULTURESLOT/member/deleteForm.do'">
				</td>
			</tr>
		</table>
	</c:forEach>
	</div>
	<div class="sec">
	<table style="width:200px;height:80px;">
		<tr>
			<th>자료요청 리스트</th>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td>
			<input type="button" value="나의 자료 요청" class="btn2"
					onclick="window.location ='/CULTURESLOT/member/myRC_list.do'" />
			</td>
		</tr>
	</table>
	<table style="width:200px;height:80px;">
		<tr>
			<th>스크랩 리스트</th>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="나의 스크랩" class="btn2"
					onclick="window.location ='/CULTURESLOT/CS_scrape/scrapeList.do'" />
			</td>
		</tr>
	</table>
	<table style="width:200px;height:80px;">
		<tr>
			<th>댓글 리스트</th>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="나의 댓글" class="btn2"
					onclick="window.location ='myCommentList.do'" />
			</td>
		</tr>
	</table>
	</div>
</div>
</body>
</html>