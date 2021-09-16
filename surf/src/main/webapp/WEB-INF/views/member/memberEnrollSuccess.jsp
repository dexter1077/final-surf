<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<style>
        .easyLogin{
            height: 35px; 
            width: 45%; 
            font-size: 13px; 
            padding: 0 8px 0 0; 
            line-height: 33px; 
            margin-bottom: 3px;
        }
	</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="body-outer">
		<br><br>

		<div class="sm-title">
			회원가입
			<hr style="background-color: rgb(32, 155, 212); height: 2px;">
		</div>


		<div style="width: 450px; height: 400px; margin:auto; boder:1px solid; margin-top: 60px;" align="center">

			<div align="center">
				<h5><b style="text-align: center;">회원가입이 성공적으로 완료되었습니다.</b></h5>
				<br>
				<div>
					서프와 함께 취미의 바다에서 즐거운 서핑을 즐겨보세요! <br>
					감사합니다.
				</div>
				<br><br>
				<div class="text-center">
					<a href="" class="btn btn-primary mt-2" style="width: 50%;" data-toggle="modal"
						data-target="#loginModal">로그인</a>
				</div>

			</div>
		</div>

		<!-- 로그인 modal -->
		<!-- The Modal -->
		<div class="modal fade" id="loginModal" align="center">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h6 class="modal-title">로그인</h6>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="">
							<div class="input-group mb-3 mp-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fa fa-user"></i>
									</span>
								</div>
								<input type="text" class="form-control loginInputs" placeholder="아이디" id="usr"
									name="username">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fa fa-lock"></i>
									</span>
								</div>
								<input type="password" class="form-control loginInputs" placeholder="비밀번호" id="pwd"
									name="username">
							</div>
							<div>
								<div class="hr-sect" style="font-size: 13px; color: rgb(94, 94, 94);">간편로그인</div>
							</div>
                            <button type="button" class="btn btn-warning loginButtons easyLogin" style="background-color: #FFCD00;">
                                <img style="width: 42px; height: 30px;" src="https://img.shields.io/badge/-FFCD00?style=flat-square&logo=KakaoTalk&logoColor=black" />
                                                                      카카오
                            </button>
                            <button type="button" class="btn btn-success loginButtons easyLogin" style="background-color: #03C75A;">
                                <img style="width: 42px; height: 30px;" src="https://img.shields.io/badge/-03C75A?style=flat-square&logo=Naver&logoColor=white" />
                                                                      네이버
                            </button>
							<button type="submit" class="btn btn-primary loginButtons" style="width: 93%;">로그인</button>
							<button type="button" class="btn btn-secondary loginButtons" style="width: 93%;">아이디/비밀번호
								찾기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 로그인 modal 끝 -->
		<br><br><br><br><br>

	</div>

	<jsp:include page="../common/footer.jsp" />


</body>

</html>