<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<!-- headSection -->
<style>
	a{
		text-decoration:none;
	}
	a:link {
		color:#3b3a39;
	}
	a:visited {
		color:#3b3a39;
	}
	li{
		list-style:none;
	}
	input.submitBtn{
		width:80px;height:45px;
		background-color:#3b3a39;
		text-align:center;
		color:#ffffff;
		font-size:14pt;
		font-family:'나눔바른고딕';
		border:none;
	}
	input.submitBtnActive{
		width:80px;height:45px;
		background-color:#cccccc;
		text-align:center;
		color:#ffffff;
		font-size:14pt;
		font-family:'나눔바른고딕';
		border:none;
	}
	div.tap{
		width:100%; height:50px;
	}
	div.tap #menu {
	
	}
	div.tap #menu li{
		float:left;
		font-family:'나눔바른고딕';
	}
	div.tap #search{
		text-align:right;
	}
	div.tap #searchBox{
		width:200px; height:25px;
	}
	div.tap #searchBtn{
		width:60px; height:35px;
		background-color:#3b3a39;
		text-align:center;
		color:#ffffff;
		font-size:12pt;
		font-family:'나눔바른고딕';
	}
	div.head{
		width:100%; height:180px;
	}
	div.head #title{
		text-align:center;
		font-family:'나눔바른고딕';
		vertical-align:middle;
		font-size:60pt;
	}
	div.head #title a{
		color:#24194D;
	}
</style>

<!-- mainSection -->
<style>
	div.box{
		width:100%; height:200px;
	}
	div.title_box{
		width:auto; height:100px;
	}
	div.title_box h1.title{
		margin:10px auto;
		text-align:center;
		font-family:'나눔바른고딕';
		vertical-align:middle;
		font-size:60pt;
	}
</style>

<!-- SeachSection -->
<style>
	#searchSection{
		margin:30px auto;
		width:90%; height:auto;
	}
	#searchSection div.search_box{
		margin:40px auto;
		padding:30px; 
		width:85%; height:auto;
		display:table;
		border: 1px solid #BDBDBD;
	}
	#searchSection div.search_box div.searchResultBox{
		margin:0 auto;
		width:87%;
		padding:30px;
		float:center;
		display:table;
	}
	#searchSection div.search_box div.searchResultBox table.result{
		width:200px; height:220px;
		margin:0 auto;
		text-align:center;
		float:left;
	}
	#searchSection div.search_box div.searchResultBox table.result td.title{
		height:150px;
		vertical-align:top;
	}
	#searchSection div.search_box div.ImageBox{
	 	width:200px; height:200px;
		border:1px solid #ffffff;
		background-color:#3b3a39;
	}
	#searchSection div.search_box div.ImageBox p.text{
		font-family:'나눔바른고딕';
		font-size:14pt;
		color:#ffffff;
	}
	#searchSection div.search_box p.title{
		width:auto; height:auto;
		font-family:'나눔바른고딕';
		font-size:14pt;
	}
</style>

<!-- 메인 페이지 : 연도 선택 / 장르 선택 -->
<style>
	#selectYearSection div.box div.yearBox{
		margin:0 auto;
		width:700px; height:200px;
		text-align:center;
	}
	#selectYearSection div.box div.yearBox ul.year_ul{
		margin: 50px auto;
		display:table;
	}
	#selectYearSection div.box div.yearBox li.year_li{
		display:table-cell;
		vertical-align:middle;
		padding:10px;
	}
	#selectYearSection div.box div.yearBox select.yearSelect{
		width:300px; height:120px;
		text-align:center;
		font-size:100px; font-weight:bold;
		font-family:'나눔바른고딕';
	}
	#selectYearSection div.box div.yearBox option.yearSelect{
		text-align:center;
		font-weight:bold;
	}
	#selectYearSection div.box div.yearBox input.yearSelect{
		width:290px; height:120px;
		text-align:center;
		font-size:80pt; 
		font-weight:bold;
		font-family:'나눔바른고딕';
		border:1px solid #BDBDBD;
	}
	#selectYearSection div.box div.yearBox input.btnMain{
		width:150px; height:125px;
		background-color:#3b3a39;
		color:#ffffff;
		font-family:'나눔바른고딕';
		font-size:45pt;
		border:1px solid #ffffff;
	}
	#selectGenreSection{
		margin:30px auto;
		width:auto; height:400px;
	}
	#selectGenreSection div.box{
		margin:0 auto;
		width:400px;
	}
	#selectGenreSection div.box ul.genre{
		text-align:center;
		margin-top:0px;
		display:inline-block;
		padding:0px;
	}
	#selectGenreSection div.box ul.genre li.genre{
		float:left;
		text-align:center;
		padding:0px;
	}
	#selectGenreSection div.box ul.genre li.genre div.GenreBox {
		width:200px; height:200px;
		border:1px solid #ffffff;
		background-color:#3b3a39;
		display:table;
	}
	#selectGenreSection div.box ul.genre li.genre div.GenreBox p.genre{
		display:table-cell;
		text-align:center;
		vertical-align:middle;
		font-size:30pt;
		font-family:'나눔바른고딕';
		color:#ffffff;
	}
	#selectListSection{
		margin:30px auto;
		width:auto; height:400px;
	}
	#selectListSection div.box {
		width:100%; height:auto;
		text-align:center;
		margin:0 auto;
	}
	#selectListSection div.box #msg{
		margin:50px auto;
		font-family:'나눔바른고딕';
		font-size:18pt;
	}
	#selectListSection div.box div.box_section{
		margin:0 auto;
		width:860px;
		text-align:center;
	}
	#selectListSection div.box div.box_section ul.genre{
		margin-top:0px;
		padding:0px;
		width:860px; height:auto;
		text-align:center;
		display:inline-block;
	}
	#selectListSection div.box div.box_section ul.genre li.genre{
		width:200px;
		text-align:center;
		padding:20px;
		display:table;
	}
	#selectListSection div.box div.box_section ul.genre li.genre div.ImageBox{
		width:200px; height:200px;
		border:1px solid #ffffff;
		background-color:#3b3a39;
		display:table;	
	}
	.ImageBox:hover{
		opacity: 0.5;
	}
	.box_section td{
		width:200px; height:300px;
	}
	#selectListSection div.box div.box_section ul.genre li.genre div.ImageBox p.text{
		display:table-cell;
		vertical-align:middle;
		font-family:'나눔바른고딕';
		font-size:14pt;
		color:#ffffff;
	}
	#selectListSection div.box div.box_section ul.genre li.genre p.title{
		width:auto; height:auto;
		font-family:'나눔바른고딕';
		font-size:14pt;
		font-weight:bold;
	}
	#selectListSection div.box_section ul.genre li.genre div.box a:link{
		color:#3b3a39;
	}
</style>

<!-- 장르선택 -->
<style>
	#selectGenreSection{
		margin:30px auto;
		width:auto; height:400px;
	}
	#selectGenreSection div.box{
		margin:0 auto;
		width:400px;
	}
	#selectGenreSection div.box ul.genre{
		text-align:center;
		margin-top:0px;
		display:inline-block;
		padding:0px;
	}
	#selectGenreSection div.box ul.genre li.genre{
		float:left;
		text-align:center;
		padding:0px;
	}
	#selectGenreSection div.box ul.genre li.genre div.GenreBox {
		width:200px; height:200px;
		border:1px solid #ffffff;
		background-color:#3b3a39;
		display:table;
	}
	#selectGenreSection div.box ul.genre li.genre div.GenreBox p.genre{
		display:table-cell;
		text-align:center;
		vertical-align:middle;
		font-size:30pt;
		font-family:'나눔바른고딕';
		color:#ffffff;
	}
	#selectListSection div.box #msg{
		margin:50px auto;
		font-family:'나눔바른고딕';
		font-size:18pt;
	}
</style>

<!-- listSection -->
<style>
	#selectListSection{
		margin:30px auto;
		width:70%; height:auto;
		border:1px solid #BDBDBD;
	}
	#selectListSection div.selectListbox{
		margin:40px auto;
		padding:30px; 
		width:90%; height:auto;
		display:table;
	}
	#selectListSection div.selectListbox div.box{
		margin:0 auto;
		width:80%;
		padding:30px;
		float:center;
		display:table;
	}
	#selectListSection div.selectListbox div.box table.genre{
		width:200px; height:350px;
		margin:0 auto;
		text-align:center;
		float:left;
	}
	#selectListSection div.selectListbox div.box table.genre td.title{
		height:150px;
		vertical-align:top;
	}
	#selectListSection div.selectListbox div.box div.ImageBox{
	 	width:200px; height:200px;
		border:1px solid #ffffff;
		background-color:#3b3a39;
	}
	#selectListSection div.selectListbox div.box div.ImageBox p.text{
		font-family:'나눔바른고딕';
		font-size:14pt;
		color:#ffffff;
	}
	#selectListSection div.selectListbox div.box p.title{
		width:auto; height:auto;
		font-family:'나눔바른고딕';
		font-size:14pt;
</style>

<!-- contentSection -->
<style>
	#pageNumber{
  		text-align:center;
  	}
	#contentSection {
		margin:40px auto;
		width:auto; height:auto;
		text-align:center;
	}
	#contentSection div.title_box h1.title{
		margin:10px auto;
		text-align:center;
		font-family:'나눔바른고딕';
		vertical-align:middle;
		font-size:36pt;
		color:#0D0817;
	}
	#contentSection div.content_box{
		margin:10px auto; position:relative;
		width:80%; height:800px;
		display:table;
	}
	#contentSection div.content_box table.basicInfo{
		margin:0 auto;
		width:800px; height:auto;
		font-family:'나눔바른고딕';
	}
	#contentSection div.content_box table.basicInfo td{
		width:230px;
		border:1px solid #BDBDBD;
		padding-left:15px;
		font-size:14pt;
		vertical-align:middle;
	}
	#contentSection div.content_box table.basicInfo td.img{
		text-align:center;
		padding:0px;
	}
	#contentSection div.content_box table.basicInfo td.scrapeField{
		text-align:right;
		padding:0px;
		height:50px;
		border:none;
	}
	#contentSection div.content_box table.basicInfo td.sub{
		width:100px;height:40px;
		text-align:center;
		font-weight:bold;
		font-size:14pt;
		padding:0px;
		background-color:#3b3a39;
		color:#ffffff;
		border:none;
	}
	#contentSection div.content_box table.basicInfo td.textarea{
		padding:30px;
	}
	#commentSection{
		margin:40px auto;
		width:auto; height:auto;
	}
	#commentSection div.content_box{
		margin:40px auto; 
		width:80%; height:auto;
		display:table;
	}
	#commentSection div.content_box table.comment{
		margin:0 auto;
		width:800px; height:auto;
		font-family:'나눔바른고딕';
	}
	#commentSection div.content_box table.comment #if{
		font-size:18pt;
		padding:0px;
		font-weight:bold;
		text-align:center;
		vertical-align:middle;
		font-family:'나눔바른고딕';
	}
	#commentSection div.content_box table.comment td{
		height:30px;
		font-size:14pt;
		padding:0px;
		text-align:center;
		vertical-align:middle;
	}
	#commentSection div.content_box table.comment td.sub{
		width:100px;height:50px;
		text-align:center;
		font-weight:bold;
		font-size:16pt;
		padding:0px;
		border:1px solid #BDBDBD;
	}
	#commentSection div.content_box table.comment td.writer{
		width:100px; height:100px;
		color:#3b3a39;
		border-top:1px solid #BDBDBD;
		border-bottom:1px solid #BDBDBD;
	}
	#commentSection div.content_box table.comment td.textfield{
		width:550px; height:100px;
		vertical-align:middle;
		display:table;
		padding-left:10px;
	}
	#commentSection div.content_box table.comment #textarea{
		display:table-cell;
		width:100%;height:100%;
		resize:none;
		border:1px solid #BDBDBD;
	}
	#commentSection div.content_box table.comment td.commentfield{
		width:550px;
		border-top:1px solid #BDBDBD;
		border-bottom:1px solid #BDBDBD;
		vertical-align:middle;	
		padding:10px;
		padding-left:50px;
		text-align:left;
	}
	#commentSection div.content_box table.comment #btnField input.submitBtn{
		width:100px;height:100px;
		background-color:#3b3a39;
		text-align:center;
		color:#ffffff;
		font-size:14pt;
		font-family:'나눔바른고딕';
		border:none;
	}
	
	#contentSection .listBtn{
		width:100px;height:50px;
		background-color:#3b3a39;
		text-align:center;
		color:#ffffff;
		border-radius:5px;
		border:0;
	}
</style>

<!-- 회원가입 -->
<style>
	#joinSection {
		margin:0 auto;
		width: 50%;
	}
	#joinSection h1.title{
		text-align:center;
		font-size:35pt;
		margin: 30 auto;
	}
	#joinSection #join {
		margin: 0 auto;
		border: 1px solid #BDBDBD;
		width: 600px;
	}
	
	#joinSection #join table {
		margin: 0 auto;
		width: 450px; height:auto;
		font-family:'나눔바른고딕';
	}
	
	#joinSection #join td {
		font-weight: bold;
		font-family: '나눔바른고딕';
		text-align:center;
		height: 50px;
		vertical-align:middle;
		font-size:14pt;
	}
	#joinSection #join td.empty {
		height:20px;
	}
	
	#joinSection #join td.title {
		height: 100px;
		font-size: 26pt;
		background-color: #ffffff;
		color: #3b3a39;
	}
	#joinSection #join td.sub {
		height: 60px;
		font-size: 22pt;
		color: #3b3a39;
	}
	
	#joinSection #join td.td1 {
		width: 100px;
		background-color: #3b3a39;
		border-radius:5px;
		color: #ffffff;
	}
	
	#joinSection #join td.td2 {
		text-align:left;
		padding-left:10px;
	}
	
	#joinSection #join input {
		width: 200px;
		height: 70%;
		border-radius:5px;
		border:1px solid #BDBDBD;
		font-size:12pt;
	}
	#joinSection #join input.select {
		width:20px;
		height:20px;
	}
	#joinSection #join input.Btn {
		width: 120px;
		height: 40px;
		font-size:12pt;
		font-family: '나눔바른고딕';
		border: 1px solid black;
		background-color:#3b3a39;
		color:#ffffff;
		border-radius: 10px;
	}
	#joinSection #join select{
		width:80px;
		height:70%;
		font-size:12pt;
		border:1px solid #BDBDBD;
	}
	#joinSection #join option{
	
	}
</style>
<!-- 회원가입 성공 -->



<!-- 회원 탈퇴 -->
<style>
	#withdrawSection {
		margin:0 auto;
		width: 50%;
	}
	#withdrawSection h1.title{
		text-align:center;
		font-size:35pt;
		margin: 30 auto;
	}
	#withdrawSection #withdraw {
		margin: 0 auto;
		border: 1px solid #BDBDBD;
		width: 600px;
	}
	
	#withdrawSection #withdraw table {
		margin: 0 auto;
		width: 450px; height:auto;
		font-family:'나눔바른고딕';
	}
	
	#withdrawSection #withdraw td {
		font-weight: bold;
		font-family: '나눔바른고딕';
		text-align:center;
		height: 50px;
		vertical-align:middle;
		font-size:14pt;
	}
	#withdrawSection #withdraw td.title {
		height: 100px;
		font-size: 26pt;
		background-color: #ffffff;
		color: #3b3a39;
	}
	#withdrawSection #withdraw input {
		width: 200px;
		height: 70%;
		border-radius:5px;
		border:1px solid #BDBDBD;
		font-size:12pt;
	}
	#withdrawSection #withdraw input.btn {
		width: 120px;
		height: 40px;
		font-size:12pt;
		font-family: '나눔바른고딕';
		border: 1px solid black;
		background-color:#3b3a39;
		color:#ffffff;
		border-radius: 10px;
	}
</style>

<!-- 로그인  -->
<style>
	#login {
		margin: 0 auto;
		width: 400px;
		font-family: '나눔바른고딕';
		font-weight : bold;
		border:1px solid #BDBDBD;
		padding:50px;
	}
	#login table {
		margin: 0 auto;
		width: 300px;
		height: auto;
		text-align: center;
		border-radius: 10px;
	}
	#login td {
		text-align: center;
		font-weight: bold;
		font-family: '나눔바른고딕';
		border-radius: 10px;
		height: 40px;
	}
	#login td.title {
		height: 100px;
		font-size: 26pt;
		background-color: #ffffff;
		color: #3b3a39;
	}
	#login td.td1 {
		width: 100px;
		background-color: #3b3a39;
		color: #ffffff;
	}
	#login td.td2 {
		height: 80px;
	}
	input.Btn {
		width: 80px;
		height: 40px;
		font-family: '나눔바른고딕';
		border: 1px solid black;
		border-radius: 10px;
	}
	#loginBtn {
		background-color: #3b3a39;
		color: #ffffff;
	}
	#joinBtn {
		background-color: #ffffff;
		color: #3b3a39;
	}
</style>

<!-- 자료요청 메인 -->
<style>
	table.list {
		margin: 0 auto;
		width: 90%;
		height: auto;
		text-align: center;
	}
	table.list td {
		height: 40px;
		font-family: '나눔바른고딕';
	}
	table.list td.title {
		height: 50px;
		font-size: 24pt;
		font-weight: bold;
		background-color: #ffffff;
		border:1px solid #BDBDBD;
		border-radius: 10px;
		color: #3b3a39;
	}
	table.list td.td1 {
		font-size: 12pt;
		background-color: #3b3a39;
		color: #ffffff;
		border-radius: 5px;
	}
	table.list td.td2 {
		border: 1px solid #BDBDBD;
		border-radius: 5px;
	}
	table.list #textarea {
		width: 98%;
		height: 400px;
		border: none;
		resize: none;
	}
	table.list td.BtnArea {
		width: 100px;
		height: 40px;
	}
	table.list input.submitBtn {
		width: 100px;
		height: 40px;
		text-align: center;
		font-family: '나눔바른고딕';
		font-size: 12pt;
		border: 1px solid #3b3a39;
		border-radius: 10px;
		background-color: #ffffff;
		color: #3b3a39;
	}
	table.list input.buttonBtn {
		width: 40px;
		height: 40px;
		font-family: '나눔바른고딕';
		text-align: center;
		font-size: 10pt;
		border: 1px solid #BDBDBD;
		border-radius: 10px;
		background-color: #ffffff;
		color: #3b3a39;
	}
	table.list #no {
		width: 40px;
	}
	table.list #subject {
		
	}
	table.list #writer {
		width: 100px;
	}
	table.list #reg {
		width: 140px;
	}
	table.list #hit {
		width: 80px;
	}
	table.list #btnarea {
		width: 100px;
	}
</style>

</head>