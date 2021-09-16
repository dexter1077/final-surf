<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
.body-outer>div {
	float: left;
}
</style>

</head>

<body>

	<jsp:include page="../common/header.jsp" />

	<div class="body-outer">

		<br> <br>
		<!-- 회원 개인 메뉴바 -->
		<jsp:include page="memberMenubar.jsp" />

		<!-- 바디 화면 -->
		<div id="profile" style="width: 998px;">
			<!-- 소제목 -->
			<div class="sm-title">
				프로필 관리
				<hr style="background-color: rgb(32, 155, 212); height: 2px;">
			</div>

			<!------------------------------ 프로필 정보(닉네임,성별,나이)변경 ---------------------------------->
			<div style="width: 450px; height: 680px; margin: auto;">
				<div class="container">
					<!-- 닉네임 설정 -->
					<div class="form-group">
						<label for="nickName">닉네임 설정</label> 
						<input type="text" class="form-control user-info" id="nickname" name="nickname"
							value="${ loginUser.nickname }" placeholder="닉네임" required>
					</div>
					<!-- 성별 -->
					<label class="mt-2" style="margin-right: 117px;">성별</label>
					<div class="form-check-inline" id="genderRadio">
						<label class="form-check-label mr-5" for="male"> 
						<input type="radio" class="form-check-input user-info" id="male" name="gender" value="M">남자
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label" for="female"> 
						<input type="radio" class="form-check-input user-info" id="female" name="gender" value="F">여자
						</label>
					</div>

					<script>
                        	$(function(){
                        		$("input[value=${loginUser.gender}]").attr("checked", true);
                        	})
                    </script>

					<!-- 연령대 -->
					<div class="form-group">
						<label class="mt-4" for="agelist"
							style="display: inline-block; margin-right: 100px;">연령대</label> <select
							class="form-control user-info" id="ageRange" name="ageRange"
							style="display: inline-block; width: 35%;">
							<option>10</option>
							<option>20</option>
							<option>30</option>
							<option>40</option>
							<option>50</option>
							<option>60</option>
						</select>
					</div>

					<script>
                        	$(function(){
                        		$("option").each(function(){
                        			var age = $(this).val();
                        			if(age == ("${loginUser.ageRange}")){
                        				$(this).attr("selected", true);
                        			}
                        		})
                        	})
                    </script>

					<!-- 저장 버튼 -->
					<div class="text-center">
						<button disabled id="info-enter" type="button"
							class="btn btn-primary mt-2" style="width: 50%;">저장</button>
					</div>

					<script>
					// 회원정보 변경
                    	$(function(){
                    		$("#info-enter").on("click", function(){
                    			if(confirm("회원정보를 변경하시겠습니까?")){
                    				$.ajax({
                    					url:"updateInfo.do",
                    					type:"post",
                    					data:{
                    						email:'${loginUser.email}',
                    						nickname:$("#nickname").val(),
                    						gender:$("input[type = radio]:checked").val(),
                    						ageRange:$("#ageRange").val()
                    						},
                   						success:function(updateUser){
                        						$("#nickName").text(updateUser.nickname);
                        						
                        						$("input[type=radio]").each(function(){
                        							if($(this).val() == updateUser.gender){
    	                    							$(this).attr("checked", true);
                        							}
                        						})
                        						
                        						$("option").each(function(){
                        							if($(this).val() == updateUser.ageRange){
                        								$(this).attr("selected", true);
                        							}
                        						})
       						                    $("#info-enter").attr("disabled", true);
                    							alert("회원정보가 성공적으로 변경되었습니다.");
                    						
                    					}, error:function(){
                    						console.log("ajax통신실패");
                    					}
                    				})
                    			}
                    		})
                    	})
                    </script>

				<!--------------------------- 비밀번호 변경(local가입 회원만 보임) -------------------------------->
				<c:if test="${ loginUser.enrollType eq 'L' }">
					<!-- 현재 비밀번호 -->
					<div class="form-group">
						<label class="mt-2" for="userPwd">현재 비밀번호</label> 
						<input type="password" class="form-control" id="userPwd" name="oldPwd" placeholder="현재 비밀번호" required>
					</div>

					<!-- 새 비밀번호 -->
					<div class="form-group">
						<label class="mt-2" for="newPwd">새 비밀번호</label> 
						<input id="newPwd" type="password" class="form-control pwd"	name="password" placeholder="새로운 비밀번호" required>
					</div>

					<!-- 새 비밀번호 확인 -->
					<div class="form-group">
						<label class="mt-2" for="checkNewPwd">새 비밀번호 확인</label> 
						<input type="password" class="form-control pwd" id="checkNewPwd" name="checkNewPwd" placeholder="새로운 비밀번호" required>
					</div>
					<!-- submit 버튼 -->
					<div class="text-center">
						<button disabled id="pwd-enter" type="button" class="btn btn-primary mt-2" style="width: 50%;">저장</button>
					</div>
					
					<script>
						$(function(){
							// 현재 비밀번호 확인
							$("#pwd-enter").on("click", function(){
								$.ajax({
									url:"pwdCheck.me",
									type:"post",
									data:{
										oldPwd:$("#userPwd").val()
									}, success:function(result){
										if(result == "YY"){
											if(confirm("비밀번호를 변경하시겠습니까?")){
												updatePwd();
											}
										}else{
											alert("현재 비밀번호가 일치하지 않습니다.");
										}
										
									}, error:function(){
										console.log("비밀번호확인 ajax통신 실패");
									}
								})
							})
							
							// 현재비밀번호 맞으면 비밀번호 변경
							function updatePwd(){
								$.ajax({
									url:"updatePwd.do",
									type:"post",
									data:{
										email:'${loginUser.email}',
										password:$("#newPwd").val()
									}, success:function(result){
										if(result == "YYY"){
											$("input[type=password]").val("");
											alert("비밀번호가 성공적으로 변경되었습니다.");
					                        $("#pwd-enter").attr("disabled", true);
										}else{
											alert("비밀번호 변경에 실패했습니다. 관리자에게 문의바랍니다.");
										}
									}, error:function(){
										console.log("비밀번호변경 ajax통신 실패");
									}
								})
							}
						})
					</script>
				</c:if>
					
					<div class="text-center">
						<button type="button" class="btn btn-secondary mt-2" style="width: 50%;" onclick="location.href='deleteView.me';">회원 탈퇴</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>

	<!-------------------------------- 저장버튼 활성화관련 ---------------------------------->
	<script>
        $(function () {


            $(".pwd").keyup(function () {
                var pwd1 = $("#newPwd").val();
                var pwd2 = $("#checkNewPwd").val();

                if (pwd1 != "" || pwd2 != "") {

                    if (pwd1 == pwd2) {
                        $("#pwd-enter").attr("disabled", false);
                    } else {
                        $("#pwd-enter").attr("disabled", true);
                    }
                }
            })


            $(".user-info").change(function () {
                $("#info-enter").attr("disabled", false);
            })


            $("#nickName").keyup(function () {

                if ($("#nickName").val() != "") {
                    $("#info-enter").attr("disabled", false);
                } else {
                    $("#info-enter").attr("disabled", true);
                }
            })
        })

    </script>


	<jsp:include page="../common/footer.jsp" />


</body>

</html>