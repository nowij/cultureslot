<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 공지사항 목록</title>
<style>
	div.section {
		margin-top: 120px;
	}
	table.list{
		margin:0 auto;
		width:800px; height:auto;
		text-align:center;
	}
	table.list td{
		height:30px;
		font-family:'나눔바른고딕';
	}
	table.list td.title{
		height:50px;
		font-size:30px;
		font-weight:bold;
		background-color:#3b3a39;
		border-radius: 10px;
		color:#ffffff;
	}
	table.list td.td1{
		font-size:20px;
		background-color:#3b3a39;
		color:#ffffff;
		border-radius:5px;
	}
	table.list td.td2{
		border:1px solid #BDBDBD;
		border-radius:5px;
	}
	table.list #textarea{
		width:98%; 
		height:400px;
		border:none;
		resize:none;
	}
	table.list td.BtnArea{
		width:100px; height:40px;
	}
	table.list input.submitBtn{
		width:100px; height:30px;
		text-align:center;
		font-family:'나눔바른고딕';
		font-size:10pt;
		border:1px solid #ffffff;
		border-radius:10px;
		background-color:#3b3a39;
		color:#ffffff;
	}
	table.list input.buttonBtn{
		width:40px; height:40px;
		font-family:'나눔바른고딕';
		text-align:center;
		font-size:10pt;
		border:1px solid #BDBDBD;
		border-radius:10px;
		background-color:#ffffff;
		color:#3b3a39;
	}
	table.list #no{
		width:100px;
	}
	table.list #subject{
	
	}
	table.list #reg{
		width:140px;
	}
	table.list #btnarea{
		width:100px;
	}
</style>
</head>
<body>
 <%@ include file="/etc/adminTop.jsp" %>
 <div class="section">
	<table class ="list">
		<tr>
			<td colspan="4" class="title">공지사항</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="공지사항 등록" class="submitBtn"
					onclick="javascript:window.location='noticeForm.do'">
			</td>
		</tr>
		<tr height="40px">
			<td class="td1" id ="no">NO.</td>
			<td class="td1" id ="subject">제목</td>
			<td class="td1" id ="reg">등록일</td>
			<td class="td1" id ="btnarea">수정/삭제</td>
		</tr>
	<c:if test="${count == 0 }">
		<tr>
			<td colspan="4">등록된 공지가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${count > 0 }">
		<c:forEach items="${noticeList}" var="list">
		<tr>
			<td class="td2">${number}</td>
			<td class="td2">
				<a href="noticeAdminContent.do?n_num=${list.n_num}">
					${list.n_subject}
				</a>
			</td>
			<td class="td2"><fmt:formatDate value="${list.n_reg}" type="both" pattern="yyyy.MM.dd"/></td>
			<td class="td2">
				<input type="button" value="수정" class="buttonBtn" 
					onclick="javascript:window.location='noticeModifyForm.do?n_num=${list.n_num}'">
				<input type="button" value="삭제" class="buttonBtn" 
					onclick="javascript:window.location='noticeDeleteForm.do?n_num=${list.n_num}'">
			</td>
		</tr>
			<c:set var="number" value="${number+1}"/>
		</c:forEach>
		<tr>
			<td colspan="4" >
				<c:if test="${noticeStartPage > 10}">
					<a href="noticeAdminList.do?pageNum=${noticeStartPage - 10}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${noticeStartPage}" end="${noticeEndPage}">
					<a href="noticeAdminList.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${noticeEndPage < noticePageCount}">
					<a href="noticeAdminList.do?pageNum=${noticeStartPage + 10}">다음</a>
				</c:if>
			</td>
		</tr>
	</c:if>
	</table>
</div>	
</body>
</html>