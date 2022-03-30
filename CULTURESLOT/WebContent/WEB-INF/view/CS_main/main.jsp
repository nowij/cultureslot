<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>메인</title>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	var random = window.setInterval('randomStart()', 300); //0.5초마다 randomStart 함수 실행
	function randomStart(){
		$.ajax({
			url : "mainRandom.do",
			success : function (data){
				//mainRandom.do에서 리턴한 값을 id가 hiddenYear인 input태그의 value값으로 지정한다.
				document.getElementById("hiddenYear").value = data; 
			}
		})
	}
	function randomMake(){
		//id가 hiddenYear인 input태그의 value값을	id가 year인 input태그의 value에 지정한다.
		document.getElementById("year").value = document.getElementById("hiddenYear").value; 
	}
	
	function pageMove(){
		var year = document.getElementById("year").value;
		var q = "????";
		if(year != q){
			clearInterval(random); //ajax 중지
			return true;
		}
		if(year==q){
			alert("연도 선택을 해주세요!");
			return false;
		}
	}
	
</script>

 </head>
 <body>
 <%@ include file="/etc/mainTop.jsp" %>
 <div id = "selectYearSection">
	 <div class="box">
	 	<div class="yearBox">
	 	<form method="post" action="../CS_content/genre.do" id="selectYearForm">
		<ul class="year_ul">
			<li class="year_li">
			<!-- 0626 지원 수정 -->
			<select name="year" class="yearSelect">
				<c:forEach begin="0" end="60" step="1" var="startYear">
					<c:set var="y" value="${2020- startYear }"/>
					<option value="${y}" class="yearSelect">${y}</option>
				</c:forEach>
			</select>
			</li>
			<li class="year_li">
				<input type="submit" value="Go" class="btnMain">
			</li>
		</ul>
		</form>
		</div>
	</div>
	 <div class="box">
		<div class="yearBox">
		<form method="post" action="/CULTURESLOT/CS_content/genre.do" id="randomYearForm" onSubmit="return pageMove()">
		<ul class="year_ul">
			<li class="year_li">
				<div id="yearSlot" class="yearSelect"> 
					<input type="text" value="????" name="year" id="year" size="4" readOnly  class="yearSelect"/><br />
				</div>
			</li>
			<li class="year_li">
				<input type="button" value="랜덤" name="randomBTN" id="randomBTN" onclick="randomMake()" class="btnMain"/>
			</li>
			<li class="year_li">
				<input type="submit" value="이동"  class="btnMain"/>
				<input type="hidden" id = "hiddenYear"/>
			</li>
		</ul>
		</form>
		</div>
	</div>
</div>
 </body>
</html>

