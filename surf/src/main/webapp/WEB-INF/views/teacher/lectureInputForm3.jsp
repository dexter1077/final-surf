<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록하기_커리큘럼</title>
<style>
	.video-img {
		overflow:hidden;
		white-space: nowrap;
		/*위는 텍스트 ... 해주는 과정*/
		display: inline-block;
		width: 50px;
		margin-left: 20px;
		vertical-align: middle;
		padding-left: 20px;
		font-size: 12px;
		font-weight: 700;
		height: 20px;
		background-repeat: no-repeat;
		background-position: 0% 50%;
		background-size: 20px;
		background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE3LjEuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDI5OCAyOTgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDI5OCAyOTg7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIGQ9Ik0yOTgsMzNjMC0xMy4yNTUtMTAuNzQ1LTI0LTI0LTI0SDI0QzEwLjc0NSw5LDAsMTkuNzQ1LDAsMzN2MjMyYzAsMTMuMjU1LDEwLjc0NSwyNCwyNCwyNGgyNTBjMTMuMjU1LDAsMjQtMTAuNzQ1LDI0LTI0VjMzDQoJeiBNOTEsMzloNDN2MzRIOTFWMzl6IE02MSwyNTlIMzB2LTM0aDMxVjI1OXogTTYxLDczSDMwVjM5aDMxVjczeiBNMTM0LDI1OUg5MXYtMzRoNDNWMjU5eiBNMTIzLDE3Ni43MDh2LTU1LjQxNw0KCWMwLTguMjUsNS44NjgtMTEuMzAyLDEyLjc3LTYuNzgzbDQwLjIzNywyNi4yNzJjNi45MDIsNC41MTksNi45NTgsMTEuOTE0LDAuMDU2LDE2LjQzNGwtNDAuMzIxLDI2LjI3Nw0KCUMxMjguODQsMTg4LjAxMSwxMjMsMTg0Ljk1OCwxMjMsMTc2LjcwOHogTTIwNywyNTloLTQzdi0zNGg0M1YyNTl6IE0yMDcsNzNoLTQzVjM5aDQzVjczeiBNMjY4LDI1OWgtMzF2LTM0aDMxVjI1OXogTTI2OCw3M2gtMzFWMzkNCgloMzFWNzN6Ii8+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==)
	}
	.minus-img {
		display: inline-block;
		width: 25px;
		height: 17px;
		background-repeat: no-repeat;
		background-size: 25px;
		background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRjNGNjI7IiBkPSJNNDg4LjcyNywxODYuMTgySDI1NkgyMy4yNzNDMTAuNDIsMTg2LjE4MiwwLDE5Ni42LDAsMjA5LjQ1NXY5My4wOTENCgljMCwxMi44NTMsMTAuNDIsMjMuMjczLDIzLjI3MywyMy4yNzNIMjU2aDIzMi43MjdjMTIuODUzLDAsMjMuMjczLTEwLjQyLDIzLjI3My0yMy4yNzN2LTkzLjA5MQ0KCUM1MTIsMTk2LjYsNTAxLjU4LDE4Ni4xODIsNDg4LjcyNywxODYuMTgyeiIvPg0KPHBhdGggc3R5bGU9ImZpbGw6I0ZGMEMzODsiIGQ9Ik0yMy4yNzMsMTg2LjE4MkMxMC40MiwxODYuMTgyLDAsMTk2LjYsMCwyMDkuNDU1djkzLjA5MWMwLDEyLjg1MywxMC40MiwyMy4yNzMsMjMuMjczLDIzLjI3M0gyNTYNCglWMTg2LjE4MkgyMy4yNzN6Ii8+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==)
	}
	.plus-img{
		display: inline-block;
		width: 145px;
		height: 35px;
		background-repeat: no-repeat;
		background-size: 25px;
		background-image: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMnB0IiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgd2lkdGg9IjUxMnB0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Im0yNTYgMGMtMTQxLjE2NDA2MiAwLTI1NiAxMTQuODM1OTM4LTI1NiAyNTZzMTE0LjgzNTkzOCAyNTYgMjU2IDI1NiAyNTYtMTE0LjgzNTkzOCAyNTYtMjU2LTExNC44MzU5MzgtMjU2LTI1Ni0yNTZ6bTAgMCIgZmlsbD0iIzIxOTZmMyIvPjxwYXRoIGQ9Im0zNjggMjc3LjMzMjAzMWgtOTAuNjY3OTY5djkwLjY2Nzk2OWMwIDExLjc3NzM0NC05LjU1NDY4NyAyMS4zMzIwMzEtMjEuMzMyMDMxIDIxLjMzMjAzMXMtMjEuMzMyMDMxLTkuNTU0Njg3LTIxLjMzMjAzMS0yMS4zMzIwMzF2LTkwLjY2Nzk2OWgtOTAuNjY3OTY5Yy0xMS43NzczNDQgMC0yMS4zMzIwMzEtOS41NTQ2ODctMjEuMzMyMDMxLTIxLjMzMjAzMXM5LjU1NDY4Ny0yMS4zMzIwMzEgMjEuMzMyMDMxLTIxLjMzMjAzMWg5MC42Njc5Njl2LTkwLjY2Nzk2OWMwLTExLjc3NzM0NCA5LjU1NDY4Ny0yMS4zMzIwMzEgMjEuMzMyMDMxLTIxLjMzMjAzMXMyMS4zMzIwMzEgOS41NTQ2ODcgMjEuMzMyMDMxIDIxLjMzMjAzMXY5MC42Njc5NjloOTAuNjY3OTY5YzExLjc3NzM0NCAwIDIxLjMzMjAzMSA5LjU1NDY4NyAyMS4zMzIwMzEgMjEuMzMyMDMxcy05LjU1NDY4NyAyMS4zMzIwMzEtMjEuMzMyMDMxIDIxLjMzMjAzMXptMCAwIiBmaWxsPSIjZmFmYWZhIi8+PC9zdmc+)
	}
	.close-img {
		width: 25px;
		height: 25px;
		margin-left: 485px;
		background-repeat: no-repeat;
		background-size: 25px;
		background-image: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM2NXB0IiB2aWV3Qm94PSIwIDAgMzY1LjcxNzMzIDM2NSIgd2lkdGg9IjM2NXB0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxnIGZpbGw9IiNmNDQzMzYiPjxwYXRoIGQ9Im0zNTYuMzM5ODQ0IDI5Ni4zNDc2NTYtMjg2LjYxMzI4Mi0yODYuNjEzMjgxYy0xMi41LTEyLjUtMzIuNzY1NjI0LTEyLjUtNDUuMjQ2MDkzIDBsLTE1LjEwNTQ2OSAxNS4wODIwMzFjLTEyLjUgMTIuNTAzOTA2LTEyLjUgMzIuNzY5NTMyIDAgNDUuMjVsMjg2LjYxMzI4MSAyODYuNjEzMjgyYzEyLjUwMzkwNyAxMi41IDMyLjc2OTUzMSAxMi41IDQ1LjI1IDBsMTUuMDgyMDMxLTE1LjA4MjAzMmMxMi41MjM0MzgtMTIuNDgwNDY4IDEyLjUyMzQzOC0zMi43NS4wMTk1MzItNDUuMjV6bTAgMCIvPjxwYXRoIGQ9Im0yOTUuOTg4MjgxIDkuNzM0Mzc1LTI4Ni42MTMyODEgMjg2LjYxMzI4MWMtMTIuNSAxMi41LTEyLjUgMzIuNzY5NTMyIDAgNDUuMjVsMTUuMDgyMDMxIDE1LjA4MjAzMmMxMi41MDM5MDcgMTIuNSAzMi43Njk1MzEgMTIuNSA0NS4yNSAwbDI4Ni42MzI4MTMtMjg2LjU5Mzc1YzEyLjUwMzkwNi0xMi41IDEyLjUwMzkwNi0zMi43NjU2MjYgMC00NS4yNDYwOTRsLTE1LjA4MjAzMi0xNS4wODIwMzJjLTEyLjUtMTIuNTIzNDM3LTMyLjc2NTYyNC0xMi41MjM0MzctNDUuMjY5NTMxLS4wMjM0Mzd6bTAgMCIvPjwvZz48L3N2Zz4=)
	}
	.close-img:hover{
		cursor: pointer;
		opacity: 0.9;
	}

	.content>form>div:first-child{margin-bottom:20px;}

	.curriculum{
		width: 630px;
		border: 1px solid lightgray;
		border-radius: 5px;
		padding: 30px 0px 30px 40px;
		margin-bottom: 20px;
	}

	/*가이드 노트*/
	.note1{
		transform: translate(1280px, 200px);
		position: absolute;
		font-family: 'Nanum Gothic', sans-serif;
		z-index: -1;
		width: 235px;
		height:125px;
	}
	/*챕터 제목*/
	.chap-head{
		font-size: 22px;
		font-weight: 700;
	}

	/*소제목*/
	.subTitle{
		display: inline-block;
		font-size:16px;
        font-weight: 700;
		margin-bottom: 20px;
		width:40px;
	}

	/*제목 추가 버튼*/
	.insertTitle-btn{
		display: block;
		width: 75px;
		margin-left:180px;
		margin-top: 20px;
		font-weight: 700;
		font-size: 14px;
		color: gray;
	}
	
	/*챕터 추가 버튼*/
	#insertChapter-btn{
		display: block;
		margin-left:230px;
		margin-bottom: 20px;
		font-weight: 700;
		font-size: 24px;
		color: rgb(32, 155, 212);
		line-height: 28px;
	}
	
	.insertTitle-btn:hover, .minus-img:hover, #insertChapter-btn, .video-img{
		opacity: 0.8;
		cursor: pointer;
	}

	input[type=file]{
		display: none;
	}
	.clone-box{display: none;}
</style>
</head>
<body>
	<div class="note-area note1">
		<span class="qus-title"> 강의 시작을 어떻게 해야 할까요?</span>
		<p class="qus-answer">
			&nbsp;수강생의 입장에서 어떤 강의를 듣게 되고<br>
			어떤게 궁금하지 유심히 생각해보세요.<br>
			&nbsp;클래스 소개, 강사님 소개, 준비물 소개를<br>
			먼저 구성하면 어떨까요?
		</p>
	</div>
	<jsp:include page="common/lectureEnrollForm.jsp"/>
	<div class="curriculum clone-box">
		<div class="curriculum-box">
			<label class="chap-head"></label><div class="close-img"></div>
			<input type="hidden" name="chapOrder" value="1">
			<input type="hidden" name="classNo" value="${ l.classNo }">
			<input name="chapName" type="text" class="form-control chap" style="width:400px; height:40px;" placeholder="챕터명을 입력해주세요">
			<br>
			<div class="subTitle-box">
				<input type="hidden" name="videoNo" value="0">
				<input type="hidden" name="classNo" value="${ l.classNo }">
				<input type="hidden" name="chapOrder" value="1">
				<input type="hidden" name="videoOrder" value="1">
				<div class="minus-img"></div>
				<label class="subTitle">1.1</label>
				<input type="text" name="subTitle" class="form-control" style="width:350px; height:40px; margin-bottom: 10px; display: inline;" placeholder="소제목을 입력해주세요.">
				<input type="file" name="upfile" onchange="loadOriginName(this);">
				<input type="hidden" name="originName">
				<input type="hidden" name="changeName">
				<div class="video-img">추가</div>
			</div>
		</div>
		<span class="insertTitle-btn">+ 제목 추가</span>
	</div>
	
	<div class="content">
		<form id="inputForm" action="updateCurriculum.te" method="post" enctype="multipart/form-data">
			<input type="hidden" name="classNo" value="${ l.classNo }">
			<input type="hidden" name="currentPage" value="${currentPage}">
			<input type="hidden" name="beforeCno" value="${fn:length(chList)}">
			<div>
				<label class="guide">강의 커리큘럼</label>
			</div>
			<br>
			<div id="input-box">
				<div class="curriculum">
					<div class="curriculum-box chap1">
						<label class="chap-head">챕터1</label><div class="close-img"></div>
						<input type="hidden" name="chList[0].chapOrder" value="1">
						<input type="hidden" name="chList[0].classNo" value="${ l.classNo }">
						<input id="chapName1" name="chList[0].chapName" type="text" class="form-control chap" style="width:400px; height:40px;" placeholder="챕터명을 입력해주세요" value="${chList[0].chapName}">
						<br>
						<c:if test="${fn:length(chList) eq 0}">
						<div class="subTitle-box">
							<input type="hidden" name="cvList[0].videoNo" value="0">
							<input type="hidden" name="cvList[0].classNo" value="${ l.classNo }"> 안해
							<input type="hidden" name="cvList[0].chapOrder" value="1">
							<input type="hidden" name="cvList[0].videoOrder" value="1">
							<div class="minus-img"></div>
							<label class="subTitle">1.1</label>
							<input type="text" name="cvList[0].subTitle" class="form-control" style="width:350px; height:40px; margin-bottom: 10px; display: inline;" placeholder="소제목을 입력해주세요." val="" id="subTitle1">
							<input type="file" name="cvList[0].upfile" onchange="loadOriginName(this);">
							<input type="hidden" name="cvList[0].originName">
							<input type="hidden" name="cvList[0].changeName">
							<div class="video-img" style="background-size: 20px; padding-left: 20px; width: 50px; text-overflow: ellipsis;">추가</div>
						</div>
						</c:if>
					</div>
					<span class="insertTitle-btn">+ 제목 추가</span>
				</div>
				<c:forEach var="c" begin="2" end="${ fn:length(chList) }">
				<div class="curriculum">
					<div class="curriculum-box chap${c}">
						<label class="chap-head">챕터${c}</label><div class="close-img"></div>
						<input type="hidden" name="chList[${c-1}].chapOrder" value="${ chList[c-1].chapOrder }">
						<input type="hidden" name="chList[${c-1}].classNo" value="${ chList[0].classNo }">
						<input id="chapName${c}" name="chList[${c-1}].chapName" type="text" class="form-control chap" style="width:400px; height:40px;" placeholder="챕터명을 입력해주세요" value="${ chList[c-1].chapName }">
						<br>
					</div>
					<span class="insertTitle-btn">+ 제목 추가</span>
				</div>
				</c:forEach>
			</div>
			<div>
				<div id="insertChapter-btn" class="plus-img">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;챕터</div>
			</div>
		</form>
	</div>
	<script>
		// 1. +- 버튼 영역
		$(function(){
			
			var info = [[1, 1]];
			var cno = 1;
			var vno = 1;

			var classVideo;
			
			// 1. -제목 제거버튼
			$(document).on('click', '.minus-img', function(){
				var subTitleNo = $(this).siblings('.subTitle').text().substr(2, 1);
				var chapNo = $(this).siblings('.subTitle').text().substr(0, 1) - 1;
				var target = $(this).parents('.curriculum').children('.curriculum-box').children('.subTitle-box');
				
				if(info[chapNo][1] == 1){
					alertify.alert('한 챕터에는 최소 한 강의영상이 필요합니다.')
				}else{
					$(this).parent('.subTitle-box').remove();
					info[chapNo][1] -= 1;
					--vno;
					var deleteChangeName = $(this).parent('.subTitle-box').children('input[type=hidden]').eq(5).val();

					if(deleteChangeName != ""){
						$('#inputForm').prepend('<input type="hidden" name="deleteFileName" value="' + deleteChangeName + '">');
					}

					var sum = 1;
					for(var i=0; i<cno; i++){
						var $chap = $('#input-box').children('div').eq(i).find('.subTitle-box');
						//var $chap = $('.chap' + (i+1)).children('.subTitle-box');
						for(var j=sum; j<=sum+info[i][1]; j++){
							$chap.eq(j-sum).children('input[type=hidden]').eq(0).attr('name', 'cvList[' + (j-1) + '].videoNo');
							$chap.eq(j-sum).children('input[type=hidden]').eq(1).attr('name', 'cvList[' + (j-1) + '].classNo');
							$chap.eq(j-sum).children('input[type=hidden]').eq(2).attr('name', 'cvList[' + (j-1) + '].chapOrder');
							$chap.eq(j-sum).children('input[type=hidden]').eq(3).attr('name', 'cvList[' + (j-1) + '].videoOrder').val(j-sum+1);
							$chap.eq(j-sum).children('input[type=hidden]').eq(4).attr('name', 'cvList[' + (j-1) + '].originName');
							$chap.eq(j-sum).children('input[type=hidden]').eq(5).attr('name', 'cvList[' + (j-1) + '].changeName');
							$chap.eq(j-sum).children('input[type=file]').attr('name', 'cvList[' + (j-1) + '].upfile');
							$chap.eq(j-sum).children('.subTitle').text((i+1) + '.' + (j-sum+1));
							$chap.eq(j-sum).children('input[type=text]').attr('id', 'subTitle' + j).attr('name', 'cvList[' + (j-1) + '].subTitle');
						}
						sum += info[i][1];
					}
				}
				
				afterCheck(cno, vno);
			})
			
			// 2. + 제목추가 버튼(메소드)
			$('.insertTitle-btn').on('click', function(){
				
				// 해당 버튼 챕터값 가져오기
				var chapNo = $(this).siblings(".curriculum-box").children('.chap-head').text().substr(2, 1) - 1;
				
				if(info[chapNo][1] < 9){
					
					info[chapNo][1] += 1;
					++vno;
					var $clone = $(this).siblings(".curriculum-box").children(".subTitle-box").last().clone(true);
					$clone.children('input[type=hidden]').eq(0).val(0);
					$clone.children('input[type=hidden]').eq(4).val("");
					$clone.children('input[type=hidden]').eq(5).val("");

					var sum = 1;
					
					// 복사할때 file 제거하고 추가버튼으로 되돌리고 name값 변경
					//$clone.children('input[type=file]').val("");
					$clone.children('input[type=file]').siblings('.video-img').css('background-size', '20px').text('추가').css('padding-left', 20).css('width', '50px');
					// input text 값 제거하고 name 값 변경
					$clone.children('input[type=text]').val("").attr('name', 'cvList[' + (vno-1) + '].subTitle').attr('id', 'subTitle' + vno);
					
					$(this).siblings(".curriculum-box").append($clone);
					
					for(var i=0; i<cno; i++){
						var $chap = $('#input-box').children('div').eq(i).find('.subTitle-box');
						//var $chap = $('.chap' + (i+1)).children('.subTitle-box');
						for(var j=sum; j<=sum+info[i][1]; j++){

							$chap.eq(j-sum).children('input[type=hidden]').eq(0).attr('name', 'cvList[' + (j-1) + '].videoNo');
							$chap.eq(j-sum).children('input[type=hidden]').eq(1).attr('name', 'cvList[' + (j-1) + '].classNo');
							$chap.eq(j-sum).children('input[type=hidden]').eq(2).attr('name', 'cvList[' + (j-1) + '].chapOrder');
							$chap.eq(j-sum).children('input[type=hidden]').eq(3).attr('name', 'cvList[' + (j-1) + '].videoOrder').val(j-sum+1);
							$chap.eq(j-sum).children('input[type=hidden]').eq(4).attr('name', 'cvList[' + (j-1) + '].originName');
							$chap.eq(j-sum).children('input[type=hidden]').eq(5).attr('name', 'cvList[' + (j-1) + '].changeName');
							$chap.eq(j-sum).children('.subTitle').text((i+1) + '.' + (j-sum+1));
							$chap.eq(j-sum).children('input[type=text]').attr('id', 'subTitle' + j).attr('name', 'cvList[' + (j-1) + '].subTitle');
							$chap.eq(j-sum).children('input[type=file]').attr('name', 'cvList[' + (j-1) + '].upfile');
						}
						sum += info[i][1];
					}
					
				}
				afterCheck(cno, vno);
				
			})

			// 3. +챕터추가 버튼
			$('#insertChapter-btn').on('click', function(){
				
				// info 배열 추가
				++cno;
				++vno;
				info.push([cno, 1]);
				
				var $clone = $('.clone-box').clone(true);
				$clone.css('display', 'block').removeClass('clone-box');
				$clone.find('.chap-head').text('챕터' + cno);
				$clone.find('.curriculum-box').addClass('chap' + cno);
				
				$('#input-box').append($clone);
				
				$clone.children('.curriculum-box').children('input[type=hidden]').eq(0).attr('name', 'chList[' + (cno-1) + '].chapOrder').val(cno);
				$clone.children('.curriculum-box').children('input[type=hidden]').eq(1).attr('name', 'chList[' + (cno-1) + '].classNo').val(${l.classNo});
				$clone.children('.curriculum-box').children('input[type=text]').eq(0).attr('name', 'chList[' + (cno-1) + '].chapName').attr('id', 'chapName' + cno);
				// 복사할때 file 제거하고 추가버튼으로 되돌리고 name값 변경
				$clone.find('input[type=file]').attr('name', 'cvList[' + (vno-1) + '].upfile');
				$clone.find('input[type=file]').siblings('.video-img').css('background-size', '20px').text('추가').css('padding-left', 20).css('width', '50px');
				// input text 값 제거하고 name 값 변경
				$clone.find('input[type=text]').last().attr('name', 'cvList[' + (vno-1) + '].subTitle').attr('id', 'subTitle' + vno);
				// input hidden 5개 name 값 변경
				$clone.find(".subTitle-box").children('input[type=hidden]').eq(0).attr('name', 'cvList[' + (vno-1) + '].videoNo').val(0);
				$clone.find(".subTitle-box").children('input[type=hidden]').eq(1).attr('name', 'cvList[' + (vno-1) + '].classNo').val(${l.classNo});
				$clone.find(".subTitle-box").children('input[type=hidden]').eq(2).attr('name', 'cvList[' + (vno-1) + '].chapOrder').val(info[cno-1][0]);
				$clone.find(".subTitle-box").children('input[type=hidden]').eq(3).attr('name', 'cvList[' + (vno-1) + '].videoOrder').val(info[cno-1][1]);
				$clone.find(".subTitle-box").children('input[type=hidden]').eq(4).attr('name', 'cvList[' + (vno-1) + '].originName');
				$clone.find(".subTitle-box").children('input[type=hidden]').eq(5).attr('name', 'cvList[' + (vno-1) + '].changeName');

				// subTitle 숫자 변경 
				$clone.find('.subTitle').text(info[cno-1][0] + '.' + info[cno-1][1]);

				var sum = 1;
				for(var i=0; i<cno; i++){
					//var $chap = $('.chap' + (i+1)).children('.subTitle-box');

					$('#input-box').children('div').eq(i).find('.chap-head').text('챕터' + (i+1));
					$('#input-box').children('div').eq(i).find('input[type=hidden]').eq(0).attr('name', 'chList[' + i + '].chapOrder').val(i + 1);
					$('#input-box').children('div').eq(i).find('input[type=hidden]').eq(1).attr('name', 'chList[' + i + '].classNo');
					$('#input-box').children('div').eq(i).find('input[type=text]').eq(0).attr('name', 'chList[' + i + '].chapName').removeAttr('id').attr('id', 'chapName' + (i + 1));

					var $chap = $('#input-box').children('div').eq(i).find('.subTitle-box');

					for(var j=sum; j<=sum+info[i][1]; j++){
						$chap.eq(j-sum).children('input[type=hidden]').eq(0).attr('name', 'cvList[' + (j-1) + '].videoNo');
						$chap.eq(j-sum).children('input[type=hidden]').eq(1).attr('name', 'cvList[' + (j-1) + '].classNo');
						$chap.eq(j-sum).children('input[type=hidden]').eq(2).attr('name', 'cvList[' + (j-1) + '].chapOrder').val(i + 1);
						$chap.eq(j-sum).children('input[type=hidden]').eq(3).attr('name', 'cvList[' + (j-1) + '].videoOrder').val(j-sum+1);
						$chap.eq(j-sum).children('input[type=hidden]').eq(4).attr('name', 'cvList[' + (j-1) + '].originName');
						$chap.eq(j-sum).children('input[type=hidden]').eq(5).attr('name', 'cvList[' + (j-1) + '].changeName');
						$chap.eq(j-sum).children('input[type=file]').attr('name', 'cvList[' + (j-1) + '].upfile');
						$chap.eq(j-sum).children('.subTitle').text((i+1) + '.' + (j-sum+1));
						$chap.eq(j-sum).children('input[type=text]').attr('id', 'subTitle' + j).attr('name', 'cvList[' + (j-1) + '].subTitle');
					}
					sum += info[i][1];
				}

				afterCheck(cno, vno);
			})
			
			// 4. 챕터 제거 버튼
			$('.close-img').click(function(){

				var thisCno = $(this).siblings('input[type=hidden]').eq(0).val();

				// 챕터 지우기
				$('#inputForm').prepend('<input type="hidden" name="deleteCno" value="' + $(this).siblings('input[type=hidden]').eq(0).val() + '">');

				// 제거 할 파일명 받아오기
				for(var i=0; i<info[thisCno-1][1]; i++){

					// 파일명 받아오기
					var deleteChangeName = $(this).siblings('.subTitle-box').eq(i).children('input[type=hidden]').eq(5).val();

					// 파일명 form 안에 넣기
					$('#inputForm').prepend('<input type="hidden" name="deleteFileName" value="' + deleteChangeName + '">');

				}

				vno = vno - info[(thisCno-1)][1];
				info.splice((thisCno-1), 1);
				for(var i=0; i<info.length; i++){
					info[i][0] = (i+1);
				}
				
				--cno;
				// 제거 파일명 가져오기(changeName)
				

				// 해당 챕터 제거
				$(this).parents('.curriculum').remove();
				
				// 챕터 소제목 정렬
				var sum = 1;
				for(var i=0; i<cno; i++){
					//var $chap = $('.chap' + (i+1)).children('.subTitle-box');

					$('#input-box').children('div').eq(i).find('.chap-head').text('챕터' + (i+1));
					$('#input-box').children('div').eq(i).find('input[type=hidden]').eq(0).attr('name', 'chList[' + i + '].chapOrder').val(i + 1);
					$('#input-box').children('div').eq(i).find('input[type=hidden]').eq(1).attr('name', 'chList[' + i + '].classNo');
					$('#input-box').children('div').eq(i).find('input[type=text]').eq(0).attr('name', 'chList[' + i + '].chapName').removeAttr('id').attr('id', 'chapName' + (i + 1));

					var $chap = $('#input-box').children('div').eq(i).find('.subTitle-box');

					for(var j=sum; j<=sum+info[i][1]; j++){
						$chap.eq(j-sum).children('input[type=hidden]').eq(0).attr('name', 'cvList[' + (j-1) + '].videoNo');
						$chap.eq(j-sum).children('input[type=hidden]').eq(1).attr('name', 'cvList[' + (j-1) + '].classNo');
						$chap.eq(j-sum).children('input[type=hidden]').eq(2).attr('name', 'cvList[' + (j-1) + '].chapOrder').val(i + 1);
						$chap.eq(j-sum).children('input[type=hidden]').eq(3).attr('name', 'cvList[' + (j-1) + '].videoOrder').val(j-sum+1);
						$chap.eq(j-sum).children('input[type=hidden]').eq(4).attr('name', 'cvList[' + (j-1) + '].originName');
						$chap.eq(j-sum).children('input[type=hidden]').eq(5).attr('name', 'cvList[' + (j-1) + '].changeName');
						$chap.eq(j-sum).children('input[type=file]').attr('name', 'cvList[' + (j-1) + '].upfile');
						$chap.eq(j-sum).children('.subTitle').text((i+1) + '.' + (j-sum+1));
						$chap.eq(j-sum).children('input[type=text]').attr('id', 'subTitle' + j).attr('name', 'cvList[' + (j-1) + '].subTitle');
					}
					sum += info[i][1];
				}

				afterCheck(cno, vno);
				
			})

			// classVideo List 화면에 뿌리기
			<c:if test="${fn:length(chList) ne 0}">
			$.ajax({
                url : "ajaxVideoList.te",
                type: "post",
                data : {
					classNo : ${ l.classNo }
                }, success : function(videoList){
					
					// 소제목 길이 저장 _ 로드시 첫화면과 vno 다름
					info[0][1] -=1;

					// 챕터 길이 배열 저장
					for(var i=2; i<=${fn:length(chList)}; i++){
						info.push([i, 0]);
						++cno;
					}

					for(var i in videoList){

						$('.chap' + videoList[i].chapOrder)
						.append('<div class="subTitle-box">' + 
							'<input type="hidden" name="cvList[' + i +'].videoNo" value="' + videoList[i].videoNo + '">' +
							'<input type="hidden" name="cvList[' + i +'].classNo" value="' + ${l.classNo} + '">' +
							'<input type="hidden" name="cvList[' + i +'].chapOrder" value="' + videoList[i].chapOrder + '">' +
										'<input type="hidden" name="cvList[' + i +'].videoOrder" value="' + videoList[i].videoOrder + '">' +
										'<div class="minus-img"></div>' +
										'<label class="subTitle">' + videoList[i].chapOrder + '.' +  videoList[i].videoOrder + '</label>' + 
										'<input type="text" id="subTitle' + (parseInt(i) + 1) +'" name="cvList[' + i + '].subTitle" class="form-control" style="width:350px; height:40px; margin-bottom: 10px; display: inline;" ' +
										'placeholder="소제목을 입력해주세요." value="'+ videoList[i].subTitle + '">' + 
										'<input type="file" name="cvList[' + i +'].upfile" onchange="loadOriginName(this);">' +
										'<input type="hidden" name="cvList[' + i +'].originName" value="' + videoList[i].originName + '">' +
										'<input type="hidden" name="cvList[' + i +'].changeName" value="' + videoList[i].changeName + '">' +
										'<div class="video-img">' + videoList[i].originName + '</div>'
										+ '</div>');
										
						// info
						info[videoList[i].chapOrder-1][1] += 1;
					}

					sum = 1;

					for(var i=0; i<cno; i++){

						$('#input-box').children('div').eq(i).find('.chap-head').text('챕터' + (i+1));
						$('#input-box').children('div').eq(i).find('input[type=hidden]').eq(0).attr('name', 'chList[' + i + '].chapOrder').val(i + 1);
						$('#input-box').children('div').eq(i).find('input[type=hidden]').eq(1).attr('name', 'chList[' + i + '].classNo');
						$('#input-box').children('div').eq(i).find('input[type=text]').eq(0).attr('name', 'chList[' + i + '].chapName').removeAttr('id').attr('id', 'chapName' + (i + 1));

						var $chap = $('#input-box').children('div').eq(i).find('.subTitle-box');
							
						for(var j=sum; j<=sum+info[i][1]; j++){
							$chap.eq(j-sum).children('input[type=hidden]').eq(0).attr('name', 'cvList[' + (j-1) + '].videoNo');
							$chap.eq(j-sum).children('input[type=hidden]').eq(1).attr('name', 'cvList[' + (j-1) + '].classNo');
							$chap.eq(j-sum).children('input[type=hidden]').eq(2).attr('name', 'cvList[' + (j-1) + '].chapOrder').val(i + 1);
							$chap.eq(j-sum).children('input[type=hidden]').eq(3).attr('name', 'cvList[' + (j-1) + '].videoOrder').val(j-sum+1);
							$chap.eq(j-sum).children('input[type=hidden]').eq(4).attr('name', 'cvList[' + (j-1) + '].originName');
							$chap.eq(j-sum).children('input[type=hidden]').eq(5).attr('name', 'cvList[' + (j-1) + '].changeName');
							$chap.eq(j-sum).children('.subTitle').text((i+1) + '.' + (j-sum+1));
							$chap.eq(j-sum).children('input[type=text]').attr('id', 'subTitle' + j ).attr('name', 'cvList[' + (j-1) + '].subTitle');
							$chap.eq(j-sum).children('input[type=file]').attr('name', 'cvList[' + (j-1) + '].upfile');
						}
						sum += info[i][1];
					}

					$('.video-img')
					.css('background-size', 0)
					.css('padding-left', 0)
					.css('width', '130px')
					.css('text-overflow', 'ellipsis');
					
					// 처음 조건 검사
					cno = info.length;
					vno = 0;
					
					for(var i=0; i<cno; i++){
						vno += info[i][1];
					}
					
					beforeCheck(cno, vno);

	//				$('input[name=beforeVno]').val(info);
				}, error : function(){

					
				}
            });
			</c:if>
			
			// 작성 중 검사실행
			$(document).on('keyup', 'input[type=text]', function(){
				afterCheck(cno, vno);
			})

			$(document).on('change', 'input[type=file]', function(){
				afterCheck(cno, vno);
			})

			
		})
		// 4. 비디오 추가 버튼 -> input file 연계
		$(document).on('click', '.video-img', function(){
			$(this).siblings('input[type=file]').click();
		})

		// 5. 비디오 원본명 뽑아서 입력
		function loadOriginName(e){
			$(e).siblings('.video-img')
					.css('background-size', 0)
					.css('padding-left', 0)
					.css('width', '130px')
					.css('text-overflow', 'ellipsis')
					.text(e.files[0].name);
		}

		// 6. 처음 로드 시 조건검사
		function beforeCheck(cno, vno){
			
			// 챕터명 길이 검사
			for(var i=1; i<=cno; i++){

				var length = $('#chapName' + i).val().length;
				if(length < 3){
					return false;
				}
			}

			// 부제목, 원본명 길이 검사
			for(var i=1; i<=vno; i++){

				var length = $('#subTitle' + i).val().length;
				if(length < 3){
					return false;
				}

				if($('#subTitle' + i).siblings('.video-img').text().length < 2){
					return false
				}

			}
			
			checkSuccess();
		}

		// 7. 작성 중 조건검사
		function afterCheck(cno, vno){
			$('#save-btn').attr('disabled', true);
			
			// 챕터명 길이 검사
			for(var i=1; i<=cno; i++){

				var chapter = $('#chapName' + i).val();

				if(isEmpty(chapter)){
					return false;
				}

				if(chapter.length < 3){
					return false;
				}
			}
			
			// 부제목, 원본명 길이 검사
			for(var i=1; i<=vno; i++){
				
				var subTitle = $('#subTitle' + i).val();
				if(isEmpty(subTitle)){
					return false;
				}
				if($('#subTitle' + i).siblings('.video-img').text().length < 3 || subTitle.length < 3){
					return false
				}

			}

			checkSuccess();
		}
	</script>
	
	<jsp:include page="common/lectureEnrollFormFooter.jsp"/>
</div>
</body>
</html>