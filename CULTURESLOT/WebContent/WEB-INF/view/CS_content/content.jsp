<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
 <%@ include file="/etc/mainTop.jsp" %>
<body>
<c:forEach items="${content }" var="content">
 <section>
 	<div class="title_box">
 		<h1 class="title">${content.year} / ${content.category}</h1>
 	</div>
 <div id ="contentSection">
 	<div class="title_box">
 		<h1 class="title">[ ${content.title} ]</h1>
 	</div>
 	<div class="content_box">
		<table class="basicInfo">
 			<tr>
 				<td colspan="3" class="scrapeField">
 					<form action = "/CULTURESLOT/CS_scrape/scrapePro.do" method = "post">
	 					<input type = "submit"  value = "스크랩" class="submitBtn"  />
 						<input type = "hidden" name = "content_num" value = "${content.content_num}" />
						<input type = "hidden" name = "category" value = "${content.category}" />
						<input type = "hidden" name = "title" value = "${content.title}" />
						<input type = "hidden" name = "img" value = "${content.title_image}" />
						<input type = "hidden" name = "year" value = "${content.year}" />
 					</form>
 				</td>
 			</tr>
 			<tr>
 				<td colspan="3" class="sub">[ 기본 정보 ] </td>
 			</tr>
 			<tr>
	 			<c:if test = "${ content.category eq '음악' }"><td rowspan="12"></c:if>
	 			<c:if test = "${ content.category eq '영화' }"><td rowspan="10">	</c:if>
	 			<c:if test = "${ content.category eq '드라마' }"><td rowspan="10"></c:if>
	 			<c:if test = "${ content.category eq '애니메이션' }"><td rowspan="10"></c:if>
	 			<!-- 0626 지원 수정 -->
		 		<img src="${content.title_image}" style="width:410px;height:410px;"/>
 				<td class="sub">타이틀</td>
				<td class="info">${content.title}</td>
 			</tr>
 			<tr>
	 			<td class="sub">
		 			<c:if test = "${ content.category eq '음악' }">아티스트</c:if>
		 			<c:if test = "${ content.category eq '영화' }">감독</c:if>
		 			<c:if test = "${ content.category eq '드라마'}">연출</c:if>
		 			<c:if test = "${ content.category eq '애니메이션'}">연출</c:if>
	 			</td>
	 			<td class="info">
	 				${content.creator}
	 			</td>
 			</tr>
 			 <tr>
	 			<td class="sub">
		  			<c:if test = "${ content.category eq '음악' }">발매일</c:if>
		 			<c:if test = "${ content.category eq '영화' }">개봉일</c:if>
		 			<c:if test = "${ content.category eq '드라마'}">방송 기간</c:if>
		 			<c:if test = "${ content.category eq '애니메이션' }">첫 방영일</c:if>
	 			</td>
	 			<td class="info">
	 				${content.release_date} 
	 			</td>
 			</tr>
 			<tr>
 				<td class="sub">장르</td>
 				<td class="info">${content.category}</td>
 			</tr>
		<c:if test = "${ content.category eq '음악'}">
			<tr>
				<td class="sub">작사 / 작곡</td>
				<!-- 0619 지원 수정 -->
				<td class="info">${fn:replace(content.staff,"@","<br/>") }</td>
			</tr>
 			<tr>
 				<td class="sub">앨범 형태</td>
 				<td class="info">${content.album_type}</td>
 			</tr>
 			<tr>
 				<td class="sub">앨범명</td>
 				<td>${content.album_title}</td>
 			</tr>
 		</c:if>
 			<!-- 0626 지원 수정 -->
 		<c:if test="${content.category ne '애니메이션' }">
	 	<c:if test="${content.amount != '-'}">
	 		<tr>
		 		<td class="sub">
			 		<c:if test = "${ content.category eq '음악' }">음반 판매량</c:if>
			 		<c:if test = "${ content.category eq '영화' }">관객 수</c:if>		
			 		<c:if test = "${ content.category eq '드라마' }">시청률</c:if>	
				</td>
				<td class="info">
			 			${content.amount}
				 	<c:if test = "${ content.category eq '음악' }"> 장 </c:if>	
			 		<c:if test = "${ content.category eq '영화' }"> 명</c:if>		
			 		<c:if test = "${ content.category eq '드라마' }"></c:if>
				 </td>
		 	</tr>
		</c:if>
		</c:if>
	 		<tr>
	 			<td class="sub">
					<c:if test = "${ content.category eq '음악' }">등급</c:if>
			 		<c:if test = "${ content.category eq '영화' }">상영 등급</c:if>
		 			<c:if test = "${ content.category eq '드라마' }">시청 등급</c:if>
		 			<c:if test = "${ content.category eq '애니메이션' }">시청 등급</c:if>
	 			</td>
	 			<td class ="info">
	 				${content.grade}
	 			</td>
	 		</tr>
	 	<c:if test = "${content.category ne '음악'}">
	 		<tr>
		 		<td class="sub">
			 		<c:if test = "${ content.category eq '영화' }">상영시간</c:if>
					<c:if test = "${ content.category eq '드라마' }">방송 시간</c:if>
					<c:if test = "${ content.category eq '애니메이션' }">방송 시간</c:if>
				</td>
			 	<td class="info">
			 		${content.runtime}
			 	</td>
			</tr>
		</c:if>
		<c:if test = "${content.category eq '애니메이션'}">
			<tr>
				<td class="sub">방송 부작</td>
				<td class="info">${content.trilogy}</td>
			</tr>
		</c:if>
			<tr>
				<td class="sub">국적</td>
				<td class="info">
					${content.country_category} / ${content.country_name}
				</td>
			</tr>
			<tr>
				<td class="sub">
		 			<c:if test = "${ content.category eq '음악' }">기획사</c:if>
					<c:if test = "${ content.category eq '영화' }">제작사</c:if>
		 			<c:if test = "${ content.category eq '드라마'}">제작사</c:if>
		 			<c:if test = "${ content.category eq '애니메이션' }">제작사</c:if>
		 		</td>
	 			<td class="info">
	 				${content.production}
	 			</td>
	 		</tr>
 			<tr>
	 			<td class="sub">
		 			<c:if test = "${ content.category eq '음악' }">발매사</c:if>
		 			<c:if test = "${ content.category eq '영화' }">배급사</c:if>
		 			<c:if test = "${ content.category eq '드라마' }">방송사</c:if>
		 			<c:if test = "${ content.category eq '애니메이션' }">방송사</c:if>
	 			</td>
 				<td class="info">${content.distribution}</td>
 			</tr>
 			<tr>
 			</tr>
 		<c:if test="'${content.introduction!='-' }">
 			<tr>
	 			<td colspan="3" class="sub">
		 			<c:if test = "${ content.category eq '음악' }">[ 곡 소개 ]</c:if>
		 			<c:if test = "${ content.category eq '영화' }">[ 시놉시스 ]</c:if>
		 			<c:if test = "${ content.category eq '드라마'}">[ 줄거리 ]</c:if>
		 			<c:if test = "${ content.category eq '애니메이션'}">[ 줄거리 ]</c:if>
		 		</td>
 			</tr>
 			<tr>
 			<!-- 0619 지원 수정 -->
				<td colspan="3" class="textarea">${fn:replace(content.introduction,"@","<br/>") }</td>
 			</tr>
 		</c:if>
 			
		 <c:if test = "${ content.category eq '음악' }">
 			<tr>
 				<td colspan="3" class="sub">[ 가사 ]</td>
 			</tr>
 			<tr>
 			<!-- 0619 지원 수정 -->
 				<td colspan="3" class="textarea">${fn:replace(content.lyrics,"@","<br/>") }</td>
 			</tr>
 			<c:if test = "${content.soundtrack != '-'}">
			<tr>
				<td colspan="3" class="sub">[ 앨범 수록곡 ]</td>
			 <tr>
			 <!-- 0619 지원 수정 -->
				<td colspan="3" class="textarea">${fn:replace(content.soundtrack,"@","<br/>") }</td>
 			</tr>
			 </c:if>
		</c:if>
		 			<tr>
				<td colspan="3" class="sub">
		 			<c:if test = "${ content.category eq '음악' }">[ MV ]</c:if>
		 			<c:if test = "${ content.category eq '영화' }">[ 예고편 ]</c:if>
		 			<c:if test = "${ content.category eq '드라마'}">[ 예고편 ]</c:if>
		 			<c:if test = "${ content.category eq '애니메이션' }">[ 예고편 ]</c:if>
	 			</td>
 			</tr>
 			<!-- 0626 지원 수정 -->
 			<tr>
				<td colspan="3" class="textarea" align="center">
					<iframe width="700" height="355" 
						src="https://www.youtube.com/embed/${content.video}" 
						frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
					</iframe>						
				</td>
 			</tr>
		
		<c:if test ="${ content.category ne '음악' }">
		<c:if test="${content.cast!='-' }">
			<tr>
				<td colspan="3" class="sub">[ 출연진 ]</td>
			 <tr>
				<td colspan="3" class="textarea">${fn:replace(content.cast,"@","<br/>") }</td>
 			</tr>
 		</c:if>
 		
 		<c:if test="${content.staff!='-' }">	
 			<tr>
				<td colspan="3" class="sub">
		 			<c:if test = "${ content.category eq '영화' }">[ 제작진 ]</c:if>
		 			<c:if test = "${ content.category eq '드라마'}">[ 제작진 ]</c:if>
		 			<c:if test = "${ content.category eq '애니메이션' }">[ 제작진 ]</c:if>
	 			</td>
 			</tr>
 			<tr>
				<td colspan="3" class="textarea">${fn:replace(content.staff,"@","<br/>") }</td>
 			</tr>
 		</c:if>
 		<c:if test = "${content.series eq null || content.series ne '-' }">
				<tr>
					<td colspan="3" class="sub">
			 			<c:if test = "${ content.category eq '영화' }">[ 시리즈 ]</c:if>
			 			<c:if test = "${ content.category eq '드라마'}">[ 제작진 ]</c:if>
			 			<c:if test = "${ content.category eq '애니메이션' }">[ 제작진 ]</c:if>
		 			</td>
		 		</tr>
		 		<tr>
					<td colspan="3" class="textarea">${content.series}</td>
	 			</tr>
 		</c:if>
 		</c:if>
 		
 		<!-- 0619 은솔 수정 -->
 		<c:if test="${ content.category ne '음악'}">
		<c:if test = "${content.soundtrack eq null || content.soundtrack ne '-'}">
 			<tr>
	 			<td colspan="3" class="sub">
	 				<c:if test = "${ content.category eq '영화' }">[ OST / SoundTrack ]</c:if>
	 				<c:if test = "${ content.category eq '드라마' }">[ OST ]</c:if>
	 				<c:if test = "${ content.category eq '애니메이션' }">[ OSt ]</c:if>
		 		</td>
	 		</tr>
	 		<tr>
	 			<td colspan="3" class="textarea">${fn:replace(content.soundtrack,"@","<br/>") }</td>
 			</tr>
 		</c:if>
 		</c:if>
 		<!-- 0626 지원 수정 -->
		<c:if test = "${content.awards != '-' && content.category !='애니메이션'}">
 			<tr>
				 <td colspan="3" class="sub">[ 수상 내역 ]</td>
 			</tr>
 			<tr>
 				<td colspan="3" class="textarea">${fn:replace(content.awards,"@","<br/>") }</td>
 			</tr>
 		</c:if>
 		<!-- 0626 지원 수정 -->
		<c:if test = "${content.remake != '-'}">
 			<tr>
 				<td colspan="3" class="sub">[ REMAKE ]</td>
 			</tr>
 			<tr>
				<td colspan="3" class="textarea">${content.remake}</td>
 			</tr>
		</c:if>
		
		<c:if test = "${content.ref_video eq null || content.ref_video ne '-'}">
 			<tr>
				<td colspan="3" class="sub">[ Another Video ]</td>
 			<tr>
 				<!-- 0619지원 수정 -->
 				<c:if test = "${content.category eq '음악' }">
					<td colspan="3" class="textarea"><a href="${content.ref_video}">관련 영상 보러가기</a></td>
				</c:if>
				<c:if test = "${content.category ne '음악' }">
					<td colspan="3" class="textarea"><a href="https://www.youtube.com/watch?v=${content.ref_video}">관련 영상 보러가기</a></td>
				</c:if>
 			</tr>
 		</c:if>
 		</table>
 	</div>
 	<input type="button" value="목록으로" class="listBtn" onclick="window.location='/CULTURESLOT/CS_content/genreList.do?year=${content.year}&genre=${content.category}'"/>
</div>

<div id ="commentSection">
	<div class="content_box">
		<table class="comment">
		<c:if test="${id == null }">
			<tr>
				<td colspan="4" id ="if">자유롭게 댓글을 남겨보세요.<br><br>댓글을 남기려면 
				<!-- 0626 지원 수정 -->
					<a href="../member/loginForm.do"><font color="#2E64FE">로그인</font></a>이 필요합니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${id != null}">
			<tr>
				<td colspan="4" class="sub">댓글 달기</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
			<!-- 0704 지원수정 -->
			<form action="commentPro.do" method="post" name="commentWrite">
					<input type="hidden" name="year"  value="${content.year}"/>
					<input type="hidden" name="content_num"  value="${content.content_num }"/>
					<input type="hidden" name="category"  value="${content.category}"/>
					<input type="hidden" name="title"  value="${content.title}"/>
					<input type="hidden" name="id"  value="${id}"/>
				<td class="writer">${id}</td>
				<td class="textfield">
					<textarea name="content" id="textarea"></textarea>
				</td>
				<td id ="btnField" colspan="3">
						<input type="submit" value="등록" class ="submitBtn">
				</td>
			</form>
			
			</tr>
		</c:if>
		</table>
	</div>
	
	<div class="content_box">
		<table class="comment">
	<c:forEach var="c" items="${list}">
	<form action="commentdeletePro.do" method="post">
		<c:if test="${c.category eq content.category && c.content_num eq content.content_num}">
			<tr>
				 <td class="writer">${c.id }</td>
				<%-- <td>num : ${c.comment_num }</td> --%>
				<td class="commentfield">${c.content }</td>
			<c:if test="${id eq c.id}">
						<input type="hidden" name="comment_num" value="${c.comment_num }"/>
						<input type="hidden" name="content_num" value="${c.content_num }"/>
						<input type="hidden" name="category" value="${c.category }"/>
						<input type="hidden" name="title" value="${c.title }"/>
						<input type="hidden" name="year" value="${c.year }"/>								
					<td id ="btnField">	
						<input type="submit" value="삭제" class="submitBtn"/>
					</td>
			</c:if>
				</tr>
			</c:if>
	</form>
	</c:forEach>
	</table>
</div>
</div>
</section>
</c:forEach>
</body>
</html>