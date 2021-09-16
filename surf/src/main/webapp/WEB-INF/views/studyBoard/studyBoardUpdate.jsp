<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<!-- include summernote css/js -->
<link
	href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>




<script>
        //JQuery 충돌 처리를한다 (function( $ ) { })( jQuery );
        jQuery.noConflict();

        (function ($) {
            $(document).ready(function () {
                $('#studyContent').summernote({
                    toolbar: [
                        ['fontname', ['fontname']],
                        ['style', ['bold', 'italic', 'underline', 'clear']],
                        ['font', ['strikethrough']],
                        ['fontsize', ['fontsize']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['table', ['table']],
                        ['insert', ['link']]	/*사진 업로드하려면 picture 추가*/
                    ],
                    height: 500,
                    disableResizeEditor: true,
                    lang: "ko-KR"
                });
            });
        })(jQuery);
    </script>


<style>
#studyDetailTop>div {
	float: left;
}

.writerInfo {
	font-size: 12px;
	margin-left: 10px;
	margin-top: 5px;
	color: rgb(94, 94, 94);
}

#studyGuide::first-line {
	font-size: 18px;
	font-weight: bolder;
}

#studyEnroll>div {
	float: left;
}

#recruitOrNot {
	display: inline-block;
	height: 40px;
	line-height: 40px;
	margin-right: 440px;
}

input[name=recruit] {
	width: 15px;
	height: 15px;
}

/*뒤로가기버튼*/
#goBackBtn {
	position: fixed;
	z-index: 998;
	margin-left: 120px;
	font-size: 12px;
	border-radius: 10px;
	padding: 8px 12px 8px 12px;
	border: 1px solid lightgrey;
	color: rgb(94, 94, 94);
	background-color: rgba(0, 0, 0, 0);
}

#goBackBtn:hover {
	opacity: 0.7;
}
</style>


</head>
<body>


	<jsp:include page="../common/header.jsp" />

	<div class="body-outer">
		<br>
		<br>

		<div class="long-title">
			함께 공부해요!
			<div style="font-size: 15px; font-weight: normal;">
				<br> 같은 클래스를 듣거나, 관심사를 지닌 사람들과 스터디를 만들어보세요.<br> 
				함께 공부하면 실력도 두배 재미도 두배랍니다!
			</div>
			<hr style="background-color: rgb(32, 155, 212); height: 2px;">
		</div>
		
		<!--뒤로가기 버튼-->
		<button id="goBackBtn" onclick="location.href='detail.sb?sno=${s.studyNo}';">
			<i class="fa fa-mail-reply"></i>
		</button>

		<div style="width: 750px; margin: auto;">
			<div id="studyGuide">
				스터디 모집글 수정 <br>
				모집글 양식을 유지하며 수정해주세요.
			</div>
			<br>

			<!--모집글 작성부-->
			<div id="studyEnroll">
				<form action="update.sb" method="post">
					<input type="hidden" name="studyNo" value="${ s.studyNo }">
					<div class="form-group">
						<label for="title">제목</label> <br>
						<input type="text" class="form-control" id="title" value="${ s.studyTitle }" name="studyTitle"style="width: 50%; display: inline-block;"> 
						<label class="writerInfo" style="display: inline-block; margin-left: 70px;">
							작성자 : ${ s.writer } &nbsp;&nbsp;&nbsp; 수정일 : <span id="today"></span>
						</label>
						<script>
							$(function(){
								var date = new Date();
								var today = date.getFullYear() + '. ' + (date.getMonth()+1) + '. ' + date.getDate() + '.';
								$("#today").text(today);
							})
						</script>
					</div>
					<!-- summernote 적용 -->
					<div class="form-group">
						<label for="studyContent">내용</label>
						<textarea name="studyContent" id="studyContent" class="form-control">
							${ s.studyContent }
                        </textarea>
					</div>
					<div align="right">
						<div id="recruitOrNot">
							<div class="form-check-inline">
								<input type="radio" class="form-check-input" name="recruit" id="openGather" value="Y"> 
								<label for="openGather"> 
									<img style="width: 50px;" src="https://img.shields.io/badge/모집중-00B388?style=flat-square&&logoColor=white" />
								</label>
							</div>
							<div class="form-check-inline">
								<input type="radio" class="form-check-input" name="recruit"	id="closeGather" value="N"> 
								<label for="closeGather"> 
									<img style="width: 60px;" src="https://img.shields.io/badge/모집완료-6E6E6E?style=flat-square&&logoColor=white" />
								</label>
							</div>
						</div>
						
						<script>
							$(function(){
								$(":radio[value=${s.recruit}]").attr("checked", true);
							})
						</script>
						
						

						<button type="submit" class="btn btn-warning">
							수정하기 <i class="fas fa-check"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		<br><br><br><br><br>
	</div>
</body>

</html>