<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 조회 및 답변</title>
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

#inquiry-wrap {
	margin-top: 10px;
	margin-left: 40px;
	width: 900px;
}

.horizontal-line {
	float: left;
	border-bottom: 1px solid lightgray;
	width: 100%;
	margin: 15px 0px;
}

#inquiry-class {
	margin-left: 10px;
	font-weight: 600;
	font-size: 17px;
	width: 97%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#user-img {
	background: url("resources/images/user_icon1.png") no-repeat;
	background-size: cover;
	margin-left: 20px;
	width: 40px;
	height: 40px;
	border-radius: 70%;
	border: 0px;
	float: left;
}

#user-name {
	float: left;
	margin-top: 8px;
	margin-left: 10px;
	font-weight: 600;
	font-size: 17px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#create-date {
	float: left;
	margin-top: 8px;
	margin-left: 660px;
	font-weight: 600;
}

#inquiry-text {
	float: left;
	margin-top: 20px;
	margin-left: 30px;
	margin-bottom: 10px;
	width: 840px;
	height: 270px;
	overflow-y: scroll;
}

#answer-wrap>label {
	float: left;
}

#teacher-img {
	float: left;
}

#teacher-img img {
	background: lightgray;
	background-size: cover;
	margin-left: 10px;
	width: 40px;
	height: 40px;
	border-radius: 70%;
	border: 0px;
}

#teacher-name {
	float: left;
	margin-top: 8px;
	margin-left: 10px;
	font-weight: 600;
	font-size: 17px;
	width: 120px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#answer {
	float: left;
	margin-top: 8px;
	margin-bottom: 4px;
	margin-left: 10px;
	width: 570px;
	height: 170px;
	resize: none;
	overflow-y: auto;
}

#ans-date {
	float: left;
	margin-top: 8px;
	margin-left: 25px;
	font-weight: 600;
}

#answer-wrap button {
	margin-left: 40px;
	width: 60px;
}

#m-btn {
	margin-top: 80px;
}

#w-btn, #d-btn, #c-btn {
	margin-top: 8px;
}

#inquiry-content>button {
	float: right;
	margin-right: 15px;
	width: 60px;
}
</style>
</head>
<body>

	<jsp:include page="common/teacherPage.jsp" />

	<div id="content">
		<div id="page-title">클래스 관리 > 문의 조회 및 답변</div>

		<div id="inquiry-wrap">
			<div class="horizontal-line"></div>
			<div id="inquiry-class">문의 클래스 : ${ i.classTitle }</div>
			<div class="horizontal-line"></div>
			<div id="inquiry-content">
				<div id="user-img"></div>
				<div id="user-name">${ i.userNo }</div>
				<div id="create-date">${ i.inqDate }</div>
				<div id="inquiry-text">${ i.inqContent }</div>
				<div class="horizontal-line"></div>


				<div id="answer-wrap">
					<label for="answer">
						<div id="teacher-img">
							<c:choose>
								<c:when test="${ empty i.teacherImage }">
									<img src="resources/images/user_icon1.png">
								</c:when>
								<c:otherwise>
									<img src="${ i.teacherImage }">
								</c:otherwise>
							</c:choose>
						</div>
						<div id="teacher-name">${ i.teacherNo }</div>
					</label>

					<form id="ansForm" action="updateAnswer.te" method="post">
						<input type="hidden" name="inquiryNo" value="${ i.inquiryNo }">
						<textarea class="form-control" rows="7" id="answer"
							name="ansContent" placeholder="답변 내용을 입력해주세요." required>${ i.ansContent }</textarea>
						<button type="submit" class="btn btn-primary btn-sm" id="w-btn">수정</button>
					</form>
					<button type="button" class="btn btn-secondary btn-sm" id="c-btn">취소</button>
					<script>
						var prePage = document.referrer;
						$(function(){
			           		$("#c-btn").click(function(){
			           			window.location.href = prePage;
			           		})
			           	})
					</script>
				</div>

				<div class="horizontal-line"></div>
				<button type="button" class="btn btn-secondary btn-sm"
					onclick="location.href='classInquiry.te'">목록</button>

			</div>
		</div>
	</div>
	</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>