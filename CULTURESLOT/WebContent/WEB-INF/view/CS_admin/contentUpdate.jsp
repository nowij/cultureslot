<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 콘텐츠 수정</title>
<style>
#contentForm{
	width:60%;
	margin:0 auto;
	margin-top:120px;
	text-align:center;
}
#contentForm table.form{
	width:600px;
	margin:0 auto;
	margin-top:60px;
	font-family:'나눔바른고딕';

}
#contentForm table.form td{
	height:40px;
}
#contentForm table.form td.sub{
	width:100px;
	background-color:#000000;
	color:#ffffff;
	font-weight:bold;
	text-align:left;
	padding-left:10px;
	border-radius:10px;
	font-size:12pt;
}
#contentForm table.form select{
	height:40px;
	font-size:12pt;
	width:98%;
	border:1px solid #BDBDBD;
	border-radius:10px;
}
#contentForm table.form input{
	width:98%;
	height:98%;
	border:1px solid #BDBDBD;
	resize:none;
	border-radius:10px;
	font-size:12pt;
	font-family:'나눔바른고딕';
}
#contentForm table.form td.textarea{
	height:200px;
}
#contentForm table.form textarea{
	width:98%;
	height:98%;
	border:1px solid #BDBDBD;
	border-radius:10px;
	resize:none;
}
</style>
</head>
<%@ include file="/etc/adminTop.jsp" %>
<body>
 <div id ="contentForm">
	 <h1>- 콘텐츠 수정 -</h1>
<c:forEach items="${listSelect}" var="select">
<form method="post" action="contentUpdatePro.do" enctype="multipart/form-data">
<input type="hidden" name="content_num" value="${select.content_num }"/>
<input type="hidden" name="category" value="${select.category}"/>
	<table class="form">
	<tr>
		<th colspan="4" 
		style="height:40px;font-size:16pt;background-color:#000000;color:#ffffff;border-radius:10px;">
		${select.category}</th>
	</tr>
	<tr style="height:40px;">
		<td></td>
	</tr>
	<tr>
		<td class="sub">연도</td>
		<td>
			<select name="year">
					<option value="${select.year}">${select.year}</option>
				<c:forEach begin="0" end="60" step="1" var="startYear">
					<c:set var="y" value="${2020- startYear }"/>
					<option value="${y}">${y}</option>
				</c:forEach>
			</select>
		</td>
		<c:if test="${select.category ne '애니메이션' }">
		<td class="sub">
			<c:if test="${select.category eq '음악' }">판매량</c:if>
			<c:if test="${select.category eq '영화'}">관객 수</c:if>
			<c:if test="${select.category eq '드라마'}">시청률</c:if>
		</td>
			<td><input type="text" name="amount" value="${select.amount}"/></td>
		</c:if>
	</tr>
	<tr>
		<td class="sub">
			<c:if test = "${ select.category eq '음악' }">발매일</c:if>
		 	<c:if test = "${ select.category eq '영화' }">개봉일</c:if>
		 	<c:if test = "${ select.category eq '드라마'}">방송 기간</c:if>
		 	<c:if test = "${ select.category eq '애니메이션' }">첫 방영일</c:if>
		</td>
		<td><input type="text" name="release_date" value="${select.release_date}"/></td>
		<td class="sub">장르 </td>
		<td><input type="text" name="genre" value="${select.genre}"/></td>	
	</tr>
	<tr>
		<td class="sub">제목</td>
		<td><input type="text" name="title" value="${select.title}"/></td>
		<td class="sub">
			<c:if test = "${select.category eq '음악' }">아티스트</c:if>
		 	<c:if test = "${select.category eq '영화' }">감독</c:if>
		 	<c:if test = "${select.category eq '드라마'}">연출</c:if>
		 	<c:if test = "${select.category eq '애니메이션'}">연출</c:if>
		 </td>
		<td><input type="text" name="creator" value="${select.creator}"/></td>
	</tr>
	<tr>
		<td class="sub">연령 등급</td>
		<td>
		<c:if test="${select.category=='음악' }">
			<select name="grade">
				<option>전체</option>
				<option>19세</option>
			</select>
		</c:if>
		<c:if test="${select.category!='음악' }">
			<select name="grade">
				<option>${select.grade}</option> 
				<option>전체 연령가</option>
				<option>12세</option>
				<option>15세</option>
				<option>19세</option>
			</select>
		</c:if>
		</td>
		<td class="sub">국가</td>
		<td>
			<select name="country_category" style="width:80px;">
				<option>${select.country_category}</option>
				<option>국내</option>
				<option>해외</option>
			</select>
		/&nbsp;<input type="text" name="country_name" 
			value="${select.country_name}"required style="width:80px;"/>
		</td>
	</tr>
	<tr>
		<td class="sub">이미지</td>
		<td colspan="3"><input type="file" name="titleimage"/>
		<input type="hidden" name="title_image"> </td>
	</tr>
	<c:if test="${select.category ne '음악'}">
	<tr>
		<td class="sub">런타임</td>
		<td>
			<input type="text" name="runtime" value="${select.runtime }"/>
		</td>
		<td class="sub">부작</td>
		<td><input type="text" name="trilogy" value="${select.trilogy }"/></td>
	</tr>
	</c:if>
	<c:if test="${select.category eq '음악' }">
	<tr>
		<td class="sub">앨범명</td>
		<td><input type="text" name="album_title" value="${select.album_title}"/></td>
		<td class="sub">앨범형태</td>
		<td><input type="text" name="album_type" value="${select.album_type}"/></td>
	</tr>
	</c:if>
	<tr>
		<td class="sub">
			<c:if test="${select.category eq '음악' }">기획사</c:if>
			<c:if test="${select.category ne '음악' }">제작사</c:if>
		</td>
		<td><input type="text" name="production" value="${select.production }"/></td>
		
		<td class="sub">
			<c:if test="${select.category eq '음악' }">발매사</c:if>
			<c:if test="${select.category ne '음악' }">배급사</c:if>
		</td>
		<td><input type="text" name="distribution" value="${select.distribution }"/></td>
	</tr>
	<tr>
		<td class="sub">
			<c:if test="${select.category eq '음악' }">곡 소개</c:if>
			<c:if test="${select.category ne '음악' }">줄거리</c:if>
		</td>
		<td colspan="3"class="textarea">
			<textarea name="introduction">${select.introduction}</textarea></td>
	</tr>
	
	<tr>
		<td class="sub">
			<c:if test="${select.category eq '음악' }">가사</c:if>
			<c:if test="${select.category ne '음악' }">
					<c:if test="${select.category ne '애니메이션' }">출연진</c:if>
					<c:if test="${select.category eq '애니메이션' }">등장인물</c:if>
			</c:if>
		</td>
		<c:if test="${select.category eq '음악' }">
		<td colspan="3" class="textarea">
			<textarea name="lyrics">${select.lyrics}</textarea>
		</td>
		</c:if>
		<c:if test="${select.category ne '음악' }">
		<td colspan="3" class="textarea">
			<textarea name="cast">${select.cast}</textarea>
		</td>
		</c:if>
	</tr>
	<c:if test="${select.category ne '음악' }">
	<tr>
		<td class="sub">시리즈</td>
		<td colspan="3"class="textarea">
			<textarea name="series">${select.series}</textarea>
		</td>
	</tr>
	</c:if>
	<tr>
		<td class="sub">대표 영상</td>
		<td colspan="3"><input type="text" name="video" value="${select.video}"/></td>
	</tr>
	<tr>
		<!-- 런타임 : <input type="text" name="runtime"/>-->
		<td class="sub">리메이크</td>
		<td colspan="3"><textarea name="remake">${select.remake}</textarea></td>
		<!--  캐스팅 : <input type="text" name="cast"/>-->
	</tr>
	<tr>
		<c:if test="${select.category eq '음악' }">
			<td class="sub">작사/작곡</td>
			<td colspan="3"><textarea name="staff">${select.staff}</textarea></td>
		</c:if>
		<c:if test="${select.category ne '음악' }">
			<td class="sub">제작진</td>
			<td colspan="3" class="textarea">
				<textarea name="staff">${select.staff}</textarea></td>
		</c:if>
	</tr>
	<tr>
		<td class="sub">
			<c:if test="${select.category eq '음악' }">앨범 수록곡</c:if>
			<c:if test="${select.category ne '음악' }">사운드 트랙</c:if>
		</td>
		<td colspan="3" class="textarea">
			<textarea name="soundtrack">${select.soundtrack}</textarea></td>
	</tr>
	<tr>
		<td class="sub">관련 영상</td>
		<td colspan="3"><input type="text" name="ref_video" value="${select.ref_video}"/></td>
	</tr>
	<c:if test="${select.category!='애니메이션' }">
	<tr>
		<td class="sub">수상 이력</td>
		<td colspan="3" class="textarea">
			<textarea name="awards">${select.awards}</textarea></td>
	</tr>
	</c:if>
	<tr style="height:40px;">
		<td></td>
	</tr>
	<tr>
		<td colspan="4" style="text-align:center;">
			<input type="submit" value="수정"
				style="background-color:#000000;color:#ffffff;"/></td>
	</tr>
	</table>
</form>
</c:forEach>
</div>
</body>
</html>