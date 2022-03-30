<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 콘텐츠 등록</title>
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

<body>
<%@ include file="/etc/adminTop.jsp" %>
 <div id ="contentForm">
	 <h1>- 콘텐츠 등록 -</h1>
	<form method="post" action="contentPro.do" enctype="multipart/form-data">
		<input type="hidden" name="category" value="${category}"/>
	
	<table class="form">
	<tr>
		<th colspan="4" 
		style="height:40px;font-size:16pt;background-color:#000000;color:#ffffff;border-radius:10px;">
		${category}</th>
	</tr>
	<tr style="height:40px;">
		<td></td>
	</tr>
	<tr>
		<td class="sub">연도</td>
		<td>
			<select name="year">
				<c:forEach begin="0" end="60" step="1" var="startYear">
					<c:set var="y" value="${2020- startYear }"/>
					<option value="${y}">${y}</option>
				</c:forEach>
			</select>
		</td>
		<c:if test="${category ne '애니메이션' }">
		<td class="sub">
			<c:if test="${category eq '음악' }">판매량</c:if>
			<c:if test="${category eq '영화'}">관객 수</c:if>
			<c:if test="${category eq '드라마'}">시청률</c:if>
		</td>
			<td><input type="text" name="amount"/></td>
		</c:if>
	</tr>
	<tr>
		<td class="sub">
			<c:if test = "${ category eq '음악' }">발매일</c:if>
		 	<c:if test = "${ category eq '영화' }">개봉일</c:if>
		 	<c:if test = "${ category eq '드라마'}">방송 기간</c:if>
		 	<c:if test = "${ category eq '애니메이션' }">첫 방영일</c:if>
		</td>
		<td><input type="text" name="release_date"/></td>
		<td class="sub">장르 </td>
		<td><input type="text" name="genre"/></td>	
	</tr>
	<tr>
		<td class="sub">제목</td>
		<td><input type="text" name="title"/></td>
		<td class="sub">
			<c:if test = "${ category eq '음악' }">아티스트</c:if>
		 	<c:if test = "${ category eq '영화' }">감독</c:if>
		 	<c:if test = "${ category eq '드라마'}">연출</c:if>
		 	<c:if test = "${ category eq '애니메이션'}">연출</c:if>
		 </td>
		<td><input type="text" name="creator"/></td>
	</tr>
	<tr>
		<td class="sub">연령 등급</td>
		<c:if test="${category=='음악' }">
		<td>
			<select name="grade">
				<option>전체</option>
				<option>19세</option>
			</select>
		</td>
		</c:if>
		<c:if test="${category!= '음악' }">
		<td>
			<select name="grade">
				<option>전체 연령가</option>
				<option>12세 이상</option>
				<option>15세 이상</option>
				<option>19세</option>
			</select>
		</td>
		</c:if>
		<td class="sub">국가</td>
		<td>
			<select name="country_category" style="width:80px;">
				<option>국내</option>
				<option>해외</option>
			</select>
		/&nbsp;<input type="text" name="country_name" required style="width:80px;"/>
		</td>
	</tr>
	<tr>
		<td class="sub">이미지</td>
		<td colspan="3"><input type="file" name="titleimage"/></td>
	</tr>
	<c:if test="${category ne '음악'}">
	<tr>
		<td class="sub">런타임</td>
		<td>
			<input type="text" name="runtime"/>
		</td>
		<td class="sub">부작</td>
		<td><input type="text" name="trilogy"/></td>
	</tr>
	</c:if>
	<c:if test="${category eq '음악' }">
	<tr>
		<td class="sub">앨범명</td>
		<td><input type="text" name="album_title"/></td>
		<td class="sub">앨범형태</td>
		<td><input type="text" name="album_type"/></td>
	</tr>
	</c:if>
	<tr>
		<td class="sub">
			<c:if test="${category eq '음악' }">기획사</c:if>
			<c:if test="${category ne '음악' }">제작사</c:if>
		</td>
		<td><input type="text" name="production"/></td>
		
		<td class="sub">
			<c:if test="${category eq '음악' }">발매사</c:if>
			<c:if test="${category ne '음악' }">배급사</c:if>
		</td>
		<td><input type="text" name="distribution"/></td>
	</tr>
	<tr>
		<td class="sub">
			<c:if test="${category eq '음악' }">앨범 소개</c:if>
			<c:if test="${category ne '음악' }">줄거리</c:if>
		</td>
		<td colspan="3" class="textarea">
			<textarea name="introduction"></textarea>
		</td>
	</tr>
	<tr>
		<c:if test="${category eq '음악' }">
			<td class="sub">가사</td>
			<td colspan="3" class="textarea">
				<textarea name="lyrics"></textarea>
			</td>
		</c:if>
		<c:if test="${category ne '음악' }">
			<td class="sub">
				<c:if test="${category ne '애니메이션' }">출연진</c:if>
				<c:if test="${category eq '애니메이션' }">등장인물</c:if>
			</td>
			<td colspan="3" class="textarea">
				<textarea name="cast"></textarea>
			</td>
		</c:if>
	</tr>
	<c:if test="${category ne '음악' }">
	<tr>
		<td class="sub">시리즈</td>
		<td colspan="3" class="textarea">
			<textarea name="series"></textarea>
		</td>
	</tr>
	</c:if>
	<tr>
		<td class="sub">대표 영상</td>
		<td colspan="3"><input type="text" name="video"/></td>
	</tr>
	<tr>
		<!-- 런타임 : <input type="text" name="runtime"/>-->
		<td class="sub">리메이크</td>
		<td colspan="3" class="textarea">
			<textarea name="remake"></textarea>
		</td>
		<!--  캐스팅 : <input type="text" name="cast"/>-->
	</tr>
	<tr>
		<td class="sub">
			<c:if test="${category eq '음악' }">작사/작곡/편곡</c:if>
			<c:if test="${category ne '음악' }">제작진</c:if>
		</td>
		<td colspan="3" class="textarea">
			<textarea name="staff"></textarea>
		</td>
	</tr>
	<tr>
		<td class="sub">
			<c:if test="${category eq '음악' }">앨범 수록곡</c:if>
			<c:if test="${category ne '음악' }">사운드 트랙</c:if>
		</td>
		<td colspan="3" class="textarea">
			<textarea name="soundtrack"></textarea>
		</td>
	</tr>
	<tr>
		<td class="sub">관련 영상</td>
		<td colspan="3"><input type="text" name="ref_video"/></td>
	</tr>
	<tr>
		<td class="sub">수상 이력</td>
		<td colspan="3" class="textarea">
			<textarea name="awards"></textarea>
		</td>
	</tr>
	<tr>
		<td style="height:40px;"></td>
	</tr>
	<tr>
		<td colspan="4" style="text-align:center;height:50px;">
			<input type="submit" value="등록"
				 style="background-color:#000000;color:#ffffff;"/></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>