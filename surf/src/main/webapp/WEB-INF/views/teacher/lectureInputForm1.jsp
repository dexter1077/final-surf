<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록하기_제목 및 커버</title>
<style>
	/*아이콘*/
	.addImage{
		width: 220px;
		height: 160px;
		background-size: 50px;
		background-repeat: no-repeat;
		background-position: center center;
		background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgd2lkdGg9IjUxMiIgaGVpZ2h0PSI1MTIiPjx0aXRsZT5BZGQgUGhvdG88L3RpdGxlPjxwYXRoIGQ9Ik0yMTUuMjU1LDIzMC4xMDhhNDMuMTg0LDQzLjE4NCwwLDEsMC00My4xODQtNDMuMTg0QTQzLjIzMyw0My4yMzMsMCwwLDAsMjE1LjI1NSwyMzAuMTA4Wm0wLTcwLjM2OGEyNy4xODQsMjcuMTg0LDAsMSwxLTI3LjE4NCwyNy4xODRBMjcuMjE1LDI3LjIxNSwwLDAsMSwyMTUuMjU1LDE1OS43NFoiLz48cGF0aCBkPSJNNDU0LDMzOEg0MTlWMzAzYTgsOCwwLDAsMC0xNiwwdjM1SDM2OWE4LDgsMCwwLDAsMCwxNmgzNHYzNGE4LDgsMCwwLDAsMTYsMFYzNTRoMzVhOCw4LDAsMCwwLDAtMTZaIi8+PHBhdGggZD0iTTQ3MiwyNzMuMTI5VjEyMS43MjRDNDcyLDk1LjI1Niw0NTAuMjA5LDc0LDQyMy43NDEsNzRINTQuNzUzQTQ3LjYwOCw0Ny42MDgsMCwwLDAsNywxMjEuNzI0VjM2Mi44MjlDNywzODkuMywyOC4yODYsNDExLDU0Ljc1Myw0MTFIMzQ1LjYzOWE5My42LDkzLjYsMCwwLDAsMTU5LjczNy02Ni4xNzZDNTA1LjM3NiwzMTYuMDg0LDQ5MiwyOTAuMjkzLDQ3MiwyNzMuMTI5Wk01NC43NTMsOTBINDIzLjc0MUM0NDEuMzg2LDkwLDQ1NiwxMDQuMDc5LDQ1NiwxMjEuNzI0VjI2Mi4zYTkzLjA4MSw5My4wODEsMCwwLDAtNDQuMTE5LTExLjAxNiw5NS4xLDk1LjEsMCwwLDAtMTAuNDYuNTgxTDMzNC40LDIwNC40MTFhOC4wMjEsOC4wMjEsMCwwLDAtMTAuMjQ5LjgyMkwyMzMuODI3LDI5NCwxMjguODUsMjQyLjg0YTcuNzY0LDcuNzY0LDAsMCwwLTcuNC4yNzFMMjMsMzAwLjI4NFYxMjEuNzI0QTMxLjU5MSwzMS41OTEsMCwwLDEsNTQuNzUzLDkwWk0yMywzNjIuODI5VjMxOC43ODFMMTI1Ljc5MSwyNTkuMDlsOTUuOTgzLDQ2Ljg5NEwxMzEuMjMxLDM5NUg1NC43NTNBMzEuOTczLDMxLjk3MywwLDAsMSwyMywzNjIuODI5Wk0xNTQuMDU3LDM5NSwzMzAuNTc4LDIyMS40Mmw0OS44ODgsMzUuM2E5My43MzcsOTMuNzM3LDAsMCwwLTYyLjIxLDg4LjE3YzAsMTguNCw1LjM0NCwzNS4xMTIsMTQuNTU3LDUwLjExMlptMjU3LjY5NCwyNy4yNzZhNzcuNSw3Ny41LDAsMSwxLDc3LjUtNzcuNDk1QTc3LjU4Myw3Ny41ODMsMCwwLDEsNDExLjc1MSw0MjIuMjc2WiIvPjwvc3ZnPgo=)
	}
	.addImage:hover, .addRepImg:hover, .addRepVideo:hover{
		cursor: pointer;
		background-color:rgba(244, 244, 244, 0.945);
	}

	.addRepImg{
		width: 600px;
		height: 400px;
		background-size: 50px;
		background-repeat: no-repeat;
		background-position: center center;
		background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgd2lkdGg9IjUxMiIgaGVpZ2h0PSI1MTIiPjx0aXRsZT5BZGQgUGhvdG88L3RpdGxlPjxwYXRoIGQ9Ik0yMTUuMjU1LDIzMC4xMDhhNDMuMTg0LDQzLjE4NCwwLDEsMC00My4xODQtNDMuMTg0QTQzLjIzMyw0My4yMzMsMCwwLDAsMjE1LjI1NSwyMzAuMTA4Wm0wLTcwLjM2OGEyNy4xODQsMjcuMTg0LDAsMSwxLTI3LjE4NCwyNy4xODRBMjcuMjE1LDI3LjIxNSwwLDAsMSwyMTUuMjU1LDE1OS43NFoiLz48cGF0aCBkPSJNNDU0LDMzOEg0MTlWMzAzYTgsOCwwLDAsMC0xNiwwdjM1SDM2OWE4LDgsMCwwLDAsMCwxNmgzNHYzNGE4LDgsMCwwLDAsMTYsMFYzNTRoMzVhOCw4LDAsMCwwLDAtMTZaIi8+PHBhdGggZD0iTTQ3MiwyNzMuMTI5VjEyMS43MjRDNDcyLDk1LjI1Niw0NTAuMjA5LDc0LDQyMy43NDEsNzRINTQuNzUzQTQ3LjYwOCw0Ny42MDgsMCwwLDAsNywxMjEuNzI0VjM2Mi44MjlDNywzODkuMywyOC4yODYsNDExLDU0Ljc1Myw0MTFIMzQ1LjYzOWE5My42LDkzLjYsMCwwLDAsMTU5LjczNy02Ni4xNzZDNTA1LjM3NiwzMTYuMDg0LDQ5MiwyOTAuMjkzLDQ3MiwyNzMuMTI5Wk01NC43NTMsOTBINDIzLjc0MUM0NDEuMzg2LDkwLDQ1NiwxMDQuMDc5LDQ1NiwxMjEuNzI0VjI2Mi4zYTkzLjA4MSw5My4wODEsMCwwLDAtNDQuMTE5LTExLjAxNiw5NS4xLDk1LjEsMCwwLDAtMTAuNDYuNTgxTDMzNC40LDIwNC40MTFhOC4wMjEsOC4wMjEsMCwwLDAtMTAuMjQ5LjgyMkwyMzMuODI3LDI5NCwxMjguODUsMjQyLjg0YTcuNzY0LDcuNzY0LDAsMCwwLTcuNC4yNzFMMjMsMzAwLjI4NFYxMjEuNzI0QTMxLjU5MSwzMS41OTEsMCwwLDEsNTQuNzUzLDkwWk0yMywzNjIuODI5VjMxOC43ODFMMTI1Ljc5MSwyNTkuMDlsOTUuOTgzLDQ2Ljg5NEwxMzEuMjMxLDM5NUg1NC43NTNBMzEuOTczLDMxLjk3MywwLDAsMSwyMywzNjIuODI5Wk0xNTQuMDU3LDM5NSwzMzAuNTc4LDIyMS40Mmw0OS44ODgsMzUuM2E5My43MzcsOTMuNzM3LDAsMCwwLTYyLjIxLDg4LjE3YzAsMTguNCw1LjM0NCwzNS4xMTIsMTQuNTU3LDUwLjExMlptMjU3LjY5NCwyNy4yNzZhNzcuNSw3Ny41LDAsMSwxLDc3LjUtNzcuNDk1QTc3LjU4Myw3Ny41ODMsMCwwLDEsNDExLjc1MSw0MjIuMjc2WiIvPjwvc3ZnPgo=)
	}

	.addRepVideo{
		width: 600px;
		height: 400px;
		background-size: 50px;
		background-repeat: no-repeat;
		background-position: 30% center;
		background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE3LjEuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDI5OCAyOTgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDI5OCAyOTg7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIGQ9Ik0yOTgsMzNjMC0xMy4yNTUtMTAuNzQ1LTI0LTI0LTI0SDI0QzEwLjc0NSw5LDAsMTkuNzQ1LDAsMzN2MjMyYzAsMTMuMjU1LDEwLjc0NSwyNCwyNCwyNGgyNTBjMTMuMjU1LDAsMjQtMTAuNzQ1LDI0LTI0VjMzDQoJeiBNOTEsMzloNDN2MzRIOTFWMzl6IE02MSwyNTlIMzB2LTM0aDMxVjI1OXogTTYxLDczSDMwVjM5aDMxVjczeiBNMTM0LDI1OUg5MXYtMzRoNDNWMjU5eiBNMTIzLDE3Ni43MDh2LTU1LjQxNw0KCWMwLTguMjUsNS44NjgtMTEuMzAyLDEyLjc3LTYuNzgzbDQwLjIzNywyNi4yNzJjNi45MDIsNC41MTksNi45NTgsMTEuOTE0LDAuMDU2LDE2LjQzNGwtNDAuMzIxLDI2LjI3Nw0KCUMxMjguODQsMTg4LjAxMSwxMjMsMTg0Ljk1OCwxMjMsMTc2LjcwOHogTTIwNywyNTloLTQzdi0zNGg0M1YyNTl6IE0yMDcsNzNoLTQzVjM5aDQzVjczeiBNMjY4LDI1OWgtMzF2LTM0aDMxVjI1OXogTTI2OCw3M2gtMzFWMzkNCgloMzFWNzN6Ii8+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==)
	}

	div{box-sizing: border-box;}
	.content{
		width: 850px;
		
	}
	.content>div{width:100%;}
	.guide-area{height:105px;}
	.thumbnail-area{height:270px;}
	.intro-area{height:440px;}
	
	/* 클래스 제목*/
	.thumbnail-area>div{float:left; height: 100%;}
	.thumbnail-area>div:first-child{width: 270px;}
	.thumbnail-area>div:last-child{width: 580px;}

	#classThumbnail{
		width:220px;
		height:160px;
		border: 1px solid lightgray;
	}
	#classTitle{
		width: 420px;
		height: 40px;
	}

	.note1{
		margin-top: 10px;
		width: 400px;
		height: 180px;
		margin-left: 5px;
	}
	.note1>img{
		width: 110px;
		height: 80px;
	}
	.note1 img:nth-child(4){
		margin: 0px 20px 0px 20px;
	}

	/*클래스 대표이미지or 소개동영상*/
	.intro-area{margin-bottom: 20px;}
	.intro-area>div{float: left; height: 100%;}
	.intro-area>div:first-child{width: 610px;}
	.intro-area>div:last-child{width: 230px;}

	#file-area{
		width:600px;
		height:400px;
		border: 1px solid lightgray;
	}
	#file-area>div{
		display: none;
	}
	.intro-file{
		width: 600px;
		height: 400px;
	}
	#video-info{
		font-size: 18px;
		padding:185px 0px 0px 230px;
		font-weight: 700;
	}
	.note2{
		width: 225px;
		height: 250px;
		margin-top: 35px;
	}

	.inputFile{
		display: none;
	}
</style>
</head>
<body>
	<jsp:include page="common/lectureEnrollForm.jsp"/>
	<div class="content">

		<div class="guide-area">
			<label class="guide">클래스의 컨셉이 잘 드러난<br>제목과 이미지를 보여주세요</label>
			<label class="note">감성적이면서도 클래스를 잘 표현하는 제목과 이미지를 등록해주세요.</label>
		</div>
		<form id="inputForm" action="updateLecture.te" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="classNo" value="${ l.classNo }">
            <input type="hidden" name="currentPage" value="${currentPage}">
			<div class="thumbnail-area">
				<div>
					<label class="subGuide">클래스 썸네일 이미지</label>
					<div class="addImage">
						<c:choose>
							<c:when test="${ l.thumbnail ne null}">
								<img id="classThumbnail" src="${ l.thumbnail }">
							</c:when>
							<c:otherwise>
								<img id="classThumbnail">
							</c:otherwise>
						</c:choose>						
					</div>
					<input id="thumbnail" type="file" name="upfile" class="inputFile" onchange="loadThumbnail(this);">
					<input type="hidden" name="thumbnail" value="${l.thumbnail}">
				</div>
				<div>
					<label for="classTitle" class="subGuide">클래스 제목</label>
					<input id="classTitle" type="text" name="classTitle" placeholder="컨셉이 잘 드러나는 클래스의 제목을 지어주세요." class="form-control" value="${ l.classTitle }">
					<div class="note-area note1">
						<span class="qus-title"> 썸네일 이미지가 어디에 사용되나요?</span>
						<p class="qus-answer">
							썸네일 이미지는 아래와 같이 메인, 카테고리 검색페이지 등등에서<br>
							보이는 이미지에요.
						</p>
						<img src="resources/uploadFiles/intro_upfiles/6c1.PNG">
						<img src="resources/uploadFiles/intro_upfiles/7c1.PNG">
						<img src="resources/uploadFiles/intro_upfiles/12c1.PNG">
					</div>
				</div>
			</div>
			<div class="intro-area">
				<div>
					<label class="subGuide">클래스 대표 이미지 or 소개 동영상</label>
					<div id="file-area" class="addRepImg">
						<div id="video-info" class="intro-file">동영상 등록</div>
						<img id="intro-img" class="intro-file" onerror="this.src='resources/uploadFiles/lec_upfiles/writing.png'">
					</div>
					<input id="introFile" type="file" name="upfile" class="inputFile" onchange="loadIntroFile(this);">
					<input type="hidden" name="introFile" value="${l.introFile}">
				</div>
				<div>
					<div>
						<div class="note-area note2">
							<span class="qus-title">클래스의 소개를 담당할<br>이미지나 동영상을 선택해주세요</span>
							<p class="qus-answer">
								<button type="button" id="type-image" class="btn btn-secondary btn-sm">Image</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" id="type-video" class="btn btn-secondary btn-sm">Video</button> 
								<br><br>
								학생들이 볼 수 있는 페이지 가장 상단 <br>
								좌측에 보여지는 사진이므로 클래스를 <br>
								단번에 이해 할 수 있는 사진이나 동영<br>
								상을 올려주세요!<br>
								<br>
								※동영상을 추천 드립니다.
							</p>
						</div>
					</div>
				</div>
			</div>
		</form>
		<script>
			$(function(){
				// 1. Image | Video 버튼 css
				var $video = $("#type-video");
				var $image = $("#type-image");
				
				$image.css('backgroundColor', 'red');
				
				$video.click(function(){
					$image.css('backgroundColor', 'gray');
					$(this).css('backgroundColor', 'red');
					$('#file-area').children('img').hide();
					$('#file-area').children('div').show();
					$('#file-area').removeClass('addRepImg').addClass('addRepVideo');
				});
				
				$image.click(function(){
					$video.css('backgroundColor', 'gray');
					$(this).css('backgroundColor', 'red');
					$('#file-area').children('div').hide();
					$('#file-area').children('img').show();
					$('#file-area').removeClass('addRepVideo').addClass('addRepImg');
				});

				// 박스 클릭 시 input 파일 클릭 동작 수행
				$('.addImage').click(function(){
					$('#thumbnail').click();
				})
				$('.addRepImg, .addRepVideo').click(function(){
					$('#introFile').click();
				})

				// 2. DB 데이터 조회 시 이미지 | 비디오 판별 '${l.introFile}'
				var fileName = '${l.introFile}';
				var extension = '${l.introFile}'.split('.').reverse()[0].toLowerCase();
				var checkExtension = ['bmp', 'jpeg', 'jpg', 'gif', 'png', 'tiff', 'webp'];
				var checkPoint = 0;

				for(var i in checkExtension){
					if(extension == checkExtension[i]){
						++checkPoint;
					}
				}
				
				if(checkPoint > 0 || fileName == ""){ // 이미지 확장자 가진 파일

					if(fileName == ""){
						$image.trigger('click');
					}else{
						$image.trigger('click');
						$('#file-area>img').attr('src', fileName);
					}

				}else{ // 이미지 확장자 x 파일인 경우

					$video.trigger('click');
					$('#video-info').text('동영상', fileName.split('/').reverse()[0].toLowerCase());
				}

				// 3. 저장하기 조건검사
				var checkThumbnail = $('#classThumbnail').attr('src');
				var classTitleLength = $('#classTitle').val().length;
				var checkIntroImage = $('#intro-img').attr('src');
				var checkIntroVideo = $('#video-info').text().length;

				// 처음 강의 수정하기 조건검사
				if(!isEmpty(checkThumbnail) && classTitleLength > 5 && (!isEmpty(checkIntroImage) || checkIntroVideo > 6)){
					onLoadCheckSuccess();
				}
				
				// 4. 입력 후 저장하기 기준 통과 시 저장하기 버튼 활성화
				// 4_1. 썸네일, 인트로 파일 onchange 시 조건검사실시
				$(document).on('change', '#introFile, #thumbnail', function(){
					enableSubmit();
				});
				
				// 4_2. 클래스 제목 키보드 입력시 조건검사실시
				$('input[name=classTitle]').keyup(function(){
					enableSubmit();
				});

				
			})
			// 4_(1,2) 조건검사
			function enableSubmit(){
				// 클래스 제목 길이
				classTitleLength = $('#classTitle').val().length;
				// 클래스 썸네일 이미지 유무
				thumbnailFileLength = document.getElementById('thumbnail').files.length;
				// intro 파일 유무
				introFileFileLength =  document.getElementById('introFile').files.length;
				
				if((thumbnailFileLength == 1 || $('#classThumbnail').attr('src') != 'undefined') 
					&& classTitleLength > 5 
					&& (introFileFileLength == 1 || $('#intro-img').attr('src') != 'undefined')){
					checkSuccess();
				}else{
					checkFail();
				}
			}

			// thumbnail 이미지 업로드 미리보기
			function loadThumbnail(inputFile){

				if(inputFile.files.length == 1){    //선택한 파일이 존재하는 경우
					var reader = new FileReader();
					reader.readAsDataURL(inputFile.files[0]);
					reader.onload = function(e){$(inputFile).siblings('div').children('img').attr("src", e.target.result);}
				}else{
					$(inputFile).siblings('.addImage').children('img').attr("src", '${l.thumbnail}');
				}

				enableSubmit();
			}
			
			// video or img 미리보기
			function loadIntroFile(inputFile){
				
				var status = document.getElementById('file-area').className;
				
				if(inputFile.files.length == 1){    //선택한 파일이 존재

					if(status == 'addRepVideo'){ 
						// 이미지에 미리보기 지우기
						$('.intro-file').removeAttr('src');
						// 동영상 등록
						$(inputFile).siblings('div').children('div').text('동영상 : ' + inputFile.files[0].name);
					}else{
						var reader = new FileReader();
						reader.readAsDataURL(inputFile.files[0]);
						reader.onload = function(e){$(inputFile).siblings('div').children('img').attr("src", e.target.result);}
						$(inputFile).siblings('div').children('div').text("동영상 등록");
					} 

				}else{ // 선택한 파일이 없는 경우
					
					if(status == 'addRepVideo'){ // 비디오
						$(inputFile).attr("src", null);
						$(inputFile).siblings('div').children('img').attr("src", '${l.introFile}');
						$(inputFile).siblings('div').children('div').text("동영상 등록");
					}else{ // 이미지
						$(inputFile).attr("src", null);
						$('.intro-file').removeAttr("src");
						$('#intro-img').attr('src', '${l.introFile}');
					}

				}

				enableSubmit();
			}
			</script>
	</div>
	<jsp:include page="common/lectureEnrollFormFooter.jsp"/>
</div>
</body>
</html>
