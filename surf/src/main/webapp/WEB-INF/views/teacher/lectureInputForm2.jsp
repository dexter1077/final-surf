<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록하기_소개</title>
<style type="text/css">
</style>
<style>
	/*icon 이미지 */
	.close-btn {
		display: none;
		margin-left: 10px;
		margin-top: 80px;
		background-size: 30px;
		background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnIHRyYW5zZm9ybT0ibWF0cml4KDEsMCwwLDEsMCwwKSI+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMSAxKSI+Cgk8Zz4KCQk8Zz4KCQkJPHBhdGggZD0iTTQzNi4wMTYsNzMuOTg0Yy05OS45NzktOTkuOTc5LTI2Mi4wNzUtOTkuOTc5LTM2Mi4wMzMsMC4wMDJjLTk5Ljk3OCw5OS45NzgtOTkuOTc4LDI2Mi4wNzMsMC4wMDQsMzYyLjAzMSAgICAgYzk5Ljk1NCw5OS45NzgsMjYyLjA1LDk5Ljk3OCwzNjIuMDI5LTAuMDAyQzUzNS45OTUsMzM2LjA1OSw1MzUuOTk1LDE3My45NjQsNDM2LjAxNiw3My45ODR6IE00MDUuODQ4LDQwNS44NDQgICAgIGMtODMuMzE4LDgzLjMxOC0yMTguMzk2LDgzLjMxOC0zMDEuNjkxLDAuMDA0Yy04My4zMTgtODMuMjk5LTgzLjMxOC0yMTguMzc3LTAuMDAyLTMwMS42OTMgICAgIGM4My4yOTctODMuMzE3LDIxOC4zNzUtODMuMzE3LDMwMS42OTEsMFM0ODkuMTYyLDMyMi41NDksNDA1Ljg0OCw0MDUuODQ0eiIgZmlsbD0iI2JkMWMxYyIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiIgY2xhc3M9IiI+PC9wYXRoPgoJCQk8cGF0aCBkPSJNMzYwLjU5MiwxNDkuNDA4Yy04LjMzMS04LjMzMS0yMS44MzktOC4zMzEtMzAuMTcsMGwtNzUuNDI1LDc1LjQyNWwtNzUuNDI1LTc1LjQyNWMtOC4zMzEtOC4zMzEtMjEuODM5LTguMzMxLTMwLjE3LDAgICAgIHMtOC4zMzEsMjEuODM5LDAsMzAuMTdsNzUuNDI1LDc1LjQyNUwxNDkuNDMsMzMwLjRjLTguMzMxLDguMzMxLTguMzMxLDIxLjgzOSwwLDMwLjE3YzguMzMxLDguMzMxLDIxLjgzOSw4LjMzMSwzMC4xNywwICAgICBsNzUuMzk3LTc1LjM5N2w3NS40MTksNzUuNDE5YzguMzMxLDguMzMxLDIxLjgzOSw4LjMzMSwzMC4xNywwYzguMzMxLTguMzMxLDguMzMxLTIxLjgzOSwwLTMwLjE3bC03NS40MTktNzUuNDE5bDc1LjQyNS03NS40MjUgICAgIEMzNjguOTIzLDE3MS4yNDcsMzY4LjkyMywxNTcuNzQsMzYwLjU5MiwxNDkuNDA4eiIgZmlsbD0iI2JkMWMxYyIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiIgY2xhc3M9IiI+PC9wYXRoPgoJCTwvZz4KCTwvZz4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8L2c+PC9zdmc+)
	}
	.addImage {
		width: 400px;
		height: 200px;
		margin-right: 30px;
		background-size: 50px;
		background-repeat: no-repeat;
		background-position: center center;
		background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgd2lkdGg9IjUxMiIgaGVpZ2h0PSI1MTIiPjx0aXRsZT5BZGQgUGhvdG88L3RpdGxlPjxwYXRoIGQ9Ik0yMTUuMjU1LDIzMC4xMDhhNDMuMTg0LDQzLjE4NCwwLDEsMC00My4xODQtNDMuMTg0QTQzLjIzMyw0My4yMzMsMCwwLDAsMjE1LjI1NSwyMzAuMTA4Wm0wLTcwLjM2OGEyNy4xODQsMjcuMTg0LDAsMSwxLTI3LjE4NCwyNy4xODRBMjcuMjE1LDI3LjIxNSwwLDAsMSwyMTUuMjU1LDE1OS43NFoiLz48cGF0aCBkPSJNNDU0LDMzOEg0MTlWMzAzYTgsOCwwLDAsMC0xNiwwdjM1SDM2OWE4LDgsMCwwLDAsMCwxNmgzNHYzNGE4LDgsMCwwLDAsMTYsMFYzNTRoMzVhOCw4LDAsMCwwLDAtMTZaIi8+PHBhdGggZD0iTTQ3MiwyNzMuMTI5VjEyMS43MjRDNDcyLDk1LjI1Niw0NTAuMjA5LDc0LDQyMy43NDEsNzRINTQuNzUzQTQ3LjYwOCw0Ny42MDgsMCwwLDAsNywxMjEuNzI0VjM2Mi44MjlDNywzODkuMywyOC4yODYsNDExLDU0Ljc1Myw0MTFIMzQ1LjYzOWE5My42LDkzLjYsMCwwLDAsMTU5LjczNy02Ni4xNzZDNTA1LjM3NiwzMTYuMDg0LDQ5MiwyOTAuMjkzLDQ3MiwyNzMuMTI5Wk01NC43NTMsOTBINDIzLjc0MUM0NDEuMzg2LDkwLDQ1NiwxMDQuMDc5LDQ1NiwxMjEuNzI0VjI2Mi4zYTkzLjA4MSw5My4wODEsMCwwLDAtNDQuMTE5LTExLjAxNiw5NS4xLDk1LjEsMCwwLDAtMTAuNDYuNTgxTDMzNC40LDIwNC40MTFhOC4wMjEsOC4wMjEsMCwwLDAtMTAuMjQ5LjgyMkwyMzMuODI3LDI5NCwxMjguODUsMjQyLjg0YTcuNzY0LDcuNzY0LDAsMCwwLTcuNC4yNzFMMjMsMzAwLjI4NFYxMjEuNzI0QTMxLjU5MSwzMS41OTEsMCwwLDEsNTQuNzUzLDkwWk0yMywzNjIuODI5VjMxOC43ODFMMTI1Ljc5MSwyNTkuMDlsOTUuOTgzLDQ2Ljg5NEwxMzEuMjMxLDM5NUg1NC43NTNBMzEuOTczLDMxLjk3MywwLDAsMSwyMywzNjIuODI5Wk0xNTQuMDU3LDM5NSwzMzAuNTc4LDIyMS40Mmw0OS44ODgsMzUuM2E5My43MzcsOTMuNzM3LDAsMCwwLTYyLjIxLDg4LjE3YzAsMTguNCw1LjM0NCwzNS4xMTIsMTQuNTU3LDUwLjExMlptMjU3LjY5NCwyNy4yNzZhNzcuNSw3Ny41LDAsMSwxLDc3LjUtNzcuNDk1QTc3LjU4Myw3Ny41ODMsMCwwLDEsNDExLjc1MSw0MjIuMjc2WiIvPjwvc3ZnPgo=)
	}
	.addImage:hover{
		cursor: pointer;
		background-color:rgba(244, 244, 244, 0.945);
	}

	.content{
		width: 750px;
	}
	.content>form>div{width: 100%;}

	/*영역 나누기*/
	.content>form>div:nth-child(1){height:80px;}
	.content>form>div:nth-child(2){height:250px;}
	.content>form>div:nth-child(3){height:40px;}
	
	/*2번째 블록 좌우 영역 나누기*/
	.content>form>div:nth-child(2)>div{
		float: left;
		height: 100%;
	}
	.content>form>div:nth-child(2)>div:nth-child(1){width: 460px;}
	.content>form>div:nth-child(2)>div:nth-child(2){width: 285px;}
	/*2번째 블록 content css*/
	#introTitle{
		width: 400px;
		height: 40px;
	}
	#introContent{
		width: 400px;
		height: 100px;
		resize: none;
	}
	
	.note1{
		width: 252px;
		height: 115px;
	}
	
	/*복제 영역*/
	.introBox{
		width: 800px;
		height: 200px;
		margin-bottom: 50px;
	}
	.introBox>div{
		float: left;
		height: 100%;
	}

	.introBox>div:first-child{
		width: 400px;
		height: 200px;
		border: 1px solid lightgray;
		margin-right: 30px;
	}

	.inputFile{
		display:none;
	}

	.close-btn:hover{
		cursor: pointer;
		opacity: 0.8;
	}
</style>
</head>
<body>
	<jsp:include page="common/lectureEnrollForm.jsp"/>
	
	<div class="content">
		<form id="inputForm" action="updateLecture2.te" method="POST" enctype="multipart/form-data">
			<div>
				<input type="hidden" name="classNo" value="${ l.classNo }">
	            <input type="hidden" name="currentPage" value="${currentPage}">
				<input type="hidden" name="beforeIntroLength" value="${fn:length(introList)}">
				<label class="guide">어떤 걸 알려 주실 수 있나요?</label>
				<label class="note">강의소개 메뉴를 통해 학생들에게 강의를 설명 할 수 있어요.</label>
			</div>
			<div>
				<div>
					<label for="introTitle" class="subGuide">강의소개 타이틀</label>
					<input type="text" name ="introTitle" id="introTitle" class="form-control" placeholder="컨셉이 잘 드러나는 클래스의 제목을 지어주세요" value="${ l.introTitle }">
					<br>
					<label for="introContent" class="subGuide">강의소개 설명</label>
					<textarea name="introContent" id="introContent" cols="30" rows="10" class="form-control" placeholder="내용을 입력해주세요">${ l.introContent }</textarea>
				</div>
				<div>
					<div class="note-area note1">
						<span class="qus-title">강의소개는 뭔가요?</span>
						<p class="qus-answer">
							강의 상세 조회 페이지에서 학생들이 강의소개<br>
							메뉴를 누르면 해당 작성내용을 토대로 강의<br>
							소개를 하게 됩니다. 
						</p>
					</div>
				</div>
			</div>
			<div>
				<label for="introContent" class="subGuide">클래스 설명</label>
			</div>
			<div id="clone-area">
				<div class="introBox intro1">
					<input type="hidden" name="classIntroList[0].introOrder" value="1">
					<input type="hidden" name="classIntroList[0].classNo" value="${ l.classNo }">
					<input type="hidden" name="classIntroList[0].introImage" value="${ introList[0].introImage }">
					<div class="addImage">
						<img id="introImg1" width="400px" height="200px" <c:if test="${introList[0].introImage ne null}">src="${ introList[0].introImage }"</c:if>">
					</div>
					<input id="inputFile1" type="file" class="inputFile" name="upfile" onchange="loadImg(this);">
					<div>
						<textarea name="classIntroList[0].introContent" id="introContent1" class="form-control" style="width: 300px; height: 200px; resize:none;" placeholder="클래스 설명 이미지에 맞는 클래스 설명을 적어주세요.">${ introList[0].introContent }</textarea>
					</div>
					<div class="close-btn" style="width: 30px; height: 30px;">
					</div>
				</div>
				<div class="introBox intro2">
					<input type="hidden" name="classIntroList[1].introOrder" value="2">
					<input type="hidden" name="classIntroList[1].classNo" value="${ l.classNo }">
					<input type="hidden" name="classIntroList[1].introImage" value="${ introList[1].introImage }">
					<div class="addImage">
						<img id="introImg2" width="400px" height="200px" <c:if test="${introList[1].introImage ne null}">src="${ introList[1].introImage }"</c:if>>
					</div>
					<input id="inputFile2" type="file" class="inputFile" name="upfile" onchange="loadImg(this);">
					<div>
						<textarea name="classIntroList[1].introContent" id="introContent2" class="form-control" style="width: 300px; height: 200px; resize:none;" placeholder="클래스 설명 이미지에 맞는 클래스 설명을 적어주세요.">${ introList[1].introContent }</textarea>
					</div>
					<div class="close-btn" style="width: 30px; height: 30px;">
					</div>
				</div>
			
				<c:forEach var="intro" begin="3" end="${fn:length(introList)}">
					<div class="introBox intro${intro}">
						<input type="hidden" name="classIntroList[${intro-1}].introOrder" value="${intro}">
						<input type="hidden" name="classIntroList[${intro-1}].classNo" value="${ l.classNo }">
						<input type="hidden" name="classIntroList[${intro-1}].introImage" value="${ introList[intro-1].introImage }">
						<div class="addImage">
							<img id="introImg${intro}" width="400px" height="200px" src="${introList[intro-1].introImage}">
						</div>
						<input type="file" id="inputFile${intro}" class="inputFile" name="upfile" onchange="loadImg(this);">
						<div>
							<textarea name="classIntroList[${intro-1}].introContent" id="introContent${intro}" 
							class="form-control" style="width: 300px; height: 200px; resize:none;" placeholder="클래스 설명 이미지에 맞는 클래스 설명을 적어주세요.">${ introList[intro-1].introContent }</textarea>
						</div>
						<div class="close-btn" style="width: 30px; height: 30px;">
						</div>
					</div>
				</c:forEach>
			</div>
			<div align="center">
				<button type="button" id="clone-btn" class="btn btn-info">+ 클래스 설명 추가</button><br>
				<label style="font-size:12px; color:gray">※클래스 설명은 최소 2개에서 최대6개까지 작성 할 수 있습니다.</label>
			</div>
		</form>
	</div>
	<jsp:include page="common/lectureEnrollFormFooter.jsp"/>
</div>
<script>
	$(function(){	// 클래스 설명 요소 추가, 제거버튼 hover, 제거
		var introCount = 2;

		<c:if test="${introList[0] ne null}">
			introCount = ${fn:length(introList)};
		</c:if>

		// 박스 추가 버튼
		$('#clone-btn').click(function(){
			if(introCount < 6){
				var $clone = $('#clone-area>div:last-child').clone(true);

				//$clone.addClass('intro' + (introCount + 1)).removeClass('intro' + introCount);
				
				$clone.children('input').eq(0).attr('name', 'classIntroList[' + (introCount) + '].introOrder').val(introCount + 1);
				$clone.children('input').eq(1).attr('name', 'classIntroList[' + (introCount) + '].classNo').val(${l.classNo});
				$clone.children('input').eq(2).attr('name', 'classIntroList[' + (introCount) + '].introImage').removeAttr('value');
				$clone.find('input[type=file]').attr('id', 'inputFile' + (introCount + 1)).removeAttr('src').val(null).removeAttr('value');
				$clone.find('textarea').attr('name', 'classIntroList[' + (introCount) + '].introContent').text("").val("").attr('id', 'introContent' + (introCount + 1));
				$clone.find('img').attr('src', null).removeAttr('src').attr('id', 'introImg' + (introCount + 1));
				
				$('#clone-area').append($clone);
				
				++introCount;

				operationCheck();
			}
		});
		
		// 박스 제거 버튼 노출
		$('.introBox')
		.on('mouseover', function(){
			if(introCount> 2){
				$(this).find('.close-btn').show();
			}
			$('.intro').children('.close-btn').hide();
		})
		.on("mouseout", function(){
			$(this).children('.close-btn').hide();
		});
		
		// 박스제거 버튼 기능
		$('.close-btn').on('click', function(){
			$('#inputForm').children('div').eq(0).prepend('<input type="hidden" name="deleteName" value="' + $(this).siblings('.addImage').children('img').attr('src') + '">');

			$(this).parent('.introBox').remove();
			--introCount;

			for(var i=0; i<introCount; i++){

				$('#clone-area').children('div').eq(i).addClass('intro' + (i+1));
				$('#clone-area').children('div').eq(i).children('input[type=file]').attr('id', 'inputFile' + (i+1)).removeAttr('src');
				$('#clone-area').children('div').eq(i).children('input').eq(0).attr('name', 'classIntroList[' + i + '].introOrder').val(i + 1);
				$('#clone-area').children('div').eq(i).children('input').eq(1).attr('name', 'classIntroList[' + i + '].classNo');
				$('#clone-area').children('div').eq(i).children('input').eq(2).attr('name', 'classIntroList[' + i + '].introImage');
				$('#clone-area').children('div').eq(i).find('textarea').attr('name', 'classIntroList[' + i + '].introContent').attr('id', 'introContent' + (i + 1));
				$('#clone-area').children('div').eq(i).find('img').attr('id', 'introImg' +(i+1));
			}

			operationCheck();
		});
		
		$(document).on("keyup", 'input, textarea', function(){
			
			operationCheck();
		})
		
		beforeOperationCheck($('input[name=beforeIntroLength]').val());
	})

	// 이미지 미리보기
	function loadImg(inputFile){ 

		if(inputFile.files.length == 1){    //선택한 파일이 존재하는 경우
			var reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			reader.onload = function(e){$(inputFile).siblings('.addImage').children('img').attr("src", e.target.result);}
		}else{
			$(inputFile).siblings('.addImage').children('img').attr("src", null);
		}
		
		operationCheck();
	}

	// 처음 강의 조건검사
	function beforeOperationCheck(num){

		// 강의 소개 타이틀
		if($('input[name=introTitle]').val().length < 6){
			return false;
		}
		
		// 강의 소개 설명 
		if($('textarea[name=introContent]').val().length < 6){
			return false;
		}
		
		for(var i=1; i<=num; i++){

			// 클래스 설명 이미지 유무체크
			if(isEmpty($('#introImg' + i).attr('src'))){
				return false;
			}
			// 클래스 설명 길이체크
			if($('#introContent' + i).val().length < 6){
				return false;
			}

		}

		onLoadCheckSuccess();
	}

	// 작성중 조건검사
	function operationCheck(){
		$('#save-btn').attr('disabled', true);

		$('#next-btn').attr("disabled", true);

		// 강의 소개 타이틀
		if($('input[name=introTitle]').val().length < 6){
			return false;
		}

		// 강의 소개 설명 
		if($('textarea[name=introContent]').val().length < 6){
			return false;
		}
		
		// '클래스 설명' 이미지
		for(var i=1; i<=$('#clone-area>div').last().children('input').eq(0).val(); i++){

			if(document.getElementById('inputFile' + i).files.length != 1 && isEmpty($('#introImg' + i).attr('src'))){
				return false;
			}

		}

		// '클래스 설명' text
		for(var i=1; i<=$('#clone-area>div').last().children('input').eq(0).val(); i++){	

			if($('#introContent' + i).val().length < 6){
				return false;
			}
		}	

		checkSuccess();

	}

	// 이미지 추가 박스 클릭시 동작
	$(document).on('click', '.addImage', function(){
		$(this).siblings(".inputFile").click();
	});
	
</script>
</body>
</html>