<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강사 정보 수정</title>
	<style>
		.title {
			font-size: 24px;
			font-weight: 600;
		}
		
		.content {
			font-family: 'Nanum Gothic', sans-serif;
			padding: 40px 0px 0px 40px;
		}

		.update-form-area {
			padding-top: 10px;
			width: 580px;
			height: 540px;
			border: 1px solid lightgray;
			border-radius: 3px;
			box-shadow: 3px 3px 3px rgba(184, 184, 184, 0.3);
		}

		.update-form-area>div{
			width: 100%;
		}

		.update-form-area>div:first-child {
			margin-top: 20px;
			margin-left: 20px;
			width: 100%;
			height: 200px;
		}
		.update-form-area>div:first-child div{
			float: left;
			height: 100%;
		}
		.update-form-area>div:first-child>div:first-child{
			width: 220px;
		}
		.update-form-area>div:first-child>div:last-child{
			width: 300px;
		}

		.update-form-area>div:last-child {
			width: 100%;
			padding-left: 40px;
		}

		.profile-imgArea {
			padding: 20px;
		}

		.profile-imgArea>img {
			width: 160px;
			height: 160px;
			border-radius: 80px;
		}

		.profile-imgArea>img:hover {
			cursor: pointer;
			opacity: 0.9;
		}

		.input-title {
			font-size: 18px;
			font-weight: 700;
		}

		/*유효성 검사 글귀*/
		.validityCheck {
			font-size: 12px;
			font-weight: 700;
			display: none;
		}
	</style>
</head>

<body>
	<jsp:include page="common/teacherPage.jsp" />

	<div class="content">
		<span class="title">강사 정보 수정</span>
		<br>
		<br>
		<form id="fileForm" action="ajaxUpdate.te" method="post" enctype="multipart/form-data"
			class="teacher-update-form">
			<div class="update-form-area">
				<div>
					<div class="profile-imgArea">
						<img src="${t.profileImage}">
					</div>
					<div>
						<input type="file" name="file" style="display:none;" onchange="loadProfileImage(this);">
						<span class="input-title">닉네임</span><br>
						<input type="text" class="form-control" name="nickname"
						style="width:300px; height: 40px; margin: 10px 0px 0px 0px;" value="${t.nickname}"
						placeholder="2-8글자 입력해주세요" maxlength="10" minlength="2">
						<span class="validityCheck nicknameCheck">message</span>
						<br>
						<span class="input-title">핸드폰 번호</span><br>
						<input type="text" class="form-control" name="phone"
						style="width:300px; height: 40px; margin: 10px 0px 0px 0px;" value="${t.phone}"
						placeholder="- 제외하고 입력해주세요" maxlength="11">
						<span class="validityCheck phoneCheck">message</span>
						<input type="hidden" name="profileImage" value="${t.profileImage}">
					</div>
				</div>
				<div>
					<br>
					<span class="input-title">강사님을 소개해주세요</span><br>
					<textarea class="form-control" name="introContent" placeholder="5글자 이상 입력해주세요"
						style="width:500px; height: 150px; margin: 10px 0px 10px 0px; resize: none;"
						minlength="5" maxlength="100">${t.introContent}</textarea>
					<br>
					<button type="button" id="submitBtn" class="btn btn-info" style="margin-left:440px;"
						onclick="return submitAjax();">저장</button>
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<script>
		// 1. 이미지 영역 클릭 시 파일 입력
		$(function () {
			$('.profile-imgArea>img').click(function () {
				$('input[name=file]').click();
			})

			// 이미지 없을 시 공동 template image
			var $image = $('.profile-imgArea').children('img');
			if ($image.attr('src') == '') {
				$image.attr("src", "resources/uploadFiles/profile_image/commonSample.png");
			}
		})

		// 2. 이미지 파일 미리 보기
		function loadProfileImage(inputFile) {

			if (inputFile.files.length == 1) {    //선택한 파일이 존재하는 경우
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function (e) { $(inputFile).parents('.update-form-area').find('img').attr("src", e.target.result); }
			} else {
				$(inputFile).parents('.update-form-area').find('img').attr("src", "resources/uploadFiles/profile_image/commonSample.png");
			}
		}

		// 3. 유효성 체크
		$(function () {
			// 1_1. 닉네임 입력하는 input요소객체 
			var $ncInput = $(".update-form-area input[name=nickname]");

			// 1_2. 닉네임 중복검사
			$ncInput.keyup(function () {
				// 우선 최소 2글자 이상으로 입력했을때 ajax요청중복체크 
				if ($ncInput.val().length >= 2) {
					$.ajax({
						url: "ajaxNicknameCheck.te",
						type: "post",
						data: { 
							nickname: $ncInput.val(),
							teacherNo : ${t.teacherNo}
						}, success: function (result) {

							if (result == "NNNNN") { // 사용불가능
								// => 빨간색 메세지(사용불가능) 출력  display:block
								$(".nicknameCheck").show();
								$(".nicknameCheck").css("color", "red").text("중복된 닉네임이 존재합니다. 다시 입력해주세요.");
								$('#submitBtn').attr('disabled', true);
							} else { // 사용가능
								// => 초록색 메세지(사용가능) 출력
								$(".nicknameCheck").show();
								$(".nicknameCheck").css("color", "green").text("멋진 닉네임이네요!");
								$('#submitBtn').removeAttr('disabled');
							}

						}, error: function () {
							console.log("아이디 중복체크용 ajax 통신 실패");
						}
					});

				} else {
					// 메세지 보여지지 않고, 버튼 비활성화
					$("#checkResult").hide();
					$("#submitBtn").attr("disabled", true);
					$(".nicknameCheck").show();
					$(".nicknameCheck").css("color", "red").text("2글자 이상 입력해주세요");
					$('#submitBtn').attr('disabled', true);
				}

			})
			
			// 2. 핸드폰 입력하는 input요소객체
			var $phInput = $(".update-form-area input[name=phone]");
			var regExp = /^[0-9]+$/;

			// 2_1. 핸드폰 입력데이터 검사
			$phInput.keyup(function () {

				if (regExp.test($phInput.val())) {
					$(".phoneCheck").hide();
				} else {
					var endIndex = ($phInput.val().length - 1);

					$(".phoneCheck").show();
					$('.phoneCheck').css("color", "red").text("'숫자'만 입력해주세요");
					$phInput.val($phInput.val().substring(0, endIndex));
				}
			})
		})


		function submitAjax() {
			var phoneLength = $('input[name=phone]').val().length;
			var contentLength = $('textarea[name=introContent]').val().length;
			var extImage = $('.profile-imgArea>img').attr('src');

			if (phoneLength < 11) { // 핸드폰 글자 11글자 충족 xx
				alertify.alert("핸드폰 번호를 제대로 입력해주세요");
				return false;
			} else if (contentLength < 5) { // content 5글자 이하
				alertify.alert("소개글을 5자이상 입력해주세요");
				return false;
			} else if (extImage == "resources/uploadFiles/profile_image/commonSample.png") { // 이미지x
				alertify.alert("프로필 이미지를 등록해주세요");
				return false;
			}

			$.ajax({
				type: 'post',
				url: 'ajaxUpdate.te',
				data: new FormData($('#fileForm')[0]),
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false
				, success: function () {
					alertify.alert("회원 정보가 정상적으로 저장되었습니다.");
					loadTeacherImage();
				}, error: function () {

				}
			});

		}
	</script>
</body>

</html>