<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 조사 통계</title>

<!-- Google Chart API -->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<style>
#content {
	font-family: 'Nanum Gothic', sans-serif;
	width: 980px;
	height: 850px;
	float: left;
}

#page-title {
	font-size: 20px;
	font-weight: 600;
	width: 300px;
	margin-top: 40px;
	margin-left: 40px;
}

#select-wrap {
	float: left;
	margin-top: 30px;
	margin-left: 45px;
	width: 650px;
	height: 40px;
}

#select-wrap>label {
	float: left;
	margin-top: 6px;
}

#select-wrap>select {
	float: left;
	width: 500px;
	margin-left: 15px;
}

#stats-date {
	float: left;
	margin-top: 47px;
	margin-left: 70px;
}

#stats-wrap {
	width: 920px;
	height: 650px;
	overflow: hidden;
	margin-top: 80px;
	margin-left: 40px;
	background-color: whitesmoke;
	border-radius: 1pc;
	position: relative;
}

#respondent {
	position: absolute;
	float: right;
	top: 15px;
	right: 20px;
	font-size: 17px;
	font-weight: 600;
}
</style>
</head>
<body>

	<jsp:include page="common/teacherPage.jsp" />

	<div id="content">
		<div id="page-title">클래스 통계 > 설문 조사 통계</div>
		<div id="select-wrap">
			<label for="select-class">조회 클래스 선택</label>
			<select class="form-control" id="select-class" name="selectClass">
				<option value="all">전체 클래스</option>
				<c:forEach var="c" items="${ clist }">
					<option value="${ c.classNo }">${ c.classTitle }</option>
				</c:forEach>
			</select>
		</div>
		<script>
	    	$("#select-class").change(function(){
				var cno = { "cno": $(this).val() };
				ajaxRespondentCount();
				ajaxSurveyStats();
				resetSelectTime();
	    	})
		</script>

		<div id="stats-date"></div>
		<script>
			$(function(){
				resetSelectTime();
			})
		
			function resetSelectTime() {
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var hours = ('0' + today.getHours()).slice(-2); 
				var minutes = ('0' + today.getMinutes()).slice(-2);
				var selectTime = year + '. ' + month  + '. ' + day + '. ' + hours + ':' + minutes + ' 기준';
				$("#stats-date").text(selectTime);
			}
		</script>

		<div id="stats-wrap">
			<div id="respondent"></div>
			<script>
				function ajaxRespondentCount(){
					$.ajax({
						url:"ajaxRespondentCount.te",
						data:{"cno":$("#select-class").val()},
						success:function(resCount){
							$("#respondent").text("총 응답자 : " + resCount + "명");
						},error:function(){
							console.log("응답수 조회 ajax 통신 실패");
						}
					})
				}
			</script>
			
			<div id="chart1"></div>
			<script>
				function statsPromise(){
		        	/*console.log("promise start");*/
		        	return new Promise(function(resolve, reject) {
		        		setTimeout(function() { 
		        			resolve();
		        		})
		        })};
			
				window.onload = function(){
					statsPromise()
		            .then(ajaxRespondentCount)
		        	.then(ajaxSurveyStats);
		        }
				
                google.charts.load('current', {packages: ['corechart', 'bar']});

                function ajaxSurveyStats(){
                	
		            var arr = [
		            	['점수', '5점', '4점', '3점', '2점', '1점'] 
		            ];
		            
		            $.ajax({
						url:"ajaxSurveyStats.te",
						data:{"cno":$("#select-class").val()},
						success:function(list){
							$.each(list, function(i, obj){
								var a = [obj.dataUnit, obj.score5, obj.score4, obj.score3, obj.score2, obj.score1];
								arr.push(a);
							})
							drawStacked(arr);
						},error:function(){
							console.log("설문 조사 통계 차트 ajax 통신 실패");
						}
					})
		        }

                function drawStacked(dataArr) {
                    var data = google.visualization.arrayToDataTable(dataArr);
                    
                    var options = {
                        isStacked: 'percent',
                        width : 950,
                        height: 650,
                        backgroundColor: 'transparent',
                        legend: {
                        position: 'top',
                        maxLines: 3
                    },
                    hAxis: {
                        minValue: 0,
                        ticks: [0, 0.2, 0.4, 0.6, 0.8, 1]
                    }
                };
                var chart = new google.visualization.BarChart(document.getElementById('chart1'));
                chart.draw(data, options);
                }
            </script>
		</div>
	</div>
	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>