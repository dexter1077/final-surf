<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>월별 집계</title>
</head>
	
<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

// Load the Visualization API and the corechart package.
google.charts.load('current', {packages: ['corechart', 'bar']});
// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
/*저장 데이터*/
var data = google.visualization.arrayToDataTable([
	['month', '수입(원)'],
	<c:forEach var="l" items="${ list }">
	['${l.month}월', ${ l.loan }],
	</c:forEach>
]);
	/*표현 옵션*/
	var options = {
	width: 750,
	height: 400,
	bar: { groupWidth: '60%' },
	isStacked: true,
	chartArea: {left: 0, right:0}
	};

	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}
</script>
<style>
		
	.content {
		padding: 40px 0px 0px 40px;
	}

	.path {
		font-size: 20px;
		font-weight: 700;
		font-family: 'Nanum Gothic', sans-serif;
	}

	.stats-menu {
		width: 570px;
		height: 70px;
		background: rgba(200, 200, 200, 0.5);
		line-height: 70px;
		font-size: 13px;
	}

	.stats-menu>* {
		margin-left: 13px;
	}

	.stats-head {
		width: 750px;
		height: 50px;
		background: rgba(200, 200, 200, 0.5);
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: 700;
		line-height: 50px;
	}

	.stats-head>span:first-child {
		margin-left: 20px;
	}

	.stats-head>span:nth-child(3) {
		margin-left: 30px;
		width: 420px;
		height: 50px;
		display: inline-block;
	}

	.stats-head>span:last-child {
		width: 180px;
		display: inline-block;
	}

	/*차트 스타일 선택*/
	#table_div{
		margin-top: 50px;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: 600;
	}
	#table_div th{
		text-align: center;
		background: rgb(219, 219, 219);
		color: rgb(73, 73, 73);
	}
	#table_div td{
		text-align: right;
	}

	.table-style{
		color:rgb(32, 155, 212);
	}

	.table-style:hover, .column-style:hover{
		color:rgb(32, 155, 212);
		cursor: pointer;
	}

	#chart_div{
		display: none;
	}
</style>

<body>
	<jsp:include page="common/teacherPage.jsp" />
	<div class="content">
		<div class="path">
			정산내역관리 > 월별집계
		</div>
		<br>
		<div class="stats-menu">
			<select id="classSelect" name="classNo" class="form-control"
				style="width: 300px; height: 40px; display: inline;" onchange="changeClass();">
				<option value="0">전체 클래스</option>
				<c:forEach var="c" items="${ clist }">
					<option value="${ c.classNo }">${ c.classTitle }</option>
				</c:forEach>
			</select>
			<select style="width: 100px; height: 40px; display: inline;" class="form-control">
				<option value="2021">2021</option>
			</select>
			<input type="checkbox" name="tax-option" id="extTax" checked onchange="changeClass();"><label for="extTax">수수료제외</label>
		</div>
		<br>
		<br>
		<div class="stats-head">
			<span class="table-style">표</span> | <span class="column-style">그래프</span>
			<span>전체 클래스 수익 월별 집계</span>
			<span align="right">총 수익 : ${ allCount }원</span>
		</div>
		<div id="table_div">
			<table border="2">
				<c:forEach var="i" begin="1" end="6">
					<tr width="750px">
						<th width="187px">${ i }월</th>
						<td width="187px" class="month${ i }">${ list[i-1].loan }원</td>
						<th width="187px">${ i + 6 }월</th>
						<td width="187px" class="month${ i + 6 }">${ list[i+5].loan }원</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="chart_div"></div>
		<div>

		</div>
	</div>
	</div>
	</div>

	<c:forEach var="i" begin="1" end="12">
		<script>
			var loan = parseInt('${list[i-1].loan}');
			$('.month${i}').text(loan.toLocaleString() + '원');					
		</script>
	</c:forEach>

	<script>
		
		$(function(){
			var $table = $('.table-style');
			var $column = $('.column-style');

			$table.on('click',function(){
				$column.css('color', 'black');
				$(this).css('color', 'rgb(32, 155, 212)');
				$('#chart_div').hide();
				$('#table_div').show();
			});

			$column.on('click',function(){
				$table.css('color', 'black');
				$(this).css('color', 'rgb(32, 155, 212)');
				$('#table_div').hide();
				$('#chart_div').show();
			})
			
		})

		// 수수료 '포함/미포함' 조회
		function changeClass(){

			var cno = $('#classSelect').val();
			var taxOption = $('input[name=tax-option]').is(':checked');
			
			$('.stats-head').children('span').eq(2).text($('option[value=' + cno + ']').text());

			$.ajax({
				type: 'post',
				url: 'ajaxSelectClassLoan.te',
				data : {
					classNo : cno
				}, success : function(classLoan){
					var changedData = [['month', '수입(원)']];
					var Allcount = 0;

					if(taxOption == true){ // 수수료 제외 버튼 on(= 수수료제외 표현 금액)

						for(var i in classLoan) {
							// 구글 차트 데이터 변경
							changedData.push([classLoan[i].month + '월', Number(classLoan[i].loan) * 0.9]);
	
							// 표스타일 차트 데이터 변경
							var loan = parseInt(classLoan[i]);
							$('.month' + classLoan[i].month).text(((classLoan[i].loan) * 0.9 ).toLocaleString() + '원');
	
							// 한 클래스의 총 수익
							Allcount += (classLoan[i].loan * 0.9);
						}
					}else{ // 수수료 제외 버튼 off (= 수수료포함 표현 금액)

						for(var i in classLoan) {
							// 구글 차트 데이터 변경
							changedData.push([classLoan[i].month + '월', Number(classLoan[i].loan)]);
	
							// 표스타일 차트 데이터 변경
							var loan = parseInt(classLoan[i]);
							$('.month' + classLoan[i].month).text(classLoan[i].loan.toLocaleString() + '원');
	
							// 한 클래스의 총 수익
							Allcount += classLoan[i].loan;
						}

					}
					// 총 수익 표시
					$('.stats-head').children('span').eq(3).text('총 수익 : ' + Allcount.toLocaleString() + '원');
					
					google.charts.load('current', {packages: ['corechart', 'bar']});
					google.charts.setOnLoadCallback(drawChart);
					
					function drawChart() {
						/*저장 데이터*/
						var data = google.visualization.arrayToDataTable(changedData);
							/*표현 옵션*/
							var options = {
							width: 750,
							height: 400,
							bar: { groupWidth: '60%' },
							isStacked: true,
							chartArea: {left: 0, right:0}
							};
					
							var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
							chart.draw(data, options);
					}
					
				}, error : function(){

				}
			});
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>