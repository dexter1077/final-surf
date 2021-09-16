<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

(function( $ ) {
	$(document).ready(function() {
		$('#studyContent').summernote({
			toolbar : [
				['fontname',['fontname']],
				['style',['bold','italic','underline','clear']],
				['font',['strikethrough']],
				['fontsize',['fontsize']],
				['color',['color']],
				['para',['ul','ol','paragraph']],
				['table',['table']],
				['insert',['link']]	/*사진 업로드하려면 picture 추가*/
			],
			height : 500,
			disableResizeEditor :true,
			lang : "ko-KR"
		});
	});
})( jQuery );
</script>



<title>스터디 모집하기</title>

<style>
#studyEnroll>div {
	float: left;
}

#studyGuide::first-line {
	font-size: 18px;
	font-weight: bolder;
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
				<br> 같은 클래스를 듣거나, 관심사를 지닌 사람들과 스터디를 만들어보세요.<br> 함께 공부하면
				실력도 두배 재미도 두배랍니다!
			</div>
			<hr style="background-color: rgb(32, 155, 212); height: 2px;">
		</div>


		<div style="width: 750px; margin: auto;">
			<div id="studyGuide">
				스터디 모집하기 <br> 아래 양식에 맞춰 스터디 모집 글을 작성해주세요.
			</div>
			<br>

			<!--모집글 작성부-->
			<div id="studyEnroll">
				<form action="insert.sb" method="post">
					<input type="hidden" name="userNo" value="${loginUser.userNo }">
					<div class="form-group">
						<label for="title">제목</label>
						<br> 
						<input type="text" class="form-control" id="title" name="studyTitle" style="width: 50%; display: inline-block;" required> 
						<label class="writerInfo" style="display: inline-block; margin-left: 70px;">
							작성자 : ${ loginUser.nickname } &nbsp;&nbsp;&nbsp; 작성일 : <span id="today"></span>
						</label>
						
						<!-- 오늘날짜 표기 -->
						<script>
							$(function(){
								var date = new Date();
								var today = date.getFullYear() +'. ' + (date.getMonth()+1) +'. ' + date.getDate() + '.';
								$("#today").text(today);
							})
						</script>
						
					</div>
					<!-- summernote 적용 -->
					<div class="form-group">
						<label for="studyContent">내용</label>
						<textarea id="studyContent" name="studyContent" class="form-control" required>
							<br>
							<b>▶ 주제</b><br>
							: 
							<br><br>
							
							<b>▶ 목표</b><br>
							: 
							<br><br>
							
							<b>▶ 일정(횟수)</b><br>
							: 주 0회 
							<br><br>
							
							<b>▶ 커리큘럼(간략하게)</b>
							<ul>
							    <li>커리큘럼1</li>
							    <li>커리큘럼2</li>
							    <li>...</li>
							</ul>
							<br><br>
							
							<b>▶ 모집인원</b><br>
							: 0 명
							<br><br>
							
							<b>▶ 소개 / 개설 이유</b><br>
							: 
							<br><br>
							
							<b>▶ 주의사항</b><br>
							: 
							<br><br>
							
							<b>▶ 지원방법</b><br>
							: 
							
							<br><br><br>
                        </textarea>
					</div>
					<div align="right">
						<button type="submit" class="btn btn-info"> 
							등록하기 <i class="fas fa-check"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>

	<jsp:include page="../common/footer.jsp" />


</body>
</html>