<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘텐츠 목록</title>
<style>
	#pageNumber{
	  		text-align:center;
	  	}
	#content{
		margin:0 auto;
		margin-top:120px;
		width:50%;
	}
	ul li{
		list-style-type: none;
	}
	#content .tab-box{
	    margin: 0 auto;
	    width:100%;
	    text-align:center;
	}
	#content h1{
		margin-bottom:50px;
	}
	#content .tab-box ul{
	    height:30px;
	    margin: 0 auto;
	    width:50%;
	    margin-bottom:50px;
	}
	#content .tab-box li{
	    float:left;
	    width:100px;
	    height:30px;      
	    line-height:30px;          /* 중앙정렬 */
	    margin-right: 2px;
	    text-align: center;
	    background-color: #585858;
	    border-radius:3px 3px 0 0;
		cursor: pointer;
	}
	#content .tab {
	  float: left;
	  width: 60%;
	  height: 100%;
	  border: none;
	  outline: none;
	  font-size: 16px;
	  font-weight: bold;
	  color: #fff;
	  background-color: #a6a6a6;
	  font-family:'나눔바른고딕';
	}
	#content .tab.active {
	  color: #000;
	  background-color: #fff;
	  border:1px solid #BDBDBD;
	  font-family:'나눔바른고딕';
	}
	#content  .tab-view{
		margin:0 auto;
		width:100%;
	}
	#content  .tab-view table.view{
		margin:0 auto;
		width:100%;
		font-family:'나눔바른고딕';
	}
	#content  .tab-view td{
		height:40px;
		border-radius:5px;
		word-break:keep-all;
	}
	#content  .tab-view td.cate{
		width:100px;
		font-weight:bold;
		text-align:center;
		color: #fff;
	 	background-color: #000000;
	 	border:1px solid #ffffff;
	}
	#content  .tab-view td.year{
		width:100px;
		font-weight:bold;
		text-align:center;
		color: #fff;
	 	background-color: #000000;
	 	border:1px solid #ffffff;
	}
	#content  .tab-view td.thumnail{
		width:200px;
		font-weight:bold;
		text-align:center;
		color: #fff;
	 	background-color: #000000;
	 	border:1px solid #ffffff;
	}
	#content  .tab-view td.sub{
		width:200px;
		font-weight:bold;
		text-align:center;
		color: #fff;
	 	background-color: #000000;
	 	border:1px solid #ffffff;
	}
	#content  .tab-view td.artist{
		width:200px;
		font-weight:bold;
		text-align:center;
		color: #fff;
	 	background-color: #000000;
	 	border:1px solid #ffffff;
	}
	#content  .tab-view td.mof{
		width:50px;
		font-weight:bold;
		text-align:center;
		color: #fff;
	 	background-color: #000000;
	 	border:1px solid #ffffff;
	}
	#content .tab-view td.btnArea{
		text-align:center;
	}
	#content .tab-view td.btnArea input.btn{
		height:40px;
		background-color:#000000;
		color:#ffffff;
		border:none;
		border-radius:5px;
		font-family:'나눔바른고딕';
	}
	#content .tab-view td.text{
		border-bottom:1px solid #BDBDBD;
		height:200px;
	}
	#content .tab-view input.btn1{
		font-family:'나눔바른고딕';
		border:1px solid #000000;
		border-radius:3px;
		background-color:#ffffff;
		color:#000000;
		width:50px;height:30px;
		
	}
</style>
</head>

<script>
	function clickTab(event, category){ 
	    if(category=="music"){
	    	category = "음악";
	    }else if(category=="movie"){
	    	category = "영화";
	    } else if(category=="drama"){
	    	category = "드라마";
	    } else if(category=="ani"){
	    	category = "애니메이션";
	    }
	    location.href="/CULTURESLOT/CS_admin/contentList.do?category="+category;   
	}
	
	//국내,해외 선택
	function clickCountry(country){
		if(country.value=="국내"){
			location.href="/CULTURESLOT/CS_admin/contentList.do?category=${category}&country=국내";
		}else if(country.value=="해외"){
			location.href="/CULTURESLOT/CS_admin/contentList.do?category=${category}&country=해외";
		}
	}
	//연대 선택
	function clickYears(years){
		var years1960 = ["연도 선택", "1960", "1961", "1962", "1963", "1964", "1965", "1966", "1967", "1968", "1969"];
		var years1970 = ["연도 선택", "1970", "1971", "1972", "1973", "1974", "1975", "1976", "1977", "1978", "1979"];
		var years1980 = ["연도 선택", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989"];
		var years1990 = ["연도 선택", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999"];
		var years2000 = ["연도 선택", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009"];
		var years2010 = ["연도 선택", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"];
		var years2020 = ["연도 선택", "2020"];
		var year = document.getElementById("selectYear");
		year.options.length=0;
		if(years.value=="2020년대"){
			for(x in years2020){
				var opt = document.createElement("option");
			    opt.value = years2020[x];
			    opt.innerHTML = years2020[x];
			    year.appendChild(opt);
			}
		}else if(years.value=="2010년대"){
			for(x in years2010){
				var opt = document.createElement("option");
			    opt.value = years2010[x];
			    opt.innerHTML = years2010[x];
			    year.appendChild(opt);
			}
		}else if(years.value=="2000년대"){
			for(x in years2000){
				var opt = document.createElement("option");
			    opt.value = years2000[x];
			    opt.innerHTML = years2000[x];
			    year.appendChild(opt);
			}
		}else if(years.value=="1990년대"){
			for(x in years1990){
				var opt = document.createElement("option");
			    opt.value = years1990[x];
			    opt.innerHTML = years1990[x];
			    year.appendChild(opt);
			}
		}else if(years.value=="1980년대"){
			for(x in years1980){
				var opt = document.createElement("option");
			    opt.value = years1980[x];
			    opt.innerHTML = years1980[x];
			    year.appendChild(opt);
			}
		}else if(years.value=="1970년대"){
			for(x in years1970){
				var opt = document.createElement("option");
			    opt.value = years1970[x];
			    opt.innerHTML = years1970[x];
			    year.appendChild(opt);
			}
		}else if(years.value=="1960년대"){
			for(x in years1960){
				var opt = document.createElement("option");
			    opt.value = years1960[x];
			    opt.innerHTML = years1960[x];
			    year.appendChild(opt);
			}
		}
	}
	//연도 선택
	function clickYear(year){
		var country = document.getElementById("selectcountry").value;
		var year = document.getElementById("selectYear").value;
		var url = "/CULTURESLOT/CS_admin/contentList.do?category=${category}&country="+country+"&year="+year;
		location.href=url;
	}
</script>

<body>
<%@ include file="/etc/adminTop.jsp" %>
<div id ="content">
	<div class="tab-box">
	<h1>-콘텐츠 목록 -</h1>
		<ul>
		  <li class="tab" onclick="clickTab(event, 'music')">음악 </li>
		  <li class="tab" onclick="clickTab(event, 'movie')">영화</li>
		  <li class="tab" onclick="clickTab(event, 'drama')">드라마</li>
		  <li class="tab" onclick="clickTab(event, 'ani')">애니메이션</li>
		</ul>
	</div>
	<div class="tab-view" style="display:block;" id="content">
		<select id="selectcountry" onchange="clickCountry(this)">
			<option>${country }</option>
			<option value="국내">국내</option>
			<option value="해외">해외</option>
		</select>
		<select id="selectYears" onchange="clickYears(this)">
			<option>연대 선택</option>
			<option>2020년대</option>
			<option>2010년대</option>
			<option>2000년대</option>
			<option>1990년대</option>
			<option>1980년대</option>
			<option>1970년대</option>
			<option>1960년대</option>
		</select>
		<select id="selectYear" onchange="clickYear(this)">
			<option>${year }</option>
		</select>		
		<c:if test="${category=='음악' }">
		<table class="view">
			<tr>
				<td class ="cate">분류</td>
				<td class ="year">연도</td>
				<td class ="thumnail">이미지</td>
				<td class ="sub" class ="sub">제목</td>
				<td class ="artist">가수</td>
				<td class ="mof" colspan="2">수정 / 삭제</td>
			</tr>
			<c:forEach items="${musicList}" var="music">
			<c:set var="musics" value="음악"/>
			<tr>
				<td class="text">${music.category}</td>
				<td class="text">${music.year}</td>
				<td>
					<a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ music.year }&title=${ music.title }&num=${ music.content_num }"><img src="${ music.title_image }" style="width:200px;height:200px;"></a></td>
				<td class="text"><a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ music.year }&title=${ music.title }&num=${ music.content_num }">${music.title }</a></td>
				<td class="text">${music.creator }</td>
				<td class="text">
					<input type="button" value="수정" class="btn1" onclick="window.location='contentUpdate.do?cate=${music.category }&num=${music.content_num}'"/></td>
				<td class="text">
					<input type="button" value="삭제" class="btn1" onclick="window.location='contentDelete.do?cate=${music.category }&num=${music.content_num}'"/></td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="7" class="btnArea">
					<input type="button" value="콘텐츠 등록" class="btn" onclick="window.location='contentForm.do?cate=music'"/>
				</td>
			</tr>
	</table>
	<div id="pageNumber">
			<c:if test="${musicStartPage>10 }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?catogory=음악&country=${country }&year=${year }&pageNum=${musicStartPage-10 }">[이전]</a>
			</c:if>
			<c:forEach begin="${musicStartPage }" end="${musicEndPage }" step="1" var="i">
				<a href="/CULTURESLOT/CS_admin/contentList.do?catogory=음악&country=${country }&year=${year }&pageNum=${i}">[${i }]</a>
			</c:forEach>
			<c:if test="${musicEndPage < musicPageCount }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?catogory=음악&country=${country }&year=${year }&pageNum=${musicStartPage+10 }">[다음]</a>
			</c:if>
	</div>
	</c:if>
	
	<c:if test="${category=='영화' }">
		<table class="view">
			<tr>
				<td class ="cate">분류</td>
				<td class ="year">연도</td>
				<td class ="thumnail">이미지</td>
				<td class ="sub">제목</td>
				<td class ="artist">감독 </td>
				<td class ="mof" colspan="2">수정/삭제</td>
			</tr>
		<c:forEach items="${movieList }" var="movie">
			<tr>
				<td class="text">${movie.category }</td>
				<td class="text">${movie.year}</td>
				<td>
					<a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ movie.year }&title=${ movie.title }&num=${ movie.content_num }"><img src="${ movie.title_image }" style="width:200px;height:200px;"></a></td>
				<td class="text"><a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ movie.year }&title=${ movie.title }&num=${ movie.content_num }">${movie.title }</a></td>
				<td class="text">${movie.creator }</td>
				<td class="text">
					<input type="button" value="수정"  class="btn1" onclick="window.location='contentUpdate.do?cate=${movie.category }&num=${movie.content_num}'"/></td>
				<td class="text">
					<input type="button" value="삭제"  class="btn1"	onclick="window.location='contentDelete.do?cate=${movie.category }&num=${movie.content_num}'"/></td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="7" class="btnArea">
					<input type="button" value="콘텐츠 등록"  class="btn" onclick="window.location='contentForm.do?cate=movie'"/>	
				</td>
			</tr>
		</table>
		<div id="pageNumber">
			<c:if test="${movieStartPage>10 }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=영화&country=${country }&year=${year }&pageNum=${movieStartPage-10 }">[이전]</a>
			</c:if>
			<c:forEach begin="${movieStartPage }" end="${movieEndPage }" step="1" var="i">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=영화&country=${country }&year=${year }&pageNum=${i}">[${i }]</a>
			</c:forEach>
			<c:if test="${movieEndPage < moviePageCount }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=영화&country=${country }&year=${year }&pageNum=${movieStartPage+10 }">[다음]</a>
			</c:if>
		</div>
	</c:if>
	
	<c:if test="${category=='드라마' }">
		<table class="view">
			<tr>
				<td class ="cate" class ="cate">분류</td>
				<td class ="year">연도</td>
				<td class ="thumnail">이미지</td>
				<td class ="sub">제목</td>
				<td class ="artist">연출 </td>
				<td class ="mof" colspan="2">수정/삭제</td>
			</tr>
		<c:forEach items="${dramaList}" var="drama">
			<tr>
				<td class="text">${drama.category }</td>
				<td class="text">${drama.year}</td>
				<td>
					<a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ drama.year }&title=${ drama.title }&num=${ drama.content_num }"><img src="${ drama.title_image }" style="width:200px;height:200px;"></a></td>
				<td class="text"><a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ drama.year }&title=${ drama.title }&num=${ drama.content_num }">${drama.title }</a></td>
				<td class="text">${drama.creator }</td>
				<td class="text">
					<input type="button" value="수정"  class="btn1"	onclick="window.location='contentUpdate.do?cate=${drama.category }&num=${drama.content_num}'"/></td>
				<td class="text">
					<input type="button" value="삭제"  class="btn1"	onclick="window.location='contentDelete.do?cate=${drama.category }&num=${drama.content_num}'"/></td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="7" class="btnArea">
					<input type="button" value="콘텐츠 등록"  class="btn" onclick="window.location='contentForm.do?cate=drama'"/>	
				</td>
			</tr>
		</table>
		<div id="pageNumber">
			<c:if test="${dramaStartPage>10 }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=드라마&country=${country }&year=${year }&pageNum=${dramaStartPage-10 }">[이전]</a>
			</c:if>
			<c:forEach begin="${dramaStartPage }" end="${dramaEndPage }" step="1" var="i">
					<a href="/CULTURESLOT/CS_admin/contentList.do?category=드라마&country=${country }&year=${year }&pageNum=${i}">[${i }]</a>
			</c:forEach>	
			<c:if test="${dramaEndPage < dramaPageCount }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=드라마&country=${country }&year=${year }&pageNum=${dramaStartPage+10 }">[다음]</a>
			</c:if>
		</div>
	</c:if>
	
	<c:if test="${category=='애니메이션' }">
		<table class="view">
			<tr>
				<td class ="cate">분류</td>
				<td class ="year">연도</td>
				<td class ="thumnail">이미지</td>
				<td class ="sub">제목</td>
				<td class ="artist">감독 </td>
				<td class ="mof" colspan="2">수정/삭제</td>
			</tr>
			<c:forEach items="${aniList }" var="ani">
			<c:if test="${ani != null }">
				<tr>
					<td class="text">${ani.category}</td>
					<td class="text">${ani.year}</td>
					<td><a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ ani.year }&title=${ ani.title }&num=${ ani.content_num }"><img src="${ ani.title_image }" style="width:200px;height:200px;"></a></td>
					<td class="text"><a href = "/CULTURESLOT/CS_content/content.do?genre=${ category }&year=${ ani.year }&title=${ ani.title }&num=${ ani.content_num }">${ani.title }</a></td>
					<td class="text">${ani.creator }</td>
					<td class="text">
						<input type="button" value="수정" class="btn1" onclick="window.location='contentUpdate.do?cate=${ani.category }&num=${ani.content_num}'"/></td>
					<td class="text">
						<input type="button" value="삭제"  class="btn1" onclick="window.location='contentDelete.do?cate=${ani.category }&num=${ani.content_num}'"/></td>
				</tr>
			</c:if>
			</c:forEach>
			<tr>
				<td colspan=7" class="btnArea">
					<input type="button" value="콘텐츠 등록"  class="btn"	onclick="window.location='contentForm.do?cate=animation'"/>	
				</td>
			</tr>
		</table>
		<div id="pageNumber">
			<c:if test="${aniStartPage>10 }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=애니메이션&country=${country }&year=${year }&pageNum=${aniStartPage-10 }">[이전]</a>
			</c:if>
			<c:forEach begin="${aniStartPage }" end="${aniEndPage }" step="1" var="i">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=애니메이션&country=${country }&year=${year }&pageNum=${i}">[${i }]</a>
			</c:forEach>
			<c:if test="${aniEndPage < aniPageCount }">
				<a href="/CULTURESLOT/CS_admin/contentList.do?category=애니메이션&country=${country }&year=${year }&pageNum=${aniStartPage+10 }">[다음]</a>
			</c:if>
		</div>
	</c:if>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>	
</body>

