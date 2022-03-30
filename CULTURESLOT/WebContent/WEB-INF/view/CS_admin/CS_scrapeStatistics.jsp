<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 스크랩 통계</title>
<style>
table {
	marign: 0 auto;
	margin-top: 40px;
	font-family: '나눔바른고딕';
	font-size: 14pt;
}
th{
	height:45px;
	font-size:16pt;
}
td {
	height: 40px;
	border-radius: 3px;
	text-align: center;
}
td.text {
	border-bottom: 1px solid #BDBDBD;
}
#scrapeSection {
	width: 90%;
	margin: 0 auto;
	margin-top: 120px;
	text-align: center;
	margin-bottom:120px;
}
#scrapeSection #allScrape {
	width: 90%;
	margin: 0 auto;
	text-align:center;
}
#scrapeSection #maleScrape{
	width: 90%;
	margin: 0 auto;
	text-align:center;
}
#scrapeSection #femaleScrape{
	width: 90%;
	margin: 0 auto;
	text-align:center;
}
#scrapeSection #allScrape table {
	margin: 0 auto;
}
#scrapeSection #maleScrape table{
	margin:0 auto;
}
#scrapeSection #femaleScrape table{
	margin:0 auto;
}
#scrapeSection #allScrape td.rank {
	width: 70px;
	text-align: center;
	background-color:#3b3a39;
	color:#ffffff;
}
#scrapeSection #allScrape td.title {
	width: 500px;
	text-align: center;
	background-color:#3b3a39;
	color:#ffffff;
}
#scrapeSection #allScrape td.count{
	width:120px;
	text-align: center;
	background-color:#3b3a39;
	color:#ffffff;
}
#scrapeSection #maleScrape td.rank {
	width: 70px;
	text-align: center;
	background-color:#374BA4;
	color:#ffffff;
}
#scrapeSection #maleScrape td.title {
	width: 500px;
	text-align: center;
	background-color:#374BA4;
	color:#ffffff;
}
#scrapeSection #maleScrape td.count{
	width:120px;
	text-align: center;
	background-color:#374BA4;
	color:#ffffff;
}
#scrapeSection #femaleScrape td.rank {
	width: 70px;
	text-align: center;
	background-color:#CD6AC3;
	color:#ffffff;
}
#scrapeSection #femaleScrape td.title {
	width: 500px;
	text-align: center;
	background-color:#CD6AC3;
	color:#ffffff;
}
#scrapeSection #femaleScrape td.count{
	width:120px;
	text-align: center;
	background-color:#CD6AC3;
	color:#ffffff;
}
</style>
</head>
<body>
<%@ include file="/etc/adminTop.jsp" %>
<div id = "scrapeSection">
	<div id ="allScrape">
	<h2>전체 스크랩 횟수 : ${allcount}회 / 스크랩된 포스트: ${contentCount}개</h2>
		<table>
			<tr>
				<th colspan="3">전체회원  콘텐츠 스크랩 Top5</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count" class="count">건 / 백분율(%)</td>
			</tr>
			<c:set var="num" value="1"/>
		<c:forEach items="${allScrapeList}" var="all">
			<tr>
				<td class="text">${num}위</td>
				<td class="text">${all.title} (${all.category} - ${all.year})</td>
				<td class="text">${all.title_count} 건 / ${all.percent} %</td>
			</tr>
			<c:set var="num" value="${num+1}"/>
		</c:forEach>
		</table>
	</div>
	<div id ="maleScrape">
	<h2>[남성 회원 스크랩 순위]</h2>
		<div>
		<c:if test="${maleAge10.size() != 0}">+
			<table>
				<c:set var = "agegroup" value="10"/>
				<c:set var = "gender" value="남성"/>
				<tr>
					<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
				</tr>
				<tr>
					<td class="rank">순위</td>
					<td class="title">제목</td>
					<td class="count">건</td>
				</tr>
				<c:forEach items="${maleAge10}" var="mem">
					<tr>
					<c:set var="number" value="${number+1}"/>
						<td class="text">${number}위</td>
						<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
						<td class="text">${mem.title_count} 건</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
		<div>
		<c:if test="${maleAge20.size() != 0}">
			<table>
				<c:set var = "agegroup" value="20"/>
				<c:set var = "gender" value="남성"/>
				<tr>
					<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
				</tr>
				<tr>
					<td class="rank">순위</td>
					<td class="title">제목</td>
					<td class="count" class="count">건</td>
				</tr>
				<c:set var="num" value="1"/>
				<c:forEach items="${maleAge20}" var="mem">
					<tr>
						<td class="text">${num}위</td>
						<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
						<td class="text">${mem.title_count} 건</td>
					<c:set var="num" value="${num+1}"/>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
		<div>
		<c:if test="${maleAge30.size() != 0}">
			<table>
				<c:set var = "agegroup" value="30"/>
				<c:set var = "gender" value="남성"/>
				<tr>
					<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
				</tr>
				<tr>
					<td class="rank">순위</td>
					<td class="title">제목</td>
					<td class="count" class="count">건</td>
				</tr>
				<c:set var="num" value="1"/>
				<c:forEach items="${maleAge30}" var="mem">
					<tr>
						<td class="text">${num}위</td>
						<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
						<td class="text">${mem.title_count} 건</td>
					<c:set var="num" value="${num+1}"/>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
		<div>
		<c:if test="${maleAge40.size() != 0}">
			<table>
				<c:set var = "agegroup" value="40"/>
				<c:set var = "gender" value="남성"/>
				<tr>
					<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
				</tr>
				<tr>
					<td class="rank">순위</td>
					<td class="title">제목</td>
					<td class="count">건</td>
				</tr>
				<c:set var="num" value="1"/>
				<c:forEach items="${maleAge40}" var="mem">
					<tr>
						<td class="text">${num}위</td>
						<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
						<td class="text">${mem.title_count} 건</td>
					<c:set var="num" value="${num+1}"/>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
		<div>
		<c:if test="${maleAge50.size() != 0}">
			<table>
				<c:set var = "agegroup" value="50"/>
				<c:set var = "gender" value="남성"/>
				<tr>
					<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
				</tr>
				<tr>
					<td class="rank">순위</td>
					<td class="title">제목</td>
					<td class="count">건</td>
				</tr>
				<c:set var="num" value="1"/>
				<c:forEach items="${maleAge50}" var="mem">
					<tr>
						<td class="text">${num}위</td>
						<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
						<td class="text">${mem.title_count} 건</td>
					<c:set var="num" value="${num+1}"/>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
		<div>
		<c:if test="${maleAge60.size() != 0}">
			<table>
				<c:set var = "agegroup" value="60"/>
				<c:set var = "gender" value="남성"/>
				<tr>
					<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
				</tr>
				<tr>
					<td class="rank">순위</td>
					<td class="title">제목</td>
					<td class="count">건</td>
				</tr>
				
				<c:set var="num" value="1"/>
				<c:forEach items="${maleAge60}" var="mem">
					<tr>
						<td class="text">${num}위</td>
						<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
						<td class="text">${mem.title_count} 건</td>
					<c:set var="num" value="${num+1}"/>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
		<div>
		<c:if test="${maleAgeNone.size() != 0}">
			<table>
				<c:set var = "agegroup" value="연령대 불명"/>
				<c:set var = "gender" value="남성"/>
				<tr>
					<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
				</tr>
				<tr>
					<td class="rank">순위</td>
					<td class="title">제목</td>
					<td class="count">건</td>
				</tr>		
				<c:set var="num" value="1"/>
				<c:forEach items="${maleAgeNone}" var="mem">
					<tr>
						<td class="text">${num}위</td>
						<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
						<td class="text">${mem.title_count} 건</td>
					<c:set var="num" value="${num+1}"/>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
	</div>
	<div id ="femaleScrape">
	<h2>[여성 회원 스크랩 순위]</h2>
	<div>
	<c:if test="${femaleAge10.size() != 0}">
		<table>
			<c:set var = "agegroup" value="10"/>
			<c:set var = "gender" value="여성"/>
			<tr>
				<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count">건</td>
			</tr>
			<c:set var="num" value="1"/>
			<c:forEach items="${femaleAge10}" var="mem">
				<tr>
					<td class="text">${num}위</td>
					<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
					<td class="text">${mem.title_count} 건</td>
				<c:set var="num" value="${num+1}"/>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	<div>
	<c:if test="${femaleAge20.size() != 0}">
		<table>
			<c:set var = "agegroup" value="20"/>
			<c:set var = "gender" value="여성"/>
			<tr>
				<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count">건</td>
			</tr>		
			<c:set var="num" value="1"/>
			<c:forEach items="${femaleAge20}" var="mem">
				<tr>
					<td class="text">${num}위</td>
					<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
					<td class="text">${mem.title_count} 건</td>
				<c:set var="num" value="${num+1}"/>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	<div>
	<c:if test="${femaleAge30.size() != 0}">
		<table>
			<c:set var = "agegroup" value="30"/>
			<c:set var = "gender" value="여성"/>
			<tr>
				<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count">건</td>
			</tr>
			<c:set var="num" value="1"/>
			<c:forEach items="${femaleAge30}" var="mem">
				<tr>
					<td class="text">${num}위</td>
					<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
					<td class="text">${mem.title_count} 건</td>
				<c:set var="num" value="${num+1}"/>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	<div>
	<c:if test="${femaleAge40.size() != 0}">
		<table>
			<c:set var = "agegroup" value="40"/>
			<c:set var = "gender" value="여성"/>
			<tr>
				<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count">건</td>
			</tr>
			<c:set var="num" value="1"/>
			<c:forEach items="${femaleAge40}" var="mem">
				<tr>
					<td class="text">${num}위</td>
					<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
					<td class="text">${mem.title_count} 건</td>
				<c:set var="num" value="${num+1}"/>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	<div>
	<c:if test="${femaleAge50.size() != 0}">
		<table>
			<c:set var = "agegroup" value="50"/>
			<c:set var = "gender" value="여성"/>
			<tr>
				<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count">건</td>
			</tr>
			<c:set var="num" value="1"/>
			<c:forEach items="${femaleAge50}" var="mem">
				<tr>
					<td class="text">${num}위</td>
					<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
					<td class="text">${mem.title_count} 건</td>
				<c:set var="num" value="${num+1}"/>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	<div>
	<c:if test="${femaleAge60.size() != 0}">
		<table>
			<c:set var = "agegroup" value="60"/>
			<c:set var = "gender" value="여성"/>
			<tr>
				<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count">건</td>
			</tr>
			<c:set var="num" value="1"/>
			<c:forEach items="${femaleAge60}" var="mem">
				<tr>
					<td class="text">${num}위</td>
					<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
					<td class="text">${mem.title_count} 건</td>
				<c:set var="num" value="${num+1}"/>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	<div>
	<c:if test="${femaleAgeNone.size() != 0}">
		<table>
			<c:set var = "agegroup" value="연령대 불명"/>
			<c:set var = "gender" value="여성"/>
			<tr>
				<th colspan="3">${agegroup}대 ${gender} 스크랩 순위</th>
			</tr>
			<tr>
				<td class="rank">순위</td>
				<td class="title">제목</td>
				<td class="count">건</td>
			</tr>
			<c:set var="num" value="1"/>
			<c:forEach items="${femaleAgeNone}" var="mem">
				<tr>
					<td class="text">${num}위</td>
					<td class="text">${mem.title} ( ${mem.category} - ${mem.year} )</td>
					<td class="text">${mem.title_count} 건</td>
				<c:set var="num" value="${num+1}"/>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
</div>
</div>
</body>
</html>