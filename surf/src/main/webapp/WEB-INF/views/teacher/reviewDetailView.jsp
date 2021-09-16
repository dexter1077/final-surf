<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 후기 조회</title>
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

#review-wrap {
	margin-top: 15px;
	margin-left: 40px;
	width: 900px;
}

.horizontal-line {
	float: left;
	border-bottom: 1px solid lightgray;
	width: 100%;
	margin: 15px 0px;
}

#review-class {
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
	width: 200px;
}

#star-score {
	float: left;
	width: 100px;
	margin-top: 10px;
	margin-left: 390px;
}

#star-score img {
	float: left;
	width: 20px;
	margin: 0px;
	padding: 0px;
}

#create-date {
	float: left;
	margin-top: 8px;
	margin-left: 30px;
	font-weight: 600;
}

#review-content {
	float: left;
	margin-top: 20px;
	margin-left: 30px;
	margin-bottom: 23px;
	width: 840px;
	height: 440px;
	overflow-y: scroll;
}

#review-wrap button {
	float: right;
	margin-right: 15px;
	width: 60px;
}
</style>
</head>
<body>

	<jsp:include page="common/teacherPage.jsp" />

	<div id="content">
		<div id="page-title">클래스 관리 > 수강 후기 조회</div>

		<div id="review-wrap">
			<div class="horizontal-line"></div>
			<div id="review-class">수강 클래스 : ${ s.classTitle }</div>
			<div class="horizontal-line"></div>
			<div>
				<div id="user-img"></div>
				<div id="user-name">${ s.userNo }</div>
				<div id="star-score"></div>
				<script>
					$(document).ready(function(){
						var score = "<c:out value='${s.score}'/>";
						for (var i = 0; i < score; i++) {
							var star = "<img src=\"https://img.icons8.com/color/48/000000/filled-star--v1.png\" />";
							$("#star-score").append(star);
						}
		           	})
				</script>
					
				<div id="create-date">${ s.createDate }</div>
				<div id="review-content">${ s.review }</div>
				<div class="horizontal-line"></div>
				<button type="button" class="btn btn-secondary btn-sm" id="prePage">목록</button>
				<script>
					var prePage = document.referrer;
					$(function(){
	            		$("#prePage").click(function(){
	            			window.location.href = prePage;
	            		})
	            	})
				</script>
			</div>
		</div>
	</div>
	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>