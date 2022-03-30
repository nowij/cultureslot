<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 회원 통계</title>
<style>
#memberStat {
	margin: 0 auto;
	margin-top:140px;
	width: 80%;
	border: 1px solid #BDBDBD;
	text-align:center;
}
#memberStat h1{
	width:100%;
	font-family:'나눔바른고딕';
	font-size:30pt;
	margin:0 auto;
	margin-top:50px;
	margin-bottom:50px;
}
#memberStat table{
	font-family:'나눔바른고딕';
}
#memberStat th{
	heigth:140px;
	font-size:24pt;
}
#memberStat tr{
	height:40px;
}

#memberStat #ageStat {
	margin: 0 auto;
}

#memberStat #genStat {
	margin: 0 auto;
	margin-top:100px;
	width:80%;
}
#memberStat #genStat table{
	margin: 0 auto;
	width:70%;
}
</style>


 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    
    google.charts.setOnLoadCallback(drawAgeChart);
    google.charts.setOnLoadCallback(drawGenderChart);
    google.charts.setOnLoadCallback(drawAgePercentage);
    google.charts.setOnLoadCallback(drawGenderPercentage);
    
    // 연령대 별 회원 수 막대 그래프 그리기
    function drawAgeChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "회원 수", { role: "style" } ],
        ["10대 이하", ${age10}, "#BC75D1"],
        ["20대", ${age20}, "#7B71D0"],
        ["30대", ${age30}, "#6AA5CD"],
        ["40대", ${age40}, "color: #6ACDC2"],
        ["50대", ${age50}, "color: #77CD6A"],
        ["60대", ${age60}, "color: #98CD6A"],
        ["연령 불명", ${ageNone}, "color: #CED071"]
      ]);
      
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
	
      var options = {
        title: "연령대 별 회원 수",
        width: 1000,
        height: 450,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
        fontName:'나눔바른고딕',
        fontSize:18,
        titleTextStyle:{fontName:'나눔바른고딕',fontSize:20},
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("memberAgeGroup"));
      chart.draw(view, options);
  }
    // 연령대 별 회원 분포 원형 그래프 그리기
    function drawAgePercentage() {

        var data = google.visualization.arrayToDataTable([
          ['age', 'percentage'],
          ['10대 이하',${age10}],
          ['20대',${age20}],
          ['30대',${age30}],
          ['40대',${age40}],
          ['50대',${age50}],
          ['60대',${age60}],
          ['연령대 불명',${ageNone}]
        ]);

        var options = {
          title: '연령대 별 회원 분포',
          fontName:'나눔바른고딕',
          width:450,
          height:450,
          chartArea:{width:400},
          titleTextStyle:{fontName:'나눔바른고딕',fontSize:20},
          legend:{textStyle:{fontSize:18, fontName:'나눔바른고딕'}},
          fontSize:18
        };

        var chart = new google.visualization.PieChart(document.getElementById('meberAgeGroupPercentage'));

        chart.draw(data, options);
      }
    
    // 성별 별 회원 수 차트 그리기
    function drawGenderChart() {
        var data = google.visualization.arrayToDataTable([
          ["Element", "회원 수", { role: "style" } ],
          ["남성", ${maleCount}, "#7597D1"],
          ["여성", ${femaleCount}, "#D279A9"],
        ]);
        
        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
                         { calc: "stringify",
                           sourceColumn: 1,
                           type: "string",
                           role: "annotation" },
                         2]);
  	
        var options = {
          title: "성별 별 회원 수",
          width: 450,
          height: 450,
          bar: {groupWidth: "95%"},
          legend: { position: "none" },
          fontName:'나눔바른고딕',
          titleTextStyle:{fontName:'나눔바른고딕',fontSize:20},
          fontSize:18,
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("memberGenderGroup"));
        chart.draw(view, options);
   	 }
 // 성별 별 회원 분포 원형 그래프 그리기
    function drawGenderPercentage() {

        var data = google.visualization.arrayToDataTable([
          ['gender', 'percentage'],
          ["남성", ${maleCount}],
          ["여성", ${femaleCount}]
        ]);

        var options = {
          title: '성별 별 회원 분포',
          fontName:'나눔바른고딕',
          titleTextStyle:{fontName:'나눔바른고딕',fontSize:20},
          chartArea:{width:400},
          width:450,
          height:450,
          legend:{textStyle:{fontSize:18, fontName:'나눔바른고딕'}},
          fontSize:18
        };

        var chart = new google.visualization.PieChart(document.getElementById('memberGenderGroupPercentage'));

        chart.draw(data, options);
      }
    
 </script>
 </head>
 <body>
 <%@ include file="/etc/adminTop.jsp" %>
 <div id ="memberStat">
 <h1>- 회원 통계 -</h1>
	 <div id ="ageStat">
	 <h2>[ 연령대 별 회원 통계 ]</h2>
	 <table>
			<tr>
				<td>
					<div id="memberAgeGroup"></div>
				</td>
				<td>
					<div id="meberAgeGroupPercentage"></div>
				</td>
		</table>
	</div>
	<div id ="genStat">
	 <h2>[ 성별 별 회원 통계 ]</h2>
		<table>
			<tr>
				<td>
					<div id="memberGenderGroup"></div>
				</td>
				<td>
					<div id="memberGenderGroupPercentage"></div>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>