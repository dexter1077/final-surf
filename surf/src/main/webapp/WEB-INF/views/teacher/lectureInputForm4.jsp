<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content{
		width:740px;
		height:440px;
	}
	.content>div{width:100%;}
	.content>div:first-child{height: 250px;}
	.content>div:last-child{height: 190px;}

	.content>div:first-child>div{height:100%; float: left;}
	.content>div:first-child>div:first-child{width:440px;}
	.content>div:first-child>div:last-child{width:300px;}

	#posTerm, #price{
		width: 170px; text-align: right; font-weight: 700;
		height: 40px;
		display: inline-block;
		margin-left: 45px;
		margin-bottom: 10px;
	}
	#posTerm:hover{
		cursor: pointer;
		background-color: rgba(250, 250, 250);
		opacity: 0.9;
	}
	#posTerm{
		text-align-last: right;
		appearance: none;
	}
	#posTerm option{
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: 700;
	}


	.note1{
		width: 280px;
		height: 200px;
	}

	.note2{
		width: 720px;
		height: 140px;
	}
</style>
</head>
<body>
	<jsp:include page="common/lectureEnrollForm.jsp"/>
	<script>
		$(function(){
			$('.menubar').css('height', '800px');
			$('.outer').css('height', '800px');
		})
	</script>
	<div class="content">
		<div>
			<div>
				<form id="inputForm" action="updateLecture.te" method="POST">
				<input type="hidden" name="classNo" value="${ l.classNo }">
	            <input type="hidden" name="currentPage" value="${currentPage}">
				<label class="guide">오픈 전 확인사항입니다<br>꼼꼼히 확인 해 주세요.</label>
				<br>
				<br>
				<label class="subGuide">수강가능기간</label>
				<select id="posTerm" name="posTerm" class="form-control" onchange="selectPosTerm();">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3" selected>3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> <b>개월</b>
				<br>
				<label class="subGuide">수강금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input id="price" name="spPrice" type="text" class="form-control" placeholder="금액 입력" value="<c:if test='${l.price ne 0}'>${l.price}</c:if>"> <b>원</b>
				</form>
			</div>
			<div>
				<div class="note-area note1">
					<span class="qus-title"> 정산 방식 및 수익 구조는 어떻게 되나요?</span>
						<p class="qus-answer">
							&nbsp;저희 surf 에서는 사이트 관리 및 서버관리 등<br>
							다양한 강사님들을에게 환경을 제공하고 있습니다.<br>
							&nbsp;계약된 정산 기중에 의거 <b>매달 5번째 영업일</b>에<br>
							정산되며, 정산 비율 혹은 금액은 계약(수수료 10%<br>
							제외)에 따라 달라집니다.
							<br><br>
							&nbsp;단, <b>첫 정산은 클래스 런칭일이 속한 다음달</b>에<br>
							이루어져요!
						</p>
				</div>
			</div>
		</div>
		<div>
			<div class="note-area note2">
				<span class="qus-title" style="color:rgb(255, 123, 0); padding-left:10px;">오픈 전 주의사항!</span>
					<p class="qus-answer" style="padding-left:10px;">
						&nbsp;오픈한 강의는 일반적으로 수강생들의 혼란 및 불만을 막고자 저희 surf에서는 수정하는 기능이 제한됩니다.<br>
						예외적으로 문의(02-333-3333)를 주시면 문의 내용을 듣고 다시 재검토 상태로 돌려드리고 수정제한 기능을 풀어드릴 수 있습니다.<br><br>
						&nbsp;한번 더 오픈 전 강의 내용을 확인 해주시길 바라며 재검토 요청을 빈번하게 요청하는 강사에 한해 강사승인이 반려 될 수 <br>
						있음을 알려드립니다.
					</p>
			</div>
		</div>
	</div>

	<%-- 수강기간 불러온 데이터 있을 경우 selected --%>
	<c:if test="${l.posTerm ne 0}">
		<script>
			$('option[value=3]').removeAttr('selected');
			$('option[value=${l.posTerm}]').attr('selected', true);
		</script>
	</c:if>

	<script>
	
		// 금액 구분자 (,)
		$(document).on("focusout", "input[name=spPrice]", function(){
			$(this).val( $(this).val().replace(",","") );
			$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
			$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );	
		});

		$(function(){
			spPrice();

			$('input[name=spPrice]').keyup(function(){
				$('#save-btn').attr('disabled', true);

				if($(this).val().length == ""){
					return false;
				}
				checkSuccess();
			})


			// 강의 완성도 확인하고 
		})

		// posTerm select 시 조건검사
		function selectPosTerm(){

			if($('input[name=spPrice]').val.length < 0){
				return false;
			}

			checkSuccess();
		}

		// 처음 금액 로드 시 
		function spPrice(){
			var spPrice = $('input[name=spPrice]');

			$('input[name=spPrice]').val( $(spPrice).val().replace(",","") );
			$('input[name=spPrice]').val( $(spPrice).val().replace(/[^-\.0-9]/gi,"") );
			$('input[name=spPrice]').val( $(spPrice).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
		}
	</script>

	<jsp:include page="common/lectureEnrollFormFooter.jsp"/>
</div>
</body>
</html>