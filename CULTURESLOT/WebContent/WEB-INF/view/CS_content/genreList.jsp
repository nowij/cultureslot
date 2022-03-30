<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Genre List</title>
  <style>
  	#selectListSection.selectListbox{
  		margin: 0 auto;
	    width:100%;
	    text-align:center;
  	}
  	#selectListSection .selectListbox ul{
	    height:30px;
	    margin: 0 auto;
	    width:50%;
	}
	#selectListSection .selectListbox li{
	    float:left;
	    width:100px;
	    height:30px;      
	    line-height:30px;          /* 중앙정렬 */
	    margin-right: 2px;
	    text-align: center;
	    color:#ffffff;
	    background-color: #3b3a39;
	    border-radius:3px 3px 0 0;
		cursor: pointer;
	}

  </style>
 </head>
 <!-- 0704 지원수정 -->
 <script>
 	function categoryClick(country){
 		if(country=='kor'){
 			location.href="genreList.do?year=${year}&country=국내&genre=${genre}";
 		}else{
 			location.href="genreList.do?year=${year}&country=해외&genre=${genre}";
 		}
 	}
 </script>
 <body>
<%@ include file="/etc/mainTop.jsp" %>
  <div class="title_box">
 	<h1 class="title">${year}년 / ${genre}</h1>
 </div>
 <div id ="selectListSection">
 
 	<c:if test="${list == null || count == 0}">
 <div class="selectListbox">
 	<ul>
	 		<li onclick="categoryClick('kor')">국내</li>
	 		<li onclick="categoryClick('en')">해외</li>
	 	</ul>
	 	<div class = "box" align="center">
	 		<p id ="msg"> 
	 			${ msg1 }<br><br>
	 				보고 싶은 콘텐츠를 <a href = "/CULTURESLOT/RC/RC_MainList.do">
	 			<b>${ msg2 } 게시판</b></a>에서 요청해주세요
	 		</p>	
		</div>
</div>
	</c:if>
	
 	<c:if test="${list != null && count > 0}">
 	 <div class="selectListbox">
	 	 <ul>
	 		<li onclick="categoryClick('kor')">국내</li>
	 		<li onclick="categoryClick('en')">해외</li>
	 	</ul>
 	 	<div class="box">
 	 	<c:set var="pageCount" value="0"/>
	 		<c:forEach var="genlist" items="${list}">
	 		<table class="genre">
	 		<c:if test="${pageCount==0 }">
				<tr>
			</c:if>	
					<td>
						<div class="ImageBox"  onclick="javascript:window.location.href='content.do?genre=${ genre }&year=${year }&title=${genlist.title }&num=${genlist.content_num }'">
							<input type="image" src="${genlist.title_image}" style="width:200px;height:200px;"/>
							<p class="title">
								<a href="content.do?genre=${ genre }&year=${year }&title=${genlist.title }&num=${genlist.content_num }">
									<b>${genlist.title}</b><br />
									${genlist.creator}
								</a>
							</p>
						</div>
						<c:set var="pageCount" value="${pageCount+1 }"/>
					</td>
			<c:if test="${pageCount==4 }">		
				</tr>
			</c:if>	
				</table>
			</c:forEach>
		</div>
	</div>
	</c:if>	
</div>
<div id="pageNumber">
		<!-- 0704 지원 수정 -->
		<c:if test="${startPage!=0 }">
			<c:if test="${startPage>10 }">
				<a href="/CULTURESLOT/CS_content/genreList.do?year=${year }&country=${country}&genre=${genre }&pageNum=${startPage-10 }">[이전]</a>
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
				<a href="/CULTURESLOT/CS_content/genreList.do?year=${year }&country=${country}&genre=${genre }&pageNum=${i}">[${i }]</a>
			</c:forEach>
		</c:if>
			<c:if test="${endPage < pageCount && endPage==10}">
				<a href="/CULTURESLOT/CS_content/genreList.do?year=${year }&country=${country}&genre=${genre }&pageNum=${startPage+10 }">[다음]</a>
			</c:if>
	</div>

 </body>
</html>
