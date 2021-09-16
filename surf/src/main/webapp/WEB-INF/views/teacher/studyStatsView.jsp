<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 통계</title>

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
	height: 660px;
	overflow-x: hidden;
	overflow-y: auto;
	margin-top: 80px;
	margin-left: 40px;
}

#stats-wrap>div {
	position: relative;
}

#stats1, #stats2 {
	width: 900px;
	height: 300px;
	margin-bottom: 10px;
	background-color: whitesmoke;
	border-radius: 1pc;
}

#stats3, #stats4 {
	float: left;
	width: 445px;
	height: 280px;
	background-color: whitesmoke;
	border-radius: 1pc;
}

#stats3 {
	margin-right: 10px;
}

svg {
	margin-top: 15px;
}

.stats-title {
	position: absolute;
	top: 15px;
	left: 20px;
	font-size: 18px;
	font-weight: 600;
	color: rgb(51, 51, 51);
}

#stats-sort {
	position: absolute;
	top: 16px;
	left: 710px;
	z-index: 6;
	color: gray;
}

#stats-sort div {
	float: left;
}

#daily:hover, #monthly:hover{
	cursor: pointer;
}

.vertical-line {
	float: left;
	border-color: lightgray;
	border-style: solid;
	border-width: 0 0 0 1px;
	margin: 4px 8px;
	width: 0px;
	height: 15px;
	vertical-align: middle;
}
</style>
</head>
<body>

	<jsp:include page="common/teacherPage.jsp" />

	<div id="content">
		<div id="page-title">클래스 통계 > 수강 통계</div>
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
				ajaxNewOrderStats();
				ajaxStudyDaysStats();
				ajaxGenderRateStats();
				ajaxAgeGroupRateStats();
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
			<div id="stats1">
				<div class="stats-title">신규 수강 건수</div>
				<div id="stats-sort">
					<input type="hidden" value="daily" name="condition">
					<div id="daily">최근 1주일</div>
					<div class="vertical-line"></div>
					<div id="monthly">최근 6개월</div>
				</div>
				<script>
					$(function(){
						if($("input[name=condition]").val() == "daily") {
							$("#daily").css("color", "black");
						}else {
							$("#monthly").css("color", "black");
						}
					})
				
					$("#daily").click(function(){
			    		$("input[name=condition]").val("daily");
			    		$("#monthly").css("color", "gray");
	            		$(this).css("color", "black");
			    		ajaxNewOrderStats();
			    		resetSelectTime();
			   		})
			   		$("#monthly").click(function(){
			   			$("input[name=condition]").val("monthly");
			   			$("#daily").css("color", "gray");
	            		$(this).css("color", "black");
			   			ajaxNewOrderStats();
		    			resetSelectTime();
			    	})
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
			        	.then(ajaxNewOrderStats)
			            .then(ajaxStudyDaysStats)
			            .then(ajaxGenderRateStats)
			            .then(ajaxAgeGroupRateStats);
			        }
			        
					google.charts.load('current', {packages:['corechart']});
					
			        function ajaxNewOrderStats(){
	
			            var arr = [
			                ['날짜', '건수'] 
			            ];
			            
			            $.ajax({
							url:"ajaxNewOrderStats.te",
							data:{"cno":$("#select-class").val(),
								  "condition":$("input[name=condition]").val()},
							success:function(list1){
								$.each(list1, function(i, obj){
									var a = [obj.dataUnit, obj.count];
									arr.push(a);
								})
								drawChart1(arr);
							},error:function(){
								console.log("신규 수강 건수 차트 ajax 통신 실패");
							}
						})
			        }
	
			        function drawChart1(dataArr) {
	
			            var data = google.visualization.arrayToDataTable(dataArr);
			            
			            var options = {
			                width : 930,
			                height : 280,
			                bar : {
			                groupWidth : '70%'
			                },
			                legend : {
			                position : 'none'
			                },
			                hAxis: {
			                title: '날짜'
			                },
			                vAxis: {
			                title: '건수',
			                minValue: 3,
			                viewWindow:{min:0}
			                },
			                backgroundColor: 'transparent'
			            };
			            
			            var chart = new google.visualization.ColumnChart(document.getElementById('chart1'));
			            chart.draw(data, options);
			        
			        }
                </script>
			</div>

			<div id="stats2">
				<div class="stats-title">완강 소요 일수</div>
				<div id="chart2"></div>
				<script>
			        function ajaxStudyDaysStats(){
	
			            var arr = [
			                ['소요일수', '명수'] 
			            ];
			            
			            $.ajax({
							url:"ajaxStudyDaysStats.te",
							data:{"cno":$("#select-class").val()},
							success:function(list2){
								$.each(list2, function(i, obj){
									var a = [obj.dataUnit, obj.count];
									arr.push(a);
								})
								drawChart2(arr);
							},error:function(){
								console.log("완강 소요 일수 차트 ajax 통신 실패");
							}
						})
			        }

                    function drawChart2(dataArr) {
                        
                        var data = google.visualization.arrayToDataTable(dataArr);
                        
                        var options = {
                            width : 930,
                            height : 280,
                            colors: ['#1eaa96'],
                            bar : {
                                groupWidth : '70%'
                            },
                            legend : {
                                position : 'none'
                            },
                            hAxis: {
                                title: '소요일수'
                            },
                            vAxis: {
                                title: '명수',
                                minValue: 3,
    			                viewWindow:{min:0}
                            },
                            backgroundColor: 'transparent'
                        };
                        var chart = new google.visualization.ColumnChart(document.getElementById('chart2'));
                        chart.draw(data, options);
                    }
                </script>
			</div>

			<div id="stats3">
				<div class="stats-title">수강생 성별 비율</div>
				<div id="piechart1"></div>
				<script>
					function ajaxGenderRateStats(){
						
			            var arr = [
			            	['성별', '인원수'] 
			            ];
			            
			            $.ajax({
							url:"ajaxGenderRateStats.te",
							data:{"cno":$("#select-class").val()},
							success:function(list3){
								$.each(list3, function(i, obj){
									var a = [obj.dataUnit, obj.count];
									arr.push(a);
								})
								drawChart3(arr);
							},error:function(){
								console.log("수강생 성별 비율 차트 ajax 통신 실패");
							}
						})
			        }
					
                    function drawChart3(dataArr) {
                    	
                        var data = google.visualization.arrayToDataTable(dataArr);
                        
                        var options = {
                            width : 520,
                            height : 300,
                            colors: ['orange', 'yellowgreen'],
                            backgroundColor: 'transparent'
                        };
                        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
                        chart.draw(data, options);
                    }
                </script>
			</div>

			<div id="stats4">
				<div class="stats-title">수강생 연령대별 비율</div>
				<div id="piechart2"></div>
				<script>
					function ajaxAgeGroupRateStats(){
						
			            var arr = [
			            	['연령대', '인원수']
			            ];
			            
			            $.ajax({
							url:"ajaxAgeGroupRateStats.te",
							data:{"cno":$("#select-class").val()},
							success:function(list4){
								$.each(list4, function(i, obj){
									var a = [obj.dataUnit, obj.count];
									arr.push(a);
								})
								drawChart4(arr);
							},error:function(){
								console.log("수강생 연령대별 비율 차트 ajax 통신 실패");
							}
						})
			        }
					
                    function drawChart4(dataArr) {
                        var data = google.visualization.arrayToDataTable(dataArr);
                        var options = {
                            width : 520,
                            height :300,
                            backgroundColor: 'transparent'
                        };
                        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
                        chart.draw(data, options);
                    }
                </script>
			</div>
		</div>
	</div>
	</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>