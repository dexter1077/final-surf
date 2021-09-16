<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="body-outer">

		<br><br>
		<!-- 회원 개인 메뉴바 -->
		<jsp:include page="memberMenubar.jsp" />

		<!-- 바디 화면 -->
		<div id="mem-body" style="width: 998px;">

			<div class="sm-title">
				회원탈퇴
				<hr style="background-color: rgb(32, 155, 212); height: 2px;">
			</div>


			<div style="width: 450px; height: 300px; margin: auto; margin-top: 60px;">

				<div align="center">
					<div>
						즐거운 서핑되셨나요? <br>
						그동안 서프를 이용해주셔서 감사합니다.
					</div>
					<br><br>
					<i class='far fa-grin-tears' style='font-size:100px; color: rgb(36, 122, 162);'></i>
				</div>
			</div>
		</div>

		<br><br><br><br><br>
	</div>


	<jsp:include page="../common/footer.jsp" />
</body>

</html>