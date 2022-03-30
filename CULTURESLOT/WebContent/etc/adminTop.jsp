<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
li {
	list-style: none;
}

a {
	text-decoration: none;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: #ddd;
	text-decoration: none;
}

#top_menu {
	height: 40px;
}

#top_menu li {
	float: left;
	font-family:'나눔바른고딕';
}

#admin_menu {
	width: 80%;
	margin: 0 auto;
	text-align: center;
	display: table;
}

#admin_menu h1.title {
	font-size: 36pt;
}
#admin_menu #menu_bar{
	margin-top:30px;
	height:60px;
}

#admin_menu #menu_bar ul.menu {
	width: auto;
	align: center;
	display: table;
	margin: 0 auto;
	font-family: "나눔바른고딕";
	font-weight: bold;
	font-size: 24pt;
	letter-spacing: -1px;
}

#admin_menu #menu_bar li {
	text-algin:center;
	float: left;
	padding-right: 50px;
	margin: 0 auto;
}

#admin_menu #menu_bar li ul {
	background: rgd(109, 109, 109);
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: auto;
	padding: 10px;
	padding-bottom: 15px;
	margin: 0px;
	border: 0px;
	text-align: left;
	position: absolute;
	width: 200px;
	z-index: 200;
	background-color:none;
	line-height: 1.5em;
}
#admin_menu #menu_bar li ul li{
	font-size:18pt;
	text-align:center;
}

#admin_menu #menu_bar li:hover ul {
	display: block; /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
	float: left;
	padding-bottom: 10px;
}
#section{
	width:55%; height:auto;
	margin:0 auto;
	margin-top:60px;
	border:1px solid blue;
}
#section div.stat{
	display:table-cell;
	padding-left:15px;
}
#section div.stat table{
	width:500px;
	margin:0 auto;
	font-family:'나눔바른고딕';
	float:left;
	text-align:center;
}
#section div.stat th{
	font-size:18pt;
}
#section div.stat td{
	border:1px solid red;
}
#section div.stat table div.graph{
	height:300px;
}
</style>
</head>
<body>
<div id ="top_menu">
	<ul>
		<li><a href ="/CULTURESLOT/member/logout.do">로그아웃</a>&nbsp;&nbsp;</li>
		<li><a href ="/CULTURESLOT/CS_main/main.do">메인으로</a>&nbsp;&nbsp;</li>
	</ul>
</div>
<div id="admin_menu">
<h1 class="title">
	<a href="/CULTURESLOT/CS_admin/contentList.do">
		CULTURE'SLOT 관리자</a></h1>
	<div id ="menu_bar">
		<ul class="menu">
			<li><a href="#">콘텐츠 관리</a>&nbsp;&nbsp;
				<ul class="sub">
					<li><a href="/CULTURESLOT/CS_admin/contentList.do">콘텐츠목록</a></li>
				</ul>
			</li>
			<li><a href="#">회원 관리</a>&nbsp;&nbsp;
				<ul class="sub">
					<li><a href="/CULTURESLOT/CS_admin/memberList.do">회원목록</a></li>
				</ul>
			</li>
			<li><a href="#">통계</a>&nbsp;&nbsp;
				<ul class="sub">
					<li><a href="/CULTURESLOT/admin/stat/memberStat.do">회원 통계</a></li>
					<li><a href="/CULTURESLOT/admin/stat/scrapeStat.do">스크랩 통계</a></li>
				</ul>
			</li>
			<li><a href="#">게시판 관리</a>
				<ul class="sub">
					<li><a href="/CULTURESLOT/notice/noticeAdminList.do">공지 사항</a></li>
					<li><a href="/CULTURESLOT/RC/RC_AdminList.do">자료 요청</a></li>
					<li><a href="/CULTURESLOT/CS_admin/commentList.do">댓글 관리</a></li>
				</ul>
			</li>
		</ul>
		<hr>
	</div>
</div>

</body>
</html>